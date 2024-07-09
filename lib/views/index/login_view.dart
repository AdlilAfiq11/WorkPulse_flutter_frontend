import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/views/navigation/navigation_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Login to your account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Eg: abc@email.com",
                    hintStyle: const TextStyle(fontWeight: FontWeight.normal),
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
                ),
                const SizedBox(height: 30),
                Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: pass,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    hintStyle: const TextStyle(fontWeight: FontWeight.normal),
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
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                const SizedBox(height: 30),
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
                    onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const NavigationView(),
                      ),
                      (route) => false,
                    ),
                    child: const Text('Login', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          TextButton(
            onPressed: () {},
            child: Text(
              "Forget password?",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
            ),
          ),
          const SizedBox(height: 94),
          Text(
            'Or continue with',
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
            ),
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
        ]),
      ),
    );
  }
}
