var util = require('./shared_util.js')
const express = require('express')
const app = express()
app.use(express.json())
const port = 3000
var mysql = require('mysql')
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'bilibili',
    password: '123',
    database: 'bilibili'
})

app.get('/', (req, res) => {
    res.send('服务3000')
})
//注册
app.post('/wechat/register', (req, res) => {
    let userId = (new Date()).valueOf()
    let tel = req.body.tel
    let userName = req.body.userName
    let password = req.body.password
    if (util.strIsNotEmpty(tel) && util.strIsNotEmpty(userName) && util.strIsNotEmpty(password)) {
        ///查询是否存在用户
        connection.query(
            `SELECT * FROM my_wechat_user where tel = \"${tel}\"`,
            function (err, rows, fields) {
                if (err) throw err
                if (rows.length != 0) {
                    res.send({
                        "code": 400,
                        "message": "用户存在"
                    })
                } else {
                    ///新增用户
                    connection.query(
                        `INSERT INTO my_wechat_user (\`userId\`, \`userName\`, \`tel\`, \`password\`) VALUES (\"${userId}\", \"${userName}\", \"${tel}\", \"${password}\")`,
                        function (err, rows, fields) {
                            if (err) throw err
                            res.send({
                                "code": 0,
                                "message": "注册成功"
                            })
                        }
                    )
                }
            }
        )
    } else {
        res.send({
            "code": 500,
            "message": "输入不能为空"
        })
    }
})
//登录
app.post('/wechat/login', (req, res) => {
    let tel = req.body.tel
    let password = req.body.password
    if (util.strIsNotEmpty(tel) && util.strIsNotEmpty(password)) {
        ///查询是否存在用户
        connection.query(
            `SELECT * FROM my_wechat_user where tel = \"${tel}\" && password = \"${password}\"`,
            function (err, rows, fields) {
                if (err) throw err
                if (rows.length != 0) {
                    res.send({
                        "code": 0,
                        "message": `欢迎${rows[0].userName}`,
                        "data": {
                            "userId": rows[0].userId, //用户id
                            "userName": rows[0].userName, //用户昵称
                            "avatar": rows[0].avatar, //头像
                        }
                    })
                } else {
                    res.send({
                        "code": 400,
                        "message": "用户不存在或者密码错误"
                    })
                }
            }
        )
    } else {
        res.send({
            "code": 500,
            "message": "输入不能为空"
        })
    }
})
//查询所有用户列表
app.get('/wechat/users', (req, res) => {
    connection.query(`SELECT userId, userName, avatar FROM my_wechat_user`, function (err, rows, fields) {
        if (err) throw err
        res.send({
            "code": 0,
            "message": "获取用户列表成功",
            "data": rows
        })
    })
})

app.listen(port, () => {
    connection.connect()
    console.log('服务3000启动...')
})
