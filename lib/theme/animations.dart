import 'package:flutter/material.dart';

// Common Duration Constants
const Duration kDefaultDuration = Duration(milliseconds: 300);
const Duration kScaleFadeDuration = Duration(milliseconds: 500);

/// 1. Fade In Animation - A simple fade-in transition for widgets.
class FadeInAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const FadeInAnimation({
    Key? key,
    required this.child,
    this.duration = kDefaultDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: duration,
      child: child,
    );
  }
}

/// 2. Slide In From Bottom Animation - Slides the widget from the bottom.
class SlideInFromBottom extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const SlideInFromBottom({
    Key? key,
    required this.child,
    this.duration = kDefaultDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: const Offset(0, 1),
      duration: duration,
      child: child,
    );
  }
}

/// 3. Scale Animation - A scale animation that enlarges or shrinks the widget.
class ScaleAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const ScaleAnimation({
    Key? key,
    required this.child,
    this.duration = kDefaultDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: 1.0,
      duration: duration,
      child: child,
    );
  }
}

/// 4. Slide Transition Example - A stateful widget with a slide transition.
class SlideTransitionExample extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const SlideTransitionExample({
    Key? key,
    required this.child,
    this.duration = kDefaultDuration,
  }) : super(key: key);

  @override
  _SlideTransitionExampleState createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}

/// 5. Scale and Fade Transition - Combines scaling and fading.
class ScaleFadeTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const ScaleFadeTransition({
    Key? key,
    required this.child,
    this.duration = kScaleFadeDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: duration,
      child: AnimatedScale(
        scale: 1.0,
        duration: duration,
        child: child,
      ),
    );
  }
}

/// 6. Rotation Animation - Rotates the widget.
class RotationAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const RotationAnimation({
    Key? key,
    required this.child,
    this.duration = kDefaultDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: 1,
      duration: duration,
      child: child,
    );
  }
}

/// 7. Hero Transition - A simple hero animation for screen transitions.
class HeroTransition extends StatelessWidget {
  final String tag;
  final Widget child;

  const HeroTransition({
    Key? key,
    required this.tag,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: child,
    );
  }
}

/// 8. Fade and Slide Transition - Combines fading and sliding.
class FadeAndSlideTransition extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeAndSlideTransition({
    Key? key,
    required this.child,
    this.duration = kDefaultDuration,
  }) : super(key: key);

  @override
  _FadeAndSlideTransitionState createState() =>
      _FadeAndSlideTransitionState();
}

class _FadeAndSlideTransitionState extends State<FadeAndSlideTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}

/// 9. Rotate and Scale Animation - Combines rotation and scaling.
class RotateScaleAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const RotateScaleAnimation({
    Key? key,
    required this.child,
    this.duration = kDefaultDuration,
  }) : super(key: key);

  @override
  _RotateScaleAnimationState createState() => _RotateScaleAnimationState();
}

class _RotateScaleAnimationState extends State<RotateScaleAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Matrix4> _rotationAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _rotationAnimation = Matrix4Tween(
      begin: Matrix4.identity(),
      end: Matrix4.rotationZ(3.14 / 4), // 45° rotation
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
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
        return Transform(
          transform: _rotationAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
