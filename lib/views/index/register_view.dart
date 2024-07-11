import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/views/index/otp_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool accept = false;

  @override
  Widget build(BuildContext context) {
    Widget form = Form(
      key: formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Name",
          style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: name,
          decoration: InputDecoration(
            hintText: "Enter your full name",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          textInputAction: TextInputAction.next,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        Text(
          "Mobile number",
          style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
        ),
        const Text(
          "You will receive an OTP for this number",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: mobile,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            prefixIcon: Container(
              padding: const EdgeInsets.fromLTRB(16, 2, 10, 0),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.grey.shade400)),
              ),
              child: const Text(
                "+60",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 0,
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
          textInputAction: TextInputAction.next,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        Text(
          "Email",
          style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: email,
          decoration: InputDecoration(
            hintText: "Eg: abc@email.com",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          textInputAction: TextInputAction.next,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        Text(
          "Password",
          style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: pass,
          decoration: InputDecoration(
            hintText: "Create a new password",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          textInputAction: TextInputAction.next,
          style: const TextStyle(fontSize: 18),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
        ),
        const SizedBox(height: 16),
        CheckboxListTile.adaptive(
          value: accept,
          onChanged: (value) =>
              (value != null) ? setState(() => accept = value) : null,
          activeColor: AppColor.pictonBlue,
          title: Text.rich(
            TextSpan(
              text: "I have read and agreed to WorkPulse’s ",
              style: const TextStyle(fontSize: 14),
              children: [
                TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyle(color: AppColor.blueViolet),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      debugPrint('Terms & Conditions');
                    },
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Statement',
                  style: TextStyle(color: AppColor.blueViolet),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      debugPrint('Privacy Statement');
                    },
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.maxFinite,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColor.blueViolet,
              foregroundColor: Colors.white,
              disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: AppColor.blueViolet),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const OTPView(mobile: "123457788"),
              ),
            ),
            child: const Text('Next', style: TextStyle(fontSize: 18)),
          ),
        ),
      ]),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Register a new account",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              form,
            ]),
          ),
        ),
      ),
    );
  }
}
