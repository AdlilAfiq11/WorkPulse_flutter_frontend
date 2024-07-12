import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_details.dart';

//TODO:Job Card
Widget createJobCard(BuildContext context) {
  return InkWell(
    onTap: () =>
        Navigator.push(context, SlideRoute(page: const JobDetailsView())),
    child: Container(
      height: 240,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Text(
                    'AC Installation 1.0 HP',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'RM 570',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                  flex: 7,
                  child: Text(
                    'Today, 11:00 P.M',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      'On-going',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Text(
                    'Lee Hong Kee',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Text(
                    'Desa Green Serviced Apartment, Taman Desa, 58000 Kuala Lumpur',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColor.lightPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(120, 45),
                        disabledBackgroundColor:
                            const Color.fromRGBO(31, 48, 94, .5),
                        elevation: 5,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.map_sharp,
                        color: AppColor.electricIndigo,
                      ),
                      label: Text(
                        'Get There',
                        style: TextStyle(
                          color: AppColor.electricIndigo,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 1,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColor.lightPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(120, 45),
                        disabledBackgroundColor:
                            const Color.fromRGBO(31, 48, 94, .5),
                        elevation: 5,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.call,
                        color: AppColor.electricIndigo,
                      ),
                      label: Text(
                        'Call Customer',
                        style: TextStyle(
                          color: AppColor.electricIndigo,
                          fontSize: 14,
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
  );
}

//custom for service component
Widget serviceCard() {
  return Container();
}
