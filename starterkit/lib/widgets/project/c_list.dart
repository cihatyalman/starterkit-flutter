import 'package:flutter/material.dart';

import 'c_text.dart';

class CList<T> extends StatelessWidget {
  bool isLoading;
  List<T> dataList;
  Widget Function(T item, int index) itemWidget;
  void Function()? onContinue;
  Future<void> Function()? onRefresh;
  EdgeInsets? padding;
  double itemSpace;
  bool shrinkWrap;
  bool reverse;
  ScrollPhysics? physics;
  Widget? emptyWidget;
  Widget? loadingWidget;
  Widget Function(BuildContext context, int index)? separatorWidget;

  CList({
    super.key,
    required this.isLoading,
    required this.dataList,
    required this.itemWidget,
    this.onContinue,
    this.onRefresh,
    this.padding,
    this.itemSpace = 8,
    this.shrinkWrap = false,
    this.reverse = false,
    this.physics,
    this.emptyWidget,
    this.loadingWidget,
    this.separatorWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading && dataList.isEmpty) {
      return loadingWidget ?? _circleLoading();
    }
    if (dataList.isEmpty) return emptyWidget ?? _emptyWidgett();
    return onRefresh != null
        ? RefreshIndicator(onRefresh: onRefresh!, child: _buildWidget())
        : _buildWidget();
  }

  ListView _buildWidget() {
    return ListView.separated(
      reverse: reverse,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding:
          padding ??
          EdgeInsets.symmetric(horizontal: 12).copyWith(bottom: 56, top: 8),
      separatorBuilder: (context, index) {
        if (dataList.length >= index + 1) {
          return separatorWidget?.call(context, index) ??
              SizedBox(height: itemSpace);
        }
        return const SizedBox.shrink();
      },
      itemCount: dataList.length + 1,
      itemBuilder: (context, index) {
        // Veri cekilirken listenin sonunda loading calisir
        if (index == dataList.length) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => onContinue?.call(),
          );
          return isLoading ? _circleLoading() : const SizedBox.shrink();
        }
        return itemWidget(dataList[index], index);
      },
    );
  }

  Widget _circleLoading({Color? color, double size = 24, double stroke = 4}) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: CircularProgressIndicator(color: color, strokeWidth: stroke),
      ),
    );
  }

  Widget _emptyWidgett() {
    return Center(child: Transform.scale(scale: 1.5, child: CText("Empty")));
  }
}
