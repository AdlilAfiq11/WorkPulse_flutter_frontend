import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/components/reschedule_component.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_pos.dart';

//TODO: Create custm card for service

class JobDetailsView extends StatefulWidget {
  const JobDetailsView({super.key});

  @override
  State<JobDetailsView> createState() => _JobDetailsViewState();
}

class _JobDetailsViewState extends State<JobDetailsView> {
  @override
  Widget build(BuildContext context) {
    // Start Job Button
    Widget startButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color.fromRGBO(241, 241, 241, 1)),
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.blueViolet,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
          elevation: 5,
        ),
        onPressed: photoAlert,
        child: const Text(
          'Start Job',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        title: const Text('20221128-757145', style: TextStyle(fontSize: 18)),
        backgroundColor: AppColor.blueViolet,
        foregroundColor: Colors.white,
        scrolledUnderElevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Job Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColor.aliceBlue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'On-going',
                        style: TextStyle(color: AppColor.blueNCS),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(children: [
                  const Icon(Icons.access_time, color: Colors.grey),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Today, 11:00 P.M',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  GestureDetector(
                    onTap: manageOrder,
                    child: Text(
                      'Reschedule',
                      style: TextStyle(
                        color: AppColor.mediumBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(height: 16),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Icon(Icons.location_on_outlined, color: Colors.grey),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Desa Green Serviced Apartment, Taman Desa, 58000 Kuala Lumpur',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.mediumBlue,
                      backgroundColor: AppColor.lightPurple,
                      minimumSize: const Size(0, 0),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.near_me_outlined, size: 28),
                  ),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
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
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View Details',
                        style: TextStyle(
                          color: AppColor.mediumBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(children: [
                  const Icon(
                    Icons.perm_contact_cal_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text('Lee Hong Kee', style: TextStyle(fontSize: 15)),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.mediumBlue,
                      backgroundColor: AppColor.lightPurple,
                      minimumSize: const Size(0, 0),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.phone_in_talk_outlined, size: 28),
                  ),
                ]),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Service',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(children: [
                      Icon(
                        Icons.add_circle_outline,
                        size: 20,
                        color: AppColor.mediumBlue,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Add Service',
                        style: TextStyle(
                          color: AppColor.mediumBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Remark',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reference',
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  ),
                  const Text(
                    'Invoice no. 138451925',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ]),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Payment Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Method',
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  ),
                  const Text('Company Billed', style: TextStyle(fontSize: 15)),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                  ),
                  const Text('RM 570', style: TextStyle(fontSize: 15)),
                ],
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.red.shade400,
              ),
              child: const Text('Cancel Job', style: TextStyle(fontSize: 17)),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: startButton,
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

  //TODO:Change color to white
  manageOrder() {
    return showModalBottomSheet(
      showDragHandle: true,
      elevation: 5.0,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      builder: (context) {
        return SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Manage Order',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 18),
              ListTile(
                visualDensity: VisualDensity.compact,
                onTap: () => Navigator.push(
                    context, SlideRoute(page: const RescheduleOrder())),
                title: const Text('Reschedule Order'),
              ),
              Divider(
                color: Colors.grey.shade300,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, SlideRoute(page: CancelOrder()));
                },
                title: Text(
                  'Cancel Order',
                  style: TextStyle(color: Colors.red.shade400),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
