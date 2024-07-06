import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/components/job_component.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    //Quick summary to shows Total Sales & Job Completed
    Widget quickSummary() => Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border(
                      right: BorderSide(
                        color: AppColor().lightGrey,
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Total Sales',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'RM 0.00',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor().matteBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 70,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Job Completed',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor().matteBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

    // Share request creation link
    Widget shareLink() => Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListTile(
            onTap: () {},
            tileColor: AppColor().blueViolet,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            leading: const Icon(
              Icons.share,
              color: Colors.white,
            ),
            title: const Text(
              'Share request creation link',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          ),
        );

    Widget headerJob() => Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 0, 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Todays Jobs',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: AppColor().lightGrey,
      appBar: AppBar(
        title: const Text(
          'Performance',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          //Total sales & Job Completed
          quickSummary(),

          //Link
          shareLink(),

          //List of the today's jobs
          headerJob(),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: ((context, index) => createJobCard()),
            ),
          ),
        ],
      ),
    );
  }
}
