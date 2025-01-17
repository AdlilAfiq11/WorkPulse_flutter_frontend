import 'package:dotted_border/dotted_border.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/components/signature_component.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_report.dart';

//TODO: Add photo
//TODO: Signature area

class ProofofServiceView extends StatefulWidget {
  const ProofofServiceView({super.key});

  @override
  State<ProofofServiceView> createState() => _ProofofServiceViewState();
}

class _ProofofServiceViewState extends State<ProofofServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        title: const Text(
          'Proof of Service',
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
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Proof of Service',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Attach photos to show that you have completed your service',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  DottedBorder(
                    color: Colors.grey.shade500,
                    dashPattern: const [5],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    padding: const EdgeInsets.all(8),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: AppColor.ceruleanBlue,
                        size: 30,
                      ),
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
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Signature',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap to let your customer to confirm service has completed',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.center,
                    child: DottedBorder(
                      color: Colors.grey.shade500,
                      dashPattern: const [5],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      padding: const EdgeInsets.all(8),
                      child: TextButton.icon(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignaturePad())),
                        icon: Icon(
                          FluentIcons.signature_24_filled,
                          color: AppColor.ceruleanBlue,
                        ),
                        label: Text(
                          'Tap to sign the job ',
                          style: TextStyle(color: AppColor.ceruleanBlue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: bottomButton(
          context,
          title: 'Submit',
          onPressed: () => Navigator.push(
              context, SlideRoute(page: const ServiceReportView())),
        ),
      ),
    );
  }
}
