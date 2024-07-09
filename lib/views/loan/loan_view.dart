import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

class LoanPageView extends StatefulWidget {
  const LoanPageView({super.key});

  @override
  State<LoanPageView> createState() => _LoanPageViewState();
}

class _LoanPageViewState extends State<LoanPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.offWhite,
      body: const Center(
        child: Text('Loan Page'),
      ),
    );
  }
}
