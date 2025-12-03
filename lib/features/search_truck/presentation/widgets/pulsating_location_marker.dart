import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PulsatingLocationMarker extends StatefulWidget {
  const PulsatingLocationMarker({super.key});

  @override
  State<PulsatingLocationMarker> createState() => _PulsatingLocationMarkerState();
}

class _PulsatingLocationMarkerState extends State<PulsatingLocationMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 2.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.8,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
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
        return Stack(
          alignment: Alignment.center,
          children: [
            // Outer pulsating circle
            Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFC40000).withOpacity(_opacityAnimation.value),
                ),
              ),
            ),
            // Middle circle
            Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC40000).withOpacity(0.3),
              ),
            ),
            // Inner solid circle
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC40000),
                border: Border.all(
                  color: Colors.white,
                  width: 3.w,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

