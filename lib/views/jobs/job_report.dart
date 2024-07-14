import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_payment.dart';

//TODO: Report
class ServiceReportView extends StatefulWidget {
  final ByteData? signature;
  final List<File> attachment;
  const ServiceReportView({
    super.key,
    required this.signature,
    this.attachment = const [],
  });

  @override
  State<ServiceReportView> createState() => _ServiceReportViewState();
}

class _ServiceReportViewState extends State<ServiceReportView> {
  ByteData? custSignature;
  List<File> jobAttachment = [];

  @override
  void initState() {
    super.initState();
    custSignature = widget.signature;
    jobAttachment = widget.attachment;
  }

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
                      jobAttachment.isNotEmpty
                          ? Wrap(
                              direction: Axis.horizontal,
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                for (File file in jobAttachment)
                                  _thumbnail(file)
                              ],
                            )
                          : DottedBorder(
                              color: Colors.amber,
                              dashPattern: const [6],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(8),
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                'Alert: No job attachment provided',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.amber,
                                ),
                              ),
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
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Customer Signature',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  DottedBorder(
                    color: custSignature != null
                        ? Colors.grey.shade600
                        : Colors.amber,
                    dashPattern: const [6],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    child: custSignature != null
                        ? Image.memory(
                            custSignature!.buffer.asUint8List(),
                            width: double.infinity,
                            height: 130,
                            fit: BoxFit.scaleDown,
                          )
                        : const Text(
                            'Alert: No customer signature provided',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.amber,
                            ),
                          ),
                  )
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

  Widget _thumbnail(File file, {double width = 80, double height = 80}) =>
      Stack(clipBehavior: Clip.none, children: [
        SizedBox(
          width: width,
          height: height,
          child: Image.file(
            file,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
          ),
        ),
      ]);
}
