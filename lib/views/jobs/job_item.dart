import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/models/service_model.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_service_review.dart';

class JobServiceView extends StatefulWidget {
  const JobServiceView({super.key});

  @override
  State<JobServiceView> createState() => _JobServiceViewState();
}

class _JobServiceViewState extends State<JobServiceView> {
  TextEditingController search = TextEditingController();
  List<String> services = [
    "AC installation 1.0 HP",
    "AC installation 1.5 HP",
    "AC installation 2.0 HP",
    "AC installation 2.5 HP",
    "Amway service",
    "Wall mount servicing",
    "Electric water heater installation",
    "Fan installation",
    "Delivery",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Service', style: TextStyle(fontSize: 20)),
          backgroundColor: AppColor.blueViolet,
          foregroundColor: Colors.white,
          elevation: 5,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Select a service',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                    hintText: "Select service",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    suffixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  textInputAction: TextInputAction.go,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => JobServiceReviewView(
                            service: Service(
                              name: services[index],
                              description:
                                  "Installation for 1.0HP Wall Mount Split Unit Air Conditioner Installation for 1.0HP Wall Mount Split Unit Air Conditioner",
                            ),
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(241, 241, 241, 1),
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              services[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Icon(Icons.radio_button_off),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
