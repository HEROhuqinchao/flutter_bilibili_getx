///网页服务器
// var http = require('http');
// http.createServer(function (request, response) {
//     // 发送 HTTP 头部
//     // HTTP 状态值: 200 : OK
//     // 内容类型: text/plain。并用charset=UTF-8解决输出中文乱码
//     response.writeHead(200, {'Content-Type': 'text/plain; charset=UTF-8'});
//     // 下句是发送响应数据
//     response.end('Hello World! 这是简单的web服务器测试。\n');
// }).listen(8888);
// console.log('Server running at http://127.0.0.1:8888/');

///websocket服务器
const ws = require('nodejs-websocket')
const server = ws.createServer(conn => {
    ///获取连接进来的用身份户信息
    let token = JSON.parse(conn.headers.token)
    console.log("websocket connect:" + token.userId + "连进来了...")
    ///用户发送消息至服务
    conn.on('text', data => {
        /*
            接受消息格式
            {
                "users": ["user002"], ///发送给谁的列表
                "msg": "你好", ///发送内容
                "sender": "user001" ///发送人
                "date": "2023.5.15", ///时间
                "avatar": "url" ///网络图片头像
            }
        */
        try {
            let receivedData = JSON.parse(data)
            console.log(receivedData)
            sendUserMsg(receivedData)
        } catch (e) {
            console.log(data)
            console.log(e)
        }

    })
    ///用户断开连接
    conn.on('close', data => {
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
    server.connections.forEach(item => {
        ///用户身份验证消息
        let token = JSON.parse(item.headers.token)
        ///发送人Id
        let userId = token.userId;
        ///待发送人名单
        let users = receivedData.users
        ///发送给名单里面的人
        users.forEach(user => {
            ///在名单中就发送消息
            if (userId == user) {
                /*
                    发送消息格式
                    {
                        "msg": "你好", //发送内容
                        "sender": "user001" //发送者
                        "date": "123" //发送时间
                        "avatar": "..." //头像
                    }
                */
                let sendData = 
                `
                    {
                        \"msg\": \"${receivedData.msg}\",
                        \"sender\": \"${receivedData.sender}\", 
                        \"date\": \"${receivedData.date}\", 
                        \"avatar\": \"${receivedData.avatar}\"
                    }
                `
                item.send(sendData)
            }
        })
    })
}