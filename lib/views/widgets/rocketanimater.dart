import 'package:flutter/material.dart';

class RocketAnimator extends StatefulWidget {
  const RocketAnimator({super.key});

  @override
  State<RocketAnimator> createState() => _RocketAnimatorState();
}

class _RocketAnimatorState extends State<RocketAnimator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: const Offset(0, 0.15),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/clouds.png'),
        SlideTransition(
          position: _animation,
          child: Image.asset('assets/images/rocket_person.png'),
        ),
      ],
    );
  }
}
