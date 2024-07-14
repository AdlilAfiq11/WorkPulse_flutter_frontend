import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_pos.dart';

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

Widget bottomButton(
  BuildContext context, {
  required String title,
  required Function()? onPressed,
}) =>
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1)),
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.blueViolet,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: const Size(double.infinity, 50),
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

Future<dynamic> photoAlert(
  BuildContext context,
  String title, {
  required Function()? onPressed,
}) {
  return showModalBottomSheet(
    showDragHandle: true,
    backgroundColor: Colors.white,
    elevation: 5.0,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
    ),
    builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  color: AppColor.matteBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              Text(
                'Uploading photo will help to avoid any unnecessary dispute from customer. It can save you from a lot of trouble later on.',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: AppColor.blueViolet,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppColor.blueViolet,
                  disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
                  elevation: 5,
                ),
                onPressed: onPressed,
                child: const Text(
                  'Ok, I got it',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
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
