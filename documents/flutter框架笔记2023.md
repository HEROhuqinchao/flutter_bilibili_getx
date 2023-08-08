[Toc]
## Flutter三棵树
### 三棵树
- widget树 (保存外观,位置等信息)
- Element树（绘制，包含build，保存state里面的信息）
- RenderObject树（若Element需要显示，则临时生成一个RenderObject）
### 关系
- Widget与Element是一一对应的（通过runtimeType 和 key关联）
## Key
### 种类
- LocalKey(ValueKey, ObjectKey, Unique Key)
- - ValueKey 比较一个数值
- - ObjectKey 比较对象
- - UniqueKey 唯一的key
- GlobalKey 
- - (globalKey.currentContext?.findRenderObject() as RenderBox).localToGlobal(Offset.zero);
  - (globalKey.currentState)
  - 可以获取到State/Widget/Element/Element关联的RenderObject
  - 从而获取到Widget的配置参数/State中的数据变量/RenderObject绘制信息,如尺寸位置约束
### 状态管理
#### Provider
##### 资料
[flutter 状态管理的学习，关于最基本的InheritedWidget](https://juejin.cn/post/7252231214723727397)
[[译] Flutter 核心概念详解： Widget、State、Context 及 InheritedWidget](https://juejin.cn/post/6844903784187953165)
##### InheritedWidget
###### 与生命周期的联系
链接到InheritedWidget的Widget，在每次重新构建该Widget时都会调用**didChangeDependencies**这个方法
#### Bloc
#### GetX