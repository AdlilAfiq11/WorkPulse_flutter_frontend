import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/views/navigation/navigation_view.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  final formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  TextEditingController companyName = TextEditingController();
  TextEditingController identity = TextEditingController();
  String? companyType;
  File? image;

  @override
  Widget build(BuildContext context) {
    Widget form = Form(
      key: formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Company name",
          style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: companyName,
          decoration: InputDecoration(
            hintText: "Enter your company name",
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          textInputAction: TextInputAction.next,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        Text(
          "Company type",
          style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
        ),
        const SizedBox(height: 6),
        DropdownMenu(
          trailingIcon: Icon(
            Icons.keyboard_arrow_down,
            size: 32,
            color: AppColor.eerieBlack,
          ),
          selectedTrailingIcon: Icon(
            Icons.keyboard_arrow_up,
            size: 32,
            color: AppColor.eerieBlack,
          ),
          hintText: "Select your company type",
          textStyle: TextStyle(
            color: AppColor.eerieBlack,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            isCollapsed: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(5),
            ),
            constraints: const BoxConstraints(maxHeight: 50),
          ),
          menuStyle: const MenuStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            elevation: MaterialStatePropertyAll(10),
            surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
          ),
          initialSelection: companyType,
          onSelected: (value) => setState(() => companyType = value),
          expandedInsets: EdgeInsets.zero,
          dropdownMenuEntries: [
            DropdownMenuEntry(
              value: "Business",
              label: "Business",
              style: MenuItemButton.styleFrom(
                foregroundColor: AppColor.eerieBlack,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: LinearBorder.bottom(
                  side: const BorderSide(
                    color: Color.fromRGBO(241, 241, 241, 1),
                  ),
                ),
              ),
            ),
            DropdownMenuEntry(
              value: "Freelance",
              label: "Freelance",
              style: MenuItemButton.styleFrom(
                foregroundColor: AppColor.eerieBlack,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: LinearBorder.bottom(
                  side: const BorderSide(
                    color: Color.fromRGBO(241, 241, 241, 1),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (companyType != null) ...[
          Text(
            (companyType == "Business")
                ? "Business registeration name"
                : "NRIC",
            style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: identity,
            decoration: InputDecoration(
              hintText: (companyType == "Business")
                  ? "Eg: ABC-123456"
                  : "Eg: 911111-10-9999",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
        ],
        Text(
          "Upload company logo",
          style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
        ),
        const SizedBox(height: 6),
        if (image == null) ...[
          DottedBorder(
            color: AppColor.tropicalIndigo,
            strokeWidth: 2,
            borderType: BorderType.RRect,
            dashPattern: const [6, 4],
            padding: EdgeInsets.zero,
            radius: const Radius.circular(10),
            child: TextButton(
              onPressed: getImage,
              style: TextButton.styleFrom(
                foregroundColor: AppColor.mediumBlue,
                padding: const EdgeInsets.all(24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Icon(Icons.add, size: 32),
            ),
          ),
        ] else ...[
          GestureDetector(
            onTap: () => setState(() => image = null),
            child: Stack(clipBehavior: Clip.none, children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Image.file(
                  image!,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.none,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  color: Colors.white,
                ),
              ),
              const Positioned(
                top: 2,
                right: 2,
                child: Icon(Icons.cancel, color: Colors.black),
              ),
            ]),
          ),
        ],
        const SizedBox(height: 40),
        SizedBox(
          width: double.maxFinite,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColor.blueViolet,
              foregroundColor: Colors.white,
              disabledBackgroundColor: const Color.fromRGBO(31, 48, 94, .5),
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: AppColor.blueViolet),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const NavigationView(),
              ),
              (route) => false,
            ),
            child: const Text('Finish', style: TextStyle(fontSize: 18)),
          ),
        ),
      ]),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Complete your profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              form,
            ]),
          ),
        ),
      ),
    );
  }

  getImage() {
    picker
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
      requestFullMetadata: false,
    )
        .then(
      (value) {
        if (value == null) return;

        image = File(value.path);
        setState(() {});
      },
    );
  }
}
