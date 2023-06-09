MyWeChatView说明文档

#### 技术
nodeJS（nodejs-websocket） +  flutter APP
#### 思路
##### NodeJS
 - 开启一个服务器
 - 服务器接受客户端发送来的数据，分析接受来的数据（分析出发送者、目的地、时间、消息、头像等等）
```
{
    "users": ["user001", "user002"], ///发送给谁的列表
    "msg": "你好", ///发送内容
    "sender": "user002", ///发送人
    "date": "2023.5.15", ///时间
    "avatar": "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg" ///网络图片头像
}
```
- 分发消息到对应的用户
```
{
    "msg": "你好", //发送内容
    "sender": "user001" //发送者
    "date": "123" //发送时间
    "avatar": "..." //头像
}
```
##### Flutter
- 界面UI效果
- - 收到消息滑动到底部
- - 点击输入框滑动到底部
- - 点击列表，取消输入焦点

