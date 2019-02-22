library progress_button;

import 'package:flutter/material.dart';
import 'package:progress_indicator_button/button_stagger_animation.dart';

class ProgressButton extends StatefulWidget {
  /// The width of the button while NOT animating.
  final double width;
  /// The height of the button.
  final double height;
  /// The background color of the button.
  final Color color;
  /// The progress indicator color.
  final Color progressIndicatorColor;
  /// The size of the progress indicator.
  final double progressIndicatorSize;
  /// The border radius while NOT animating.
  final BorderRadius borderRadius;
  /// The duration of the animation.
  final Duration animationDuration;
  /// Function that will be called at the on pressed event.
  /// 
  /// This will grant access to its [AnimationController] so
  /// that the animation can be controlled based on the need.
  final Function(AnimationController) onPressed;
  /// The child to display on the button.
  final Widget child;

  ProgressButton({
    @required this.width,
    @required this.height,
    @required this.child,
    @required this.onPressed,
    this.color = Colors.blue,
    this.progressIndicatorColor = Colors.white,
    this.progressIndicatorSize = 30,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonStaggerAnimation(
      controller: _controller.view,
      width: widget.width,
      height: widget.height,
      color: widget.color,
      progressIndicatorColor: widget.progressIndicatorColor,
      progressIndicatorSize: widget.progressIndicatorSize,
      borderRadius: widget.borderRadius,
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }
}