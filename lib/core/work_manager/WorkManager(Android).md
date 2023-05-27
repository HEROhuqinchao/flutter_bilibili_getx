### WorkManager(Android)
#### 资料
https://developer.android.google.cn/topic/libraries/architecture/workmanager/basics?hl=zh-cn
#### 处理持久工作
- 立即执行
- 长时间运行
- 可延期执行
#### 使用
##### build.gradle （添加依赖）
``` java
dependencies {
	def work_version = "2.8.0"
	implementation "androidx.work:work-runtime:$work_version"
}
```
##### 定义Worker
```java
public static class UploadWorker extends Worker {
        public UploadWorker(@NonNull Context context, @NonNull WorkerParameters parameters) {
            super(context, parameters);
        }
        
        ///工作内容
        @NonNull
        @Override
        public Result doWork() {
            uploadImages();
            ///返回工作是否成功
            return Result.success();
            //return Result.failure();
            //return Result.retry();
        }
    
        private void uploadImages() {
    
        }
}
```
##### 创建WorkRequest（使用WorkManager调度Worker）
```java
WorkRequest uploadWorkRequest = new OneTimeWorkRequest.Builder(UploadWorker.class).build();
```
##### 将WorkRequest提交给System
```java
WorkManager.getInstance(WorkManagerTestActivity.this).enqueue(uploadWorkRequest);
```
##### 调度一次性工作
```java
WorkRequest myWorkRequest = OneTimeWorkRequest.from(MyWork.class);
WorkRequest uploadWorkRequest =
   new OneTimeWorkRequest.Builder(MyWork.class)
       // Additional configuration
       .build();
```
##### 调度定期工作
```java
///定时工作(每小时最后的15分钟运行定期工作）
        PeriodicWorkRequest saveRequest = new PeriodicWorkRequest.Builder(UploadWorker.class, 1, TimeUnit.HOURS, 15, TimeUnit.MINUTES).build();
```
##### 工作约束
```java
///约束
        Constraints constraints = new Constraints.Builder().setRequiredNetworkType(NetworkType.UNMETERED).setRequiresCharging(true).build();
        WorkRequest constraintsWorkRequest = new OneTimeWorkRequest.Builder(UploadWorker.class).setConstraints(constraints).build();
```
##### 延迟工作
```
///延迟工作
        WorkRequest delayWorkRequest = new OneTimeWorkRequest.Builder(UploadWorker.class).setInitialDelay(10, TimeUnit.MINUTES).build();
```
##### 重试和退避政策
```java
//重试和退避政策(Result.retry();每隔20,30,40秒重试)
        WorkRequest retryWorkRequest = new OneTimeWorkRequest.Builder(UploadWorker.class).setBackoffCriteria(BackoffPolicy.LINEAR, OneTimeWorkRequest.MIN_BACKOFF_MILLIS, TimeUnit.MILLISECONDS).build();
```
##### 标记工作
```java
WorkRequest tagWorkRequest = new OneTimeWorkRequest.Builder(UploadWorker.class).addTag("cleanup").build();
```
##### 分配输入数据
```
///分配输入数据
        WorkRequest inputDataWorkRequest = new OneTimeWorkRequest.Builder(UploadWorker.class).setInputData(new Data.Builder().putString("IMAGES_URI", "http://...").build()).build();
```
