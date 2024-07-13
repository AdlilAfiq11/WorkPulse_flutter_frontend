import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/models/service_model.dart';

class JobServiceReviewView extends StatefulWidget {
  final Service service;

  const JobServiceReviewView({super.key, required this.service});

  @override
  State<JobServiceReviewView> createState() => _JobServiceReviewViewState();
}

class _JobServiceReviewViewState extends State<JobServiceReviewView> {
  TextEditingController price = TextEditingController();
  TextEditingController quantity = TextEditingController();

  @override
  void initState() {
    super.initState();
    quantity.text = "1";
  }

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
        body: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Service',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 13),
                Row(children: [
                  const Icon(Icons.grid_view, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(widget.service.name),
                ]),
                const SizedBox(height: 13),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Icon(Icons.text_snippet_outlined, color: Colors.grey),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.service.description),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "View more",
                            style: TextStyle(
                              color: AppColor.mediumBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Unit price",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 4),
                        TextField(
                          controller: price,
                          decoration: InputDecoration(
                            hintText: "0.00",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 10, 0),
                              child: Text(
                                "RM",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 4),
                        TextField(
                          controller: quantity,
                          decoration: InputDecoration(
                            hintText: "1",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(height: 10),
                const Divider(color: Color.fromRGBO(241, 241, 241, 1)),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Items',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                          'Add item',
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
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: double.maxFinite,
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColor.blueViolet,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
              ),
              onPressed: () {},
              child: const Text(
                'Add service',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
        backgroundColor: AppColor.lightGrey,
      ),
    );
  }
}
