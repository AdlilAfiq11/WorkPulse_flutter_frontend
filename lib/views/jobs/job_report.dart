import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_payment.dart';

//TODO: Report
class ServiceReportView extends StatefulWidget {
  const ServiceReportView({super.key});

  @override
  State<ServiceReportView> createState() => _ServiceReportViewState();
}

class _ServiceReportViewState extends State<ServiceReportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        title: const Text(
          'Create Service Report',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColor.blueViolet,
        elevation: 5,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aircond Service',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13, 0, 13, 13),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Proof of Service',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: AppColor.electricIndigo,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: const Icon(FluentIcons.image_24_filled),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        child: const Icon(FluentIcons.image_24_filled),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customer Signature',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomButton(
        context,
        title: 'Continue',
        onPressed: () => Navigator.push(
            context, SlideRoute(page: const ConfirmPaymentView())),
      ),
    );
  }
}
