import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_pos.dart';

//TODO: Create component for service
//TODO: Confirm back with jin for "Reschedule", "Job Status" & Add Service

class JobDetailsView extends StatefulWidget {
  const JobDetailsView({super.key});

  @override
  State<JobDetailsView> createState() => _JobDetailsViewState();
}

class _JobDetailsViewState extends State<JobDetailsView> {
  // Start Job Button
  Widget startButton() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: AppColor.blueViolet,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            minimumSize: const Size(120, 50),
            backgroundColor: AppColor.blueViolet,
            disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
            elevation: 5,
          ),
          onPressed: () => photoAlert(),
          child: const Text(
            'Start Job',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        title: const Text(
          '20221128-757145',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColor.blueViolet,
        scrolledUnderElevation: 5,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 8,
                            child: Text(
                              'Job Details',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                'On-going',
                                style: TextStyle(color: AppColor.blueZodiac),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.watch_later_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        const Expanded(
                          flex: 8,
                          child: Text(
                            'Today, 11:00 P.M',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Reschedule',
                              style: TextStyle(
                                color: AppColor.electricIndigo,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                        ),
                        const Expanded(
                          flex: 8,
                          child: Text(
                            'Desa Green Serviced Apartment, Taman Desa, 58000 Kuala Lumpur',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Expanded(
                          flex: 3,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColor.lightPurple,
                            child: Icon(
                              Icons.map_outlined,
                              size: 25,
                              color: AppColor.electricIndigo,
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
                padding: const EdgeInsets.fromLTRB(13, 0, 13, 13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Customer Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View Details',
                            style: TextStyle(
                              color: AppColor.electricIndigo,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            FluentIcons.book_contacts_24_filled,
                            color: Colors.grey,
                          ),
                        ),
                        const Expanded(
                          flex: 8,
                          child: Text(
                            'Lee Hong Kee',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColor.lightPurple,
                            child: Icon(
                              Icons.call,
                              size: 25,
                              color: AppColor.electricIndigo,
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
                padding: const EdgeInsets.fromLTRB(13, 0, 13, 13),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Service',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Add Service',
                            style: TextStyle(
                              color: AppColor.electricIndigo,
                              fontSize: 16,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Remark',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Reference',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade700),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Invoice no. 138451925',
                            style: TextStyle(
                              fontSize: 15,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Payment Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Method',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const Text(
                          'Company Billed',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const Text(
                          'RM 570',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel Job',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.red.shade400,
                    ),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: startButton(),
    );
  }

  photoAlert() {
    return showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Colors.white,
      elevation: 5.0,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 5),
                Text(
                  'Have you taken a photo of before service condition?',
                  style: TextStyle(
                    color: AppColor.matteBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 15),
                Text(
                  'Uploading photo will help to avoid any unnecessary dispute from customer. It can save you from a lot of trouble later on.',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 15),
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
                    disabledBackgroundColor:
                        const Color.fromRGBO(31, 48, 94, .5),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context, SlideRoute(page: const ProofofServiceView()));
                  },
                  child: const Text(
                    'Ok, I got it',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
