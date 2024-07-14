import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';

class SignaturePad extends StatefulWidget {
  const SignaturePad({super.key});

  @override
  State<SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  final GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

  bool? _signature;

  Future<ByteData?> _saveSignature() async {
    final data = await signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        title: const Text(
          'Signature of Customer',
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
        actions: [
          IconButton(
            onPressed: () {
              _signature = null;
              signaturePadKey.currentState!.clear();
            },
            icon: const Icon(
              Icons.refresh_outlined,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: SfSignaturePad(
                  key: signaturePadKey,
                  minimumStrokeWidth: 1,
                  maximumStrokeWidth: 3,
                  strokeColor: Colors.blue,
                  backgroundColor: Colors.white,
                  onDrawEnd: () {
                    _signature = true;
                  },
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                '*Signature Area*',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomButton(
        context,
        title: 'Submit',
        onPressed: () async {
          ByteData? signature = await _saveSignature();

          Navigator.of(context).pop(signature);
        },
      ),
    );
  }
}
