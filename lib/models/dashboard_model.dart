import 'package:flutter/material.dart';
import 'menu_dashboard_model.dart';

class DashboardModel extends StatelessWidget {
  final bool isCollapsed;
  final double screenWidth;
  final Duration duration;
  final Animation<double> scaleAnimation;
  final Function onMenuTap;
  final Widget child;

  const DashboardModel(
      {Key key,
      this.isCollapsed,
      this.screenWidth,
      this.duration,
      this.scaleAnimation,
      this.onMenuTap,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.6 * screenWidth,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          animationDuration: duration,
          elevation: 8,
          child: child,
        ),
      ),
    );
  }
}
