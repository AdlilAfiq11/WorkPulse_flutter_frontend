import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

Color jobStatusColor(String jobStatus) {
  switch (jobStatus) {
    case "On-going":
      return Colors.blue.shade100;
    case "Completed":
      return Colors.green.shade100;
    default:
      return AppColor.greyGoose;
  }
}

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  SlideRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;

            var curveTween = CurveTween(curve: Curves.fastEaseInToSlowEaseOut);
            var tween = Tween(begin: begin, end: end).chain(curveTween);

            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 400),
        );
}
