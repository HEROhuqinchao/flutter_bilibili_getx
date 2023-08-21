// import 'package:bilibili_getx/core/service/utils/constant.dart';
// import 'package:workmanager/workmanager.dart';
//
// // https://pub.dev/packages/workmanager
// ///后台任务处理
// class WorkManagerUtil {
//   @pragma('vm:entry-point')
//   static void callbackDispatcher() {
//     Workmanager().executeTask((taskName, inputData) {
//       print("Nativr called backgroud task: ");
//       return Future.value(true);
//     });
//   }
//
//   static Future initialize() async {
//     await Workmanager().initialize(
//       callbackDispatcher,
//       isInDebugMode: Constant.isDebug,
//     );
//     // await Workmanager().registerOneOffTask("task-identifier", "simpleTask");
//   }
//
//   ///只会运行一次的任务（One off task registration）
//   static void registerOneOffTask(String uniqueName, String taskName) {
//     Workmanager().registerOneOffTask(uniqueName, taskName,
//
//         ///处理取消，多个任务可以用同一个标记Tag
//         tag: "tag",
//
//         ///指示多次计划同一任务时的所需行为
//         ///Indicates the desired behaviour when the same task is scheduled more than once.
//         existingWorkPolicy: ExistingWorkPolicy.append,
//
//         ///延迟执行
//         initialDelay: const Duration(seconds: 10),
//         constraints: Constraints(
//           ///网络条件
//           networkType: NetworkType.connected,
//
//           ///低电池模式
//           requiresBatteryNotLow: true,
//
//           ///只会在充电时运行
//           requiresCharging: true,
//
//           ///设备空闲时运行
//           requiresDeviceIdle: true,
//
//           ///存储空间不能太低
//           requiresStorageNotLow: true,
//         ),
//
//         ///添加输入数据
//         inputData: {
//           'int': 1,
//           'bool': true,
//           'double': 1.0,
//           'string': 'string',
//           'array': [1, 2, 3]
//         },
//
//         ///用于指示工作管理器应以【指数】/【linear线性】方式增加退避时间
//         backoffPolicy: BackoffPolicy.exponential,
//
//         ///延迟一定时间
//         backoffPolicyDelay: const Duration(seconds: 10));
//   }
//
//   ///会间隔一段时间执行一次的任务（Periodic task registration）
//   static void registerPeriodicTask(Duration duration) {
//     Workmanager().registerPeriodicTask(
//       "periodic-task-identifier",
//       "simplePeriodicTask",
//       frequency: duration,
//     );
//   }
//
//   ///按Tag取消
//   static void cancelByTag() {
//     Workmanager().cancelByTag("tag");
//   }
//
//   ///按唯一标识取消
//   static void cancelByUniqueName() {
//     Workmanager().cancelByUniqueName("uniqueName");
//   }
//
//   ///取消掉所有
//   static void cancelAll() {
//     Workmanager().cancelAll();
//   }
// }
