import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

//TODO: Add photo
//TODO: Signature area

class ProofofServiceView extends StatefulWidget {
  const ProofofServiceView({super.key});

  @override
  State<ProofofServiceView> createState() => _ProofofServiceViewState();
}

class _ProofofServiceViewState extends State<ProofofServiceView> {
  final GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

  bool? _signature;

  @override
  Widget build(BuildContext context) {
    Widget submitButton() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(
                color: AppColor.blueViolet,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minimumSize: const Size(double.infinity, 58),
              backgroundColor: AppColor.blueViolet,
              disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
              elevation: 5,
            ),
            onPressed: () {},
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        );

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
              padding: const EdgeInsets.all(14),
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
                    color: AppColor.electricIndigo,
                    dashPattern: const [5],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    padding: const EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: AppColor.electricIndigo,
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
              padding: const EdgeInsets.all(14),
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
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => jobSignature())),
                    child: const Text('Sign'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: submitButton(),
    );
  }

  //TODO: Signature pad for the customer
  Widget jobSignature() {
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
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                    color: Colors.blue.shade600,
                    width: 0.8,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                _signature = null;
                signaturePadKey.currentState!.clear();
              },
              child: Text(
                "Clear",
                style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
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
              onPressed: () {},
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
