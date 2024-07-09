import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
