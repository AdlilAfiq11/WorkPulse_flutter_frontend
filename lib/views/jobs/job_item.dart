import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

class JobItemView extends StatefulWidget {
  const JobItemView({super.key});

  @override
  State<JobItemView> createState() => _JobItemViewState();
}

class _JobItemViewState extends State<JobItemView> {
  TextEditingController search = TextEditingController();
  List<String> items = [
    "MITSUBISHI",
    "MITSUBISHI",
    "SAMSUNG",
    "SAMSUNG",
    "PANASONIC",
    "PANASONIC",
  ];

  List<String> itemSubs = [
    "MS-JR10VF",
    "MS-JR13VF",
    "AR-10BYEAAWKNME",
    "AR-18BYFAMWKNME",
    "FM15EXVBKQH",
    "FM15EXVBKQH",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add new item', style: TextStyle(fontSize: 20)),
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
                  'Select item',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 13),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: search,
                  decoration: InputDecoration(
                    hintText: "Search item",
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
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index],
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  itemSubs[index],
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
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
