import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/components/payment_component.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/utils/main_utils.dart';

//TODO: Apply discount
//TODO: Complete payment page

enum PaymentMethod { notSelected, cash, online }

class ConfirmPaymentView extends StatefulWidget {
  const ConfirmPaymentView({super.key});

  @override
  State<ConfirmPaymentView> createState() => _ConfirmPaymentViewState();
}

class _ConfirmPaymentViewState extends State<ConfirmPaymentView> {
  PaymentMethod? _method = PaymentMethod.notSelected;

  //Testing pupose
  double totalAmountTest = 90.00;
  double discountPriceTest = 0;
  double discountTest = 10;

  bool isDiscount = false;

  void discount() {
    discountPriceTest = totalAmountTest - discountTest;
    setState(() {});
  }

  Widget continueButton() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: AppColor.blueViolet,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: AppColor.blueViolet,
            disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
            elevation: 5,
          ),
          onPressed: () {},
          child: const Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        title: const Text(
          'Confirm Payment',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: AppColor.blueViolet,
        elevation: 5,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(13),
                  child: Text(
                    'Select Payment Method',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  dense: true,
                  title: const Text(
                    'Cash',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Radio<PaymentMethod>(
                    visualDensity: VisualDensity.comfortable,
                    value: PaymentMethod.cash,
                    groupValue: _method,
                    onChanged: (PaymentMethod? value) {
                      setState(() {
                        _method = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  dense: true,
                  title: const Text(
                    'Online Payment',
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Radio<PaymentMethod>(
                    visualDensity: VisualDensity.comfortable,
                    value: PaymentMethod.online,
                    groupValue: _method,
                    onChanged: (PaymentMethod? value) {
                      setState(() {
                        _method = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Apply Discount',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      isDiscount = true;
                      discount();
                    },
                    child: isDiscount
                        ? Row(
                            children: [
                              Text(
                                '-RM$discountTest',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.edit,
                                color: AppColor.ceruleanBlue,
                                size: 18,
                              )
                            ],
                          )
                        : Text(
                            'Apply',
                            style: TextStyle(
                              color: AppColor.electricIndigo,
                              fontSize: 16,
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13, 10, 13, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Row(
                    children: [
                      if (isDiscount) ...{
                        Text(
                          'RM $discountPriceTest',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      },
                      const SizedBox(width: 10),
                      Text(
                        'RM $totalAmountTest',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomButton(
            context,
            title: 'Continue',
            onPressed: _method != PaymentMethod.notSelected
                ? () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CompletePayment()))
                : () {
                    customShowToast(
                      context,
                      text: "Please select payment method before continue.",
                      color: Colors.red.shade300,
                    );
                  },
          ),
        ],
      ),
    );
  }
}
