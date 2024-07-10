import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/views/index/complete_profile_view.dart';

class OTPView extends StatefulWidget {
  final String mobile;

  const OTPView({super.key, required this.mobile});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final otp = List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    List<Widget> fields = List.empty(growable: true);
    for (var i = 0; i < otp.length; i++) {
      fields.add(Flexible(
        child: TextField(
          controller: otp[i],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
          onChanged: (value) {
            if (value == "") {
              FocusScope.of(context).previousFocus();
            } else {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ));

      if (i < otp.length - 1) {
        fields.add(const SizedBox(width: 10));
      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter OTP",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "To verify your account, we’ve sent a 6-digits code to +60${widget.mobile}",
                style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
              ),
              const SizedBox(height: 50),
              Row(children: fields),
              const SizedBox(height: 24),
              SizedBox(
                width: double.maxFinite,
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
                      builder: (context) => const CompleteProfileView(),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 26),
              Text.rich(
                TextSpan(
                  text: "Didn’t get a code? ",
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Resend',
                      style: TextStyle(
                        color: AppColor.blueViolet,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint("Resend");
                        },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
