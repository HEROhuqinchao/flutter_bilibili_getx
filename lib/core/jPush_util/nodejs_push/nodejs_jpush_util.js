// https://www.bookstack.cn/read/jpush/45.md
//极光推送推送消息
var JPush = require('../node_modules/jpush-async/lib/JPush/JPushAsync.js')
var client = JPush.buildClient('7d6d63fa06959ac31ff30914', '0b868b4950c5f3f8cbd4a7ce')
client.push().setPlatform(JPush.ALL)
    .setAudience(JPush.ALL)
    .setNotification('Hi, JPush', JPush.android('android alert', 'happy', 5))
    .send()
    .then(function(result) {
        console.log(result)
    }).catch(function(err) {
        console.log(err)
    })