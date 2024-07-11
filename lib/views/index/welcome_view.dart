import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/views/index/login_view.dart';
import 'package:workpulse_flutter_frontend/views/index/register_view.dart';

class WelcomePageView extends StatelessWidget {
  const WelcomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/onboard.svg",
              semanticsLabel: 'Onboarding Image',
            ),
            const SizedBox(height: 40),
            const Text(
              'Digitalise your transaction with WorkPulse',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColor.blueViolet,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        const Color.fromRGBO(31, 48, 94, .5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: AppColor.blueViolet),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegisterView(),
                    ),
                  ),
                  child: const Text('Sign Up', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColor.mediumBlue,
                    disabledBackgroundColor:
                        const Color.fromRGBO(31, 48, 94, .5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: AppColor.blueViolet),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 18)),
                ),
              ),
            ]),
            const SizedBox(height: 20),
            Text(
              'Or continue with',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 15),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/google-icon.png'),
                      scale: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/apple-icon.png'),
                      scale: 20,
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
