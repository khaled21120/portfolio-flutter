import 'package:flutter/material.dart';

class SlideInWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final AxisDirection direction;
  final Curve curve;
  final bool fadeIn;
  final double distance;
  final bool animateOnce;
  final VoidCallback? onAnimationCompleted;

  const SlideInWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay = Duration.zero,
    this.direction = AxisDirection.right,
    this.curve = Curves.easeOut,
    this.fadeIn = true,
    this.distance = 1.0,
    this.animateOnce = true,
    this.onAnimationCompleted,
  });

  @override
  State<SlideInWidget> createState() => _SlideInWidgetState();
}

class _SlideInWidgetState extends State<SlideInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _setupAnimations();
    _startAnimation();
  }

  void _setupAnimations() {
    final beginOffset = _calculateBeginOffset();

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _fadeAnimation = Tween<double>(
      begin: widget.fadeIn ? 0.0 : 1.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    // Add completion callback
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationCompleted?.call();
      }
    });
  }

  Offset _calculateBeginOffset() {
    switch (widget.direction) {
      case AxisDirection.left:
        return Offset(-widget.distance, 0);
      case AxisDirection.up:
        return Offset(0, -widget.distance);
      case AxisDirection.down:
        return Offset(0, widget.distance);
      case AxisDirection.right:
        return Offset(widget.distance, 0);
    }
  }

  void _startAnimation() {
    if (widget.delay > Duration.zero) {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    } else {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(SlideInWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Restart animation if direction or other properties change
    if (oldWidget.direction != widget.direction ||
        oldWidget.duration != widget.duration) {
      _controller.reset();
      _setupAnimations();
      _startAnimation();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _slideAnimation.value,
          child: Opacity(opacity: _fadeAnimation.value, child: widget.child),
        );
      },
    );
  }
}
