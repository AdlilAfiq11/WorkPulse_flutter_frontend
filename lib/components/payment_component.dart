// View complete payment page
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/views/home/home_view.dart';

class CompletePayment extends StatelessWidget {
  const CompletePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePageView())),
          icon: const Icon(Icons.close),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CircleAvatar(
                backgroundColor: Colors.green.shade400,
                radius: 30,
                child: const Icon(
                  Icons.done_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Good job!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                'Your job has been completed. You can send service report to customer.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Share service report via',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton.filled(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColor.lightGrey),
                            minimumSize: const MaterialStatePropertyAll(
                              Size(60, 60),
                            )),
                        iconSize: 25,
                        color: AppColor.electricIndigo,
                        onPressed: () {},
                        icon: const Icon(FluentIcons.mail_read_24_filled),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 25),
                  Column(
                    children: [
                      IconButton.filled(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColor.lightGrey),
                            minimumSize: const MaterialStatePropertyAll(
                              Size(60, 60),
                            )),
                        iconSize: 25,
                        color: AppColor.electricIndigo,
                        onPressed: () {},
                        icon: const Icon(FluentIcons.copy_24_filled),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 25),
                  Column(
                    children: [
                      IconButton.filled(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColor.lightGrey),
                            minimumSize: const MaterialStatePropertyAll(
                              Size(60, 60),
                            )),
                        iconSize: 25,
                        color: AppColor.electricIndigo,
                        onPressed: () {},
                        icon: const Icon(FluentIcons.share_android_24_filled),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Other',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
