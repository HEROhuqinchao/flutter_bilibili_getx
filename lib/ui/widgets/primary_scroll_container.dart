import 'package:flutter/cupertino.dart';

///NestedScrollView嵌套tabView会导致，多列表同时滑动，而NestedScrollview里的body无法使用controller，否则失去联动效果
///参照 https://www.jianshu.com/p/ab473fb8ceb0 处理这种问题
class PrimaryScrollContainer extends StatefulWidget {
  final Widget child;

  PrimaryScrollContainer({
    required GlobalKey<PrimaryScrollContainerState> key,
    required this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PrimaryScrollContainerState();
}

class PrimaryScrollContainerState extends State<PrimaryScrollContainer> {
  late ScrollControllerWrapper _scrollController;

  get scrollController {
    final PrimaryScrollController? primaryScrollController =
        context.dependOnInheritedWidgetOfExactType<PrimaryScrollController>();
    if (primaryScrollController != null) {
      _scrollController.inner = primaryScrollController.controller!;
    }
    return _scrollController;
  }

  @override
  void initState() {
    _scrollController = ScrollControllerWrapper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScrollControllerWrapper(
      scrollController: scrollController,
      child: widget.child,
    );
  }

  void onPageChange(bool show) {
    _scrollController.onAttachChange(show);
  }
}

class PrimaryScrollControllerWrapper extends InheritedWidget
    implements PrimaryScrollController {
  final ScrollController scrollController;

  const PrimaryScrollControllerWrapper({
    Key? key,
    required Widget child,
    required this.scrollController,
  }) : super(key: key, child: child);

  @override
  get runtimeType => PrimaryScrollController;

  @override
  get controller => scrollController;

  @override
  bool updateShouldNotify(PrimaryScrollControllerWrapper oldWidget) =>
      controller != oldWidget.controller;
}

//代理
class ScrollControllerWrapper implements ScrollController {
  static int a = 1;

  late ScrollController inner;

  int code = a++;

  ScrollPosition? interceptedAttachPosition; //拦截的position
  ScrollPosition? lastPosition;

  bool showing = true;

  @override
  void addListener(listener) => inner.addListener(listener);

  @override
  Future<void> animateTo(double offset,
          {required Duration duration, required Curve curve}) =>
      inner.animateTo(offset, duration: duration, curve: curve);

  @override
  void attach(ScrollPosition position) {
    // print('{$code}:attach start {$showing}');
    if (position == interceptedAttachPosition) {
      // print("attach by inner");
    }
    position.hasListeners;
    // print('{$code}:attach end {$showing}');
    if (inner.positions.contains(position)) return;
    if (showing) {
      inner.attach(position);
      lastPosition = position;
    } else {
      interceptedAttachPosition = position;
    }
  }

  @override
  void detach(ScrollPosition? position, {bool fake = false}) {
    assert(() {
      // print('{$code}:detach start {$showing}');
      return true;
    }.call());
    if (fake) print("detach is innner");
    if (inner.positions.contains(position)) {
      inner.detach(position!);
    }
    if (position == interceptedAttachPosition && !fake) {
      // print('{$code}:set null {$showing}');
      interceptedAttachPosition = null;
    }
    if (position == lastPosition && !fake) {
      // print('{$code}:set null {$showing}');
      lastPosition = null;
    }
    if (fake) {
      interceptedAttachPosition = position;
    }
    assert(() {
      // print('{$code}:detach end {$showing}');
      return true;
    }.call());
  }

  void onAttachChange(bool b) {
    // print('{$code}:change{$b}');
    showing = b;
    if (!showing && lastPosition != null) {
      detach(lastPosition!, fake: true);
    } else {
      if (interceptedAttachPosition != null) {
        attach(interceptedAttachPosition!);
      }
    }
  }

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics,
          ScrollContext context, ScrollPosition? oldPosition) =>
      inner.createScrollPosition(physics, context, oldPosition);

  @override
  void debugFillDescription(List<String> description) =>
      inner.debugFillDescription(description);

  @override
  String? get debugLabel => inner.debugLabel;

  @override
  void dispose() => inner.dispose();

  @override
  bool get hasClients => inner.hasClients;

  @override
  bool get hasListeners => inner.hasListeners;

  @override
  double get initialScrollOffset => inner.initialScrollOffset;

  @override
  void jumpTo(double value) => inner.jumpTo(value);

  @override
  bool get keepScrollOffset => inner.keepScrollOffset;

  @override
  void notifyListeners() => inner.notifyListeners();

  @override
  double get offset => inner.offset;

  @override
  ScrollPosition get position => inner.position;

  @override
  Iterable<ScrollPosition> get positions => inner.positions;

  @override
  void removeListener(listener) => inner.removeListener(listener);

  @override
  int get hashCode => inner.hashCode;

  @override
  bool operator ==(other) {
    return hashCode == (other.hashCode);
  }
}
