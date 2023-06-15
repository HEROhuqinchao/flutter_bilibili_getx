///连接数据
var mysql = require('mysql')
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'bilibili',
    password: '123',
    database: '',
    charset: "utf8mb4", //表情符四个字节
    collate: "utf8mb4_unicode_ci",
})
///websocket服务器
const ws = require('nodejs-websocket')
///记录当前的在线的用户
var connectionMap = new Map()
const server = ws.createServer(conn => {
    ///获取连接进来的用身份户信息
    let token = JSON.parse(conn.headers.token)
    console.log("websocket connect:" + token.userId + "连进来了...")
    ///加到map
    connectionMap.set(token.userId, conn)
    ///查询待发的消息并发送
    let receiverId = token.userId
    connection.query(`SELECT * FROM mybilibili.my_wechat_message_cache where receiverId = \"${receiverId}\"`,
        function (err, rows, fields) {
            if (err) throw err
            rows.forEach(receivedData => {
                sendCacheMsg(receivedData, receiverId)
            })
        }
    )
    ///用户发送消息至服务
    conn.on('text', data => {
        /*
            接受消息格式
            {
                "users": ["user001", "user002"], ///发送给谁的列表
                "msg": "你好", ///发送内容
                "sender": "user002", ///发送人
                "date": "时间戳", ///时间
                "avatar": "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg" ///网络图片头像
            }
        */
        try {
            let receivedData = JSON.parse(data)
            // console.log(receivedData)
            sendUserMsg(receivedData)
        } catch (e) {
            console.log(data)
            console.log(e)
        }

    })
    ///用户断开连接
    conn.on('close', data => {
        connectionMap.delete(token.userId)
        console.log("websocket close:" + token.userId + "断开连接")
    })
    ///出错
    conn.on('error', data => {
        console.log("websocket error:" + token.userId + "出错了")
    })
})
server.listen(4000, () => {
    console.log("启动服务器")
})

///广播所有连接的对象
var broadcast = (msg) => {
    server.connections.forEach(item => {
        item.send(msg)
    })
}
///发送消息
var sendUserMsg = (receivedData) => {
    ///发送人Id
    let senderId = receivedData.sender;
    ///待发送人名单
    let users = receivedData.users
    ///发送给名单里面的人
    users.forEach(user => {
        let conn = connectionMap.get(user)
        ///判断是否在线，否则消息为待发送
        if (conn != null) {
            /*
                发送消息格式
                {
                    "msg": "你好", //发送内容
                    "sender": "user001" //发送者
                    "receiver": "user001" //接受者
                    "date": "123" //发送时间
                    "avatar": "..." //头像
                }
            */
            let sendData =
                `
                {
                    \"msg\": \"${receivedData.msg}\",
                    \"sender\": \"${receivedData.sender}\", 
                    \"receiver\": \"${user}\", 
                    \"date\": ${receivedData.date}, 
                    \"avatar\": \"${receivedData.avatar}\"
                }
            `
            conn.send(sendData)
        } else {
            ///如果不在线，则消息进入待发队列
            let messageContent = receivedData.msg
            // console.log(messageContent)
            let sendDate = receivedData.date
            let senderAvatar = receivedData.avatar
            users.forEach(receiverId => {
                let messageId = (new Date()).valueOf() + senderId + receiverId
                // console.log("接受者")
                // console.log(receiverId)
                connection.query(
                    `INSERT INTO mybilibili.my_wechat_message_cache (\`messageId\`, \`senderId\`, \`receiverId\`, \`messageContent\`, \`sendDate\`, \`senderAvatar\`) VALUES (\"${messageId}\", \"${senderId}\", \"${receiverId}\", \"${messageContent}\", \"${sendDate}\", \"${senderAvatar}\")`,
                    function (err, rows, fields) {
                        if (err) throw err

                    }
                )
            })
        }

    })
}
///发送待发消息后删除待发记录
var sendCacheMsg = (readyMsg) => {
    server.connections.forEach(item => {
        ///用户身份验证消息
        let token = JSON.parse(item.headers.token)
        ///接受者Id
        let receiverId = token.userId;
        if (readyMsg.receiverId == receiverId) {
            let sendData =
                `
                    {
                        \"msg\": \"${readyMsg.messageContent}\",
                        \"sender\": \"${readyMsg.senderId}\", 
                        \"receiver\": \"${readyMsg.receiverId}\", 
                        \"date\": ${readyMsg.sendDate}, 
                        \"avatar\": \"${readyMsg.senderAvatar}\"
                    }
                `
            item.send(sendData)
            ///删除记录
            let messageId = readyMsg.messageId
            connection.query(`DELETE FROM mybilibili.my_wechat_message_cache WHERE (\`messageId\` = \"${messageId}\")`, function (err, rows, field) {
                if (err) throw err
            })
        }
    })
}