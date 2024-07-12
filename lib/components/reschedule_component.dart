import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';

//TODO: Select Time
// Reschedule Order Component
class RescheduleOrder extends StatefulWidget {
  const RescheduleOrder({super.key});

  @override
  State<RescheduleOrder> createState() => _RescheduleOrderState();
}

class _RescheduleOrderState extends State<RescheduleOrder> {
  //Testing purpose
  final dynamic _time = '10.00 P.M';

  DateTime? currentDate;
  DateTime? pickedDate;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
  }

  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: currentDate!,
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: currentDate!,
    );
    if (date != null && date.isAfter(currentDate!)) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: const Text(
          'Reschedule Order',
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
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please select a date and time to reschedule',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    onTap: _pickDate,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    leading: const Icon(Icons.calendar_today_outlined),
                    title: pickedDate != null
                        ? Text(pickedDate.toString())
                        : const Text('Select Date'),
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Time',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    onTap: () {},
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    leading: const Icon(Icons.access_time_outlined),
                    title: Text(_time.toString()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Cancel Order Component
class CancelOrder extends StatelessWidget {
  CancelOrder({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _remark = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: const Text(
          'Cancel Order',
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
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please provide a reasonable reason to cancel this order',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Cancellation remark',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: TextFormField(
                        controller: _remark,
                        cursorHeight: 22,
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          hintText: 'Describe your reason to cancel',
                          hintStyle: const TextStyle(fontSize: 14),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.ceruleanBlue,
                              width: 1.3,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter cancellation remark';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: bottomButton(
              context,
              title: 'Confirm',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(context);
                } else {
                  _remark.text = '';
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
