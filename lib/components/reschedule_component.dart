import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

// Reschedule Order Component
class RescheduleOrder extends StatefulWidget {
  const RescheduleOrder({super.key});

  @override
  State<RescheduleOrder> createState() => _RescheduleOrderState();
}

class _RescheduleOrderState extends State<RescheduleOrder> {
  DateTime? currentDate;
  String pickedDate = '';
  String pickedTime = '00:00';

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
        pickedDate = DateFormat.yMMMMd().format(date);
      });
    }
  }

  _pickTime() async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        color: Colors.white,
        height: 200,
        width: double.infinity,
        child: CupertinoDatePicker(
          backgroundColor: Colors.white,
          initialDateTime: currentDate,
          onDateTimeChanged: (DateTime newTime) {
            setState(() {
              pickedTime = DateFormat.Hms().format(newTime);
            });
          },
          use24hFormat: true,
          mode: CupertinoDatePickerMode.time,
        ),
      ),
    );
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                      side: BorderSide(color: Colors.grey.shade400, width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    leading: const Icon(Icons.calendar_today_outlined),
                    title: pickedDate != ''
                        ? Text(pickedDate)
                        : const Text('Select Date'),
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Time',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    onTap: _pickTime,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade400, width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    leading: const Icon(Icons.access_time_outlined),
                    title: Text(pickedTime),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColor.blueViolet,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      minimumSize: const Size(double.infinity, 50),
                      disabledBackgroundColor:
                          const Color.fromRGBO(31, 48, 94, .5),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
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
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please provide a reasonable reason to cancel this order',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Cancellation remark',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
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
                            borderSide: BorderSide(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.ceruleanBlue, width: 1.3),
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
                  const SizedBox(height: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColor.blueViolet,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      minimumSize: const Size(double.infinity, 50),
                      disabledBackgroundColor:
                          const Color.fromRGBO(31, 48, 94, .5),
                      elevation: 5,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
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
