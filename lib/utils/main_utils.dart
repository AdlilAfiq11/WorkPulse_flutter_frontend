import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

Color jobStatusColor(String jobStatus) {
  switch (jobStatus) {
    case "On-going":
      return Colors.blue.shade100;
    case "Completed":
      return Colors.green.shade100;
    default:
      return AppColor().greyGoose;
  }
}

Widget bottomButton(
  BuildContext context, {
  required String title,
  required Function()? onPressed,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: AppColor().blueViolet,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: AppColor().blueViolet,
          disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
          elevation: 5,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );

// Create custome show toast
ToastFuture customShowToast(
  context, {
  required String text,
  required Color color,
  bool dismiss = false,
}) =>
    showToast(
      dismissOtherToast: dismiss,
      text,
      context: context,
      axis: Axis.horizontal,
      alignment: Alignment.center,
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      animation: StyledToastAnimation.slideFromTopFade,
      reverseAnimation: StyledToastAnimation.slideToTopFade,
      position:
          const StyledToastPosition(align: Alignment.topCenter, offset: 0.0),
      startOffset: const Offset(0.0, -3.0),
      reverseEndOffset: const Offset(0.0, -3.0),
      duration: const Duration(seconds: 3),
      animDuration: const Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn,
      backgroundColor: color,
      fullWidth: true,
      textAlign: TextAlign.justify,
    );

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
