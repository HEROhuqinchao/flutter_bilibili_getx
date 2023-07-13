enum ScaleState {
  ///初始状态
  none,

  ///平移
  pan,

  ///拖拽关闭
  dragOut,

  ///返回原状
  backToOriginal,

  ///双击放大
  doubleTapScale,
}
