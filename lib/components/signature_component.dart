import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

class SignaturePad extends StatefulWidget {
  const SignaturePad({super.key});

  @override
  State<SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  final GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

  bool? _signature;

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
      bottomNavigationBar: actionButton(),
    );
  }

  // Action button to submit/clear/cancel signature
  Widget actionButton() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: AppColor.blueViolet,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppColor.blueViolet,
                disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
                elevation: 5,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      );
}
