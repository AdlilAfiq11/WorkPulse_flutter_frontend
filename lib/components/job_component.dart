import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_details.dart';

//TODO: Job Card
Widget createJobCard(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.of(context).push(
      SlideRoute(page: const JobDetailsView()),
    ),
    child: Container(
      height: 240,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(children: [
              Expanded(
                child: Text(
                  'AC Installation 1.0 HP',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'RM 570',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const Icon(Icons.access_time, color: Colors.grey),
              const SizedBox(width: 10),
              const Expanded(
                flex: 7,
                child: Text('Today, 11:00 P.M', style: TextStyle(fontSize: 15)),
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
            ]),
            const Row(children: [
              Icon(Icons.perm_contact_cal_outlined, color: Colors.grey),
              SizedBox(width: 10),
              Text('Lee Hong Kee', style: TextStyle(fontSize: 15)),
            ]),
            const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(Icons.location_on_outlined, color: Colors.grey),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Desa Green Serviced Apartment, Taman Desa, 58000 Kuala Lumpur',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.mediumBlue,
                    backgroundColor: AppColor.lightPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(120, 45),
                    disabledBackgroundColor:
                        const Color.fromRGBO(31, 48, 94, .5),
                  ),
                  onPressed: () {},
                  child: const Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('Get There', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 10),
                    Icon(Icons.near_me_outlined)
                  ]),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.mediumBlue,
                    backgroundColor: AppColor.lightPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(120, 45),
                    disabledBackgroundColor:
                        const Color.fromRGBO(31, 48, 94, .5),
                  ),
                  onPressed: () {},
                  child: const Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('Call Customer', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 10),
                    Icon(Icons.phone_in_talk_outlined)
                  ]),
                ),
              ),
            ]),
          ],
        ),
      ),
    ),
  );
}

//custom for service component
Widget serviceCard() {
  return Container();
}
