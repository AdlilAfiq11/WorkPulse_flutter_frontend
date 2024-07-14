import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workpulse_flutter_frontend/components/signature_component.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_report.dart';

class ProofofServiceView extends StatefulWidget {
  const ProofofServiceView({super.key});

  @override
  State<ProofofServiceView> createState() => _ProofofServiceViewState();
}

class _ProofofServiceViewState extends State<ProofofServiceView> {
  final ImagePicker _picker = ImagePicker();

  ByteData? _signature;
  List<File> attachment = List.empty(growable: true);

  bool loading = false;

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
      body: SingleChildScrollView(
        child: Column(
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
                    Row(
                      children: [
                        if (attachment.isNotEmpty) ...{
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              for (File file in attachment)
                                GestureDetector(
                                  onTap: (loading)
                                      ? null
                                      : () {
                                          attachment.remove(file);
                                          setState(() {});
                                        },
                                  child: _thumbnail(file),
                                )
                            ],
                          ),
                          const SizedBox(width: 10)
                        },
                        DottedBorder(
                          color: Colors.grey.shade500,
                          dashPattern: const [5],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(8),
                          padding: const EdgeInsets.all(8),
                          child: IconButton(
                            onPressed: () =>
                                _takeAttachmentPhoto(ImageSource.camera)
                                    .then((value) {
                              if (value == null) return;

                              attachment.add(value);
                              setState(() {});
                            }),
                            icon: Icon(
                              Icons.add,
                              color: AppColor.ceruleanBlue,
                              size: 30,
                            ),
                          ),
                        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Signature',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _signature != null
                            ? TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignaturePad())).then(
                                  (value) {
                                    if (value != null) {
                                      setState(() {
                                        _signature = value;
                                      });
                                    }
                                  },
                                ),
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: AppColor.electricIndigo,
                                      fontSize: 16),
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
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
                        child: _signature != null
                            ? Image.memory(
                                _signature!.buffer.asUint8List(),
                                width: double.infinity,
                                height: 130,
                                fit: BoxFit.scaleDown,
                              )
                            : TextButton.icon(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignaturePad())).then(
                                  (value) {
                                    if (value != null) {
                                      setState(() {
                                        _signature = value;
                                      });
                                    }
                                  },
                                ),
                                icon: Icon(
                                  FluentIcons.signature_24_filled,
                                  color: AppColor.ceruleanBlue,
                                ),
                                label: Text(
                                  'Tap to sign the job ',
                                  style:
                                      TextStyle(color: AppColor.ceruleanBlue),
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
      ),
      bottomNavigationBar: bottomButton(
        context,
        title: 'Submit',
        onPressed: () => validatePOS(),
      ),
    );
  }

  Future<File?> _takeAttachmentPhoto(ImageSource source) async {
    XFile? image = await _picker.pickImage(
      source: source,
      requestFullMetadata: false,
    );

    if (image == null) return null;

    return File(image.path);
  }

  Widget _thumbnail(File file, {double width = 60, double height = 60}) =>
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
        Positioned(
          top: -1,
          right: -2,
          child: Container(height: 12, width: 12, color: Colors.white),
        ),
        const Positioned(
          top: -8,
          right: -8,
          child: Icon(Icons.cancel),
        ),
      ]);

  void validatePOS() {
    if (_signature != null && attachment.isNotEmpty) {
      Navigator.push(
          context,
          SlideRoute(
              page: ServiceReportView(
                  signature: _signature, attachment: attachment)));
    } else if (_signature != null) {
      photoAlert(
        context,
        'Are you sure to skip uploading photo?',
        onPressed: () {
          Navigator.pop(context);

          Navigator.push(context,
              SlideRoute(page: ServiceReportView(signature: _signature)));
        },
      );
    } else {
      customShowToast(
        context,
        text: 'Sign the job before submit',
        color: Colors.red.shade300,
      );
    }
  }
}
