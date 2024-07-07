import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

class JobDetailsView extends StatefulWidget {
  const JobDetailsView({super.key});

  @override
  State<JobDetailsView> createState() => _JobDetailsViewState();
}

class _JobDetailsViewState extends State<JobDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().lightGrey,
      appBar: AppBar(
        title: const Text(
          '20221128-757145',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor().blueViolet,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 185,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        children: [
                          const Expanded(
                            flex: 8,
                            child: Text(
                              'Job Details',
                              style: TextStyle(
                                fontSize: 17,
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
                                style: TextStyle(color: AppColor().blueZodiac),
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
                                color: AppColor().electricIndigo,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
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
                            radius: 28,
                            backgroundColor: AppColor().lightPurple,
                            child: Icon(
                              Icons.map_outlined,
                              size: 27,
                              color: AppColor().electricIndigo,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 130,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Customer Details',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                color: AppColor().electricIndigo,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
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
                            radius: 28,
                            backgroundColor: AppColor().lightPurple,
                            child: Icon(
                              Icons.call,
                              size: 27,
                              color: AppColor().electricIndigo,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 300,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Service',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Add Service',
                                style: TextStyle(
                                  color: AppColor().electricIndigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 90,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Remark',
                        style: TextStyle(
                          fontSize: 17,
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
            const SizedBox(height: 20),
            Container(
              height: 90,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Payment Details',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Payment Method',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade700),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Company Billed',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade700),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'RM 570',
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
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Cancel Job',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red.shade400,
                    ),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
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
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
