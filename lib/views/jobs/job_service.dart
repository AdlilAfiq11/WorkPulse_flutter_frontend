import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

class JobServiceView extends StatefulWidget {
  const JobServiceView({super.key});

  @override
  State<JobServiceView> createState() => _JobServiceViewState();
}

class _JobServiceViewState extends State<JobServiceView> {
  @override
  Widget build(BuildContext context) {
    // Add Service Button
    Widget addService() => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: BorderSide(
                color: AppColor().blueViolet,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minimumSize: const Size(120, 58),
              backgroundColor: AppColor().blueViolet,
              disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
              elevation: 5,
            ),
            onPressed: () {},
            child: const Text(
              'Start Job',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: AppColor().lightGrey,
      appBar: AppBar(
        title: const Text(
          'Add New Service',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColor().blueViolet,
        elevation: 5,
      ),
      bottomNavigationBar: addService(),
    );
  }
}

//TODO: List of job service
Widget addJobService() {
  return Scaffold(
    backgroundColor: AppColor().lightGrey,
    appBar: AppBar(
      title: const Text(
        'Add New Service',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: AppColor().blueViolet,
      elevation: 5,
    ),
  );
}
