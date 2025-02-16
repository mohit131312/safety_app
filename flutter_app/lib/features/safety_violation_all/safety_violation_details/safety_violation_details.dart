import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_elevated_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/safety_violation_all/safety_attestaion/safety_attestaion_screen.dart';
import 'package:flutter_app/features/safety_violation_all/safety_violation_details/safety_violation_details_controller.dart';
import 'package:flutter_app/features/safety_violation_all/select_assignee/select_safety_assignee.dart';
import 'package:flutter_app/features/safety_violation_all/select_assignee/select_safety_assignee_controller.dart';
import 'package:flutter_app/features/safety_violation_all/select_informed_people/select_safety_informed_people.dart';
import 'package:flutter_app/features/safety_violation_all/select_informed_people/select_safety_informed_people_controller.dart';
import 'package:flutter_app/features/safety_violation_all/select_involved_person/select_involved_person.dart';
import 'package:flutter_app/features/safety_violation_all/select_involved_person/select_involved_person_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SafetyViolationDetails extends StatelessWidget {
  SafetyViolationDetails({super.key});
  final SelectInvolvedPersonController selectInvolvedPersonController =
      Get.put(SelectInvolvedPersonController());
  final SelectSafetyInformedPeopleController
      selectSafetyInformedPeopleController =
      Get.put(SelectSafetyInformedPeopleController());
  final SafetyViolationDetailsController safetyViolationDetailsController =
      Get.put(SafetyViolationDetailsController());

  final SelectSafetyAssigneeController selectSafetyAssigneeController =
      Get.put(SelectSafetyAssigneeController());
  void showBuildingSelectionSheetIncident(
      BuildContext context, SafetyViolationDetails controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppTextWidget(
                    text: 'Select Building',
                    fontSize: AppTextSize.textSizeMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 20,
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Container(
                height: 1.2,
                width: SizeConfig.widthMultiplier * 100,
                decoration: BoxDecoration(color: Colors.grey),
              ),

              SizedBox(height: SizeConfig.heightMultiplier * 2.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5.5,
                    width: SizeConfig.widthMultiplier * 82,
                    child: TextField(
                      controller: safetyViolationDetailsController
                          .searchControllerIncident,
                      // readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Search here..',
                        hintStyle: TextStyle(
                          fontSize: AppTextSize.textSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: AppColors.searchfeild,
                        ),
                        prefixIcon: Container(
                          padding:
                              EdgeInsets.all(10.0), // Adjust padding as needed

                          child: Image.asset(
                            'assets/icons/Search.png',
                            fit: BoxFit
                                .contain, // Ensures it stays within the box
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 0.5),
                        ),
                      ),
                      onChanged: (value) {
                        safetyViolationDetailsController
                            .searchDataIncident(value);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              SizedBox(
                height: 270,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(() {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: safetyViolationDetailsController
                              .filteredDetailsIncident.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  visualDensity: VisualDensity.compact,
                                  contentPadding: EdgeInsets.only(
                                      top: 0, bottom: 0, left: 16, right: 16),
                                  leading: SizedBox(
                                    width: 24.0,
                                    height: 24.0,
                                    child: Checkbox(
                                      value: safetyViolationDetailsController
                                              .filteredDetailsIncident[index]
                                          ['isChecked'] as bool,
                                      activeColor: AppColors.buttoncolor,
                                      side: BorderSide(
                                        color: AppColors.secondaryText,
                                        width: 1.2,
                                      ),
                                      onChanged: (bool? value) {
                                        safetyViolationDetailsController
                                            .toggleCheckboxIncident(index);
                                      },
                                    ),
                                  ),
                                  title: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //${index + 1}.

                                      AppTextWidget(
                                        text: safetyViolationDetailsController
                                            .filteredDetailsIncident[index]
                                                ['title']
                                            .toString(),
                                        fontSize:
                                            AppTextSize.textSizeExtraSmall,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.secondaryText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttoncolor, // Button color
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // ✅ Rounded Corners
                    ),
                  ),
                  child: Text(
                    "Add To List",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
            ],
          ),
        );
      },
    );
  }

//------------------------------------------------------------
  void showBuildingSelectionSheetAow(
      BuildContext context, SafetyViolationDetails controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppTextWidget(
                    text: 'Select area of work',
                    fontSize: AppTextSize.textSizeMedium,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 20,
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Container(
                height: 1.2,
                width: SizeConfig.widthMultiplier * 100,
                decoration: BoxDecoration(color: Colors.grey),
              ),

              SizedBox(height: SizeConfig.heightMultiplier * 2.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 5.5,
                    width: SizeConfig.widthMultiplier * 82,
                    child: TextField(
                      controller:
                          safetyViolationDetailsController.searchControllerAow,
                      // readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Search here..',
                        hintStyle: TextStyle(
                          fontSize: AppTextSize.textSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: AppColors.searchfeild,
                        ),
                        prefixIcon: Container(
                          padding:
                              EdgeInsets.all(10.0), // Adjust padding as needed

                          child: Image.asset(
                            'assets/icons/Search.png',
                            fit: BoxFit
                                .contain, // Ensures it stays within the box
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 0.5),
                        ),
                      ),
                      onChanged: (value) {
                        safetyViolationDetailsController.searchDataAow(value);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              SizedBox(
                height: 270,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(() {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: safetyViolationDetailsController
                              .filteredDetailsAow.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  visualDensity: VisualDensity.compact,
                                  contentPadding: EdgeInsets.only(
                                      top: 0, bottom: 0, left: 16, right: 16),
                                  leading: SizedBox(
                                    width: 24.0,
                                    height: 24.0,
                                    child: Checkbox(
                                      value: safetyViolationDetailsController
                                              .filteredDetailsAow[index]
                                          ['isChecked'] as bool,
                                      activeColor: AppColors.buttoncolor,
                                      side: BorderSide(
                                        color: AppColors.secondaryText,
                                        width: 1.2,
                                      ),
                                      onChanged: (bool? value) {
                                        safetyViolationDetailsController
                                            .toggleCheckboxAow(index);
                                      },
                                    ),
                                  ),
                                  title: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //${index + 1}.

                                      AppTextWidget(
                                        text: safetyViolationDetailsController
                                            .filteredDetailsAow[index]['title']
                                            .toString(),
                                        fontSize:
                                            AppTextSize.textSizeExtraSmall,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.secondaryText,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttoncolor, // Button color
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // ✅ Rounded Corners
                    ),
                  ),
                  child: Text(
                    "Add To List",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //  resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.heightMultiplier * 10),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: AppBar(
            scrolledUnderElevation: 0.0,
            elevation: 0,
            backgroundColor: AppColors.buttoncolor,
            foregroundColor: AppColors.buttoncolor,
            centerTitle: true,
            toolbarHeight: SizeConfig.heightMultiplier * 10,
            title: Padding(
              padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
              child: AppTextWidget(
                text: 'Safety Violation & Debit Note',
                fontSize: AppTextSize.textSizeMedium,
                fontWeight: FontWeight.w400,
                color: AppColors.primary,
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: SizeConfig.heightMultiplier * 2.5,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 4,
            vertical: SizeConfig.heightMultiplier * 2,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.50,
                    backgroundColor: AppColors.searchfeildcolor,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.defaultPrimary),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '01/02',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
            AppTextWidget(
              text: 'Violation Details',
              fontSize: AppTextSize.textSizeMediumm,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.3,
            ),
            AppTextWidget(
              text: 'Enter violation information in details.',
              fontSize: AppTextSize.textSizeSmalle,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.5,
            ),

            ////---------------
            Column(
              children: [
                Row(
                  children: [
                    AppTextWidget(
                      text: 'Photo',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Obx(
                  () => safetyViolationDetailsController.violationImageCount < 1
                      ? GestureDetector(
                          onTap: () {
                            safetyViolationDetailsController
                                .pickViolationImages();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: SizeConfig.widthMultiplier * 92,
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 24, bottom: 24),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.orange, width: 2),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.orange.shade50,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.orange,
                                  size: 30,
                                ),
                                SizedBox(height: 8),
                                AppTextWidget(
                                    text: 'Maximum 5 Files',
                                    fontSize: AppTextSize.textSizeExtraSmall,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.secondaryText),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Ensure items align properly

                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            safetyViolationDetailsController
                                                .violationimg.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              3, // Ensures one row (horizontal scroll)

                                          childAspectRatio:
                                              1, // Keeps items square
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing:
                                              10, // Spacing between images
                                        ),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Stack(
                                            children: [
                                              SizedBox(
                                                height: SizeConfig
                                                        .imageSizeMultiplier *
                                                    18,
                                                width: SizeConfig
                                                        .imageSizeMultiplier *
                                                    18,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12), // Clip image to match container

                                                  child: Image.file(
                                                    File(
                                                        safetyViolationDetailsController
                                                            .violationimg[index]
                                                            .path),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 1,
                                                right: 1,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    safetyViolationDetailsController
                                                        .removeViolationImage(
                                                            index);
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.black
                                                          .withOpacity(0.8),
                                                    ),
                                                    child: Icon(Icons.close,
                                                        color: Colors.white,
                                                        size: 15),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  width: SizeConfig.imageSizeMultiplier * 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    safetyViolationDetailsController
                                        .pickViolationImages();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: SizeConfig.imageSizeMultiplier * 18,
                                    width: SizeConfig.imageSizeMultiplier * 18,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.orange, width: 2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.orange,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),

                safetyViolationDetailsController.violationImageCount < 1
                    ? SizedBox(
                        height: SizeConfig.heightMultiplier * 1,
                      )
                    : SizedBox(),
                safetyViolationDetailsController.violationImageCount < 1
                    ? Row(
                        children: [
                          AppTextWidget(
                              text: 'Maximum 5 files (photos/1 video)',
                              fontSize: AppTextSize.textSizeExtraSmall,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryText),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2.5,
                ),

                Row(
                  children: [
                    AppTextWidget(
                      text: 'Violation Type',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      // isDense: false,

                      value: safetyViolationDetailsController
                              .selectViolation.value.isNotEmpty
                          ? safetyViolationDetailsController
                              .selectViolation.value
                          : null,
                      items: safetyViolationDetailsController.violation
                          .map((violation) => DropdownMenuItem(
                                value: violation,
                                child: AppTextWidget(
                                    text: violation,
                                    fontSize: AppTextSize.textSizeMedium,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryText),
                              ))
                          .toList(),
                      onChanged: (value) {
                        safetyViolationDetailsController.selectViolation.value =
                            value ?? '';
                      },
                      hint: AppTextWidget(
                        text: 'Select Type',
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchfeild,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down, // Your custom dropdown icon
                        color: AppColors.searchfeild, // Adjust color as needed
                        size: 27,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 126, 16, 9),
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 126, 16, 9),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),

                Row(
                  children: [
                    AppTextWidget(
                      text: 'Category',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      // isDense: false,

                      value: safetyViolationDetailsController
                              .selectCategory.value.isNotEmpty
                          ? safetyViolationDetailsController
                              .selectCategory.value
                          : null,
                      items: safetyViolationDetailsController.category
                          .map((category) => DropdownMenuItem(
                                value: category,
                                child: AppTextWidget(
                                    text: category,
                                    fontSize: AppTextSize.textSizeMedium,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryText),
                              ))
                          .toList(),
                      onChanged: (value) {
                        safetyViolationDetailsController.selectCategory.value =
                            value ?? '';
                      },
                      hint: AppTextWidget(
                        text: 'Select Category',
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchfeild,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down, // Your custom dropdown icon
                        color: AppColors.searchfeild, // Adjust color as needed
                        size: 27,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 126, 16, 9),
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 126, 16, 9),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Row(
                  children: [
                    AppTextWidget(
                      text: 'Enter Details',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: TextFormField(
                    controller:
                        safetyViolationDetailsController.detailsController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Eneter Details',
                      hintStyle: TextStyle(
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchfeild,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.searchfeildcolor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.searchfeildcolor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 126, 16, 9),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 126, 16, 9),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                //---------------------------

//------------------------------------------------------
                Row(
                  children: [
                    AppTextWidget(
                      text: 'Location of Breach',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: TextFormField(
                    controller: safetyViolationDetailsController
                        .loactionofBreachController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Eneter Details',
                      hintStyle: TextStyle(
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchfeild,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.searchfeildcolor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.searchfeildcolor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 126, 16, 9),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 126, 16, 9),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),

                //------------------------------
                Row(
                  children: [
                    AppTextWidget(
                      text: 'Risk Level',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      // isDense: false,

                      value: safetyViolationDetailsController
                              .selectRisklevel.value.isNotEmpty
                          ? safetyViolationDetailsController
                              .selectRisklevel.value
                          : null,
                      items: safetyViolationDetailsController.risklevel
                          .map((risklevel) => DropdownMenuItem(
                                value: risklevel,
                                child: AppTextWidget(
                                    text: risklevel,
                                    fontSize: AppTextSize.textSizeMedium,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryText),
                              ))
                          .toList(),
                      onChanged: (value) {
                        safetyViolationDetailsController.selectRisklevel.value =
                            value ?? '';
                      },
                      hint: AppTextWidget(
                        text: 'Select Risk Level',
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchfeild,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down, // Your custom dropdown icon
                        color: AppColors.searchfeild, // Adjust color as needed
                        size: 27,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 126, 16, 9),
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 126, 16, 9),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ), //------------------------------

                Row(
                  children: [
                    AppTextWidget(
                      text: 'Turn Around Time',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: TextFormField(
                    controller: safetyViolationDetailsController
                        .turnArounttimeController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Select Turn Around Time',
                      hintStyle: TextStyle(
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchfeild,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.searchfeildcolor, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: AppColors.searchfeildcolor, width: 1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 126, 16, 9),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 126, 16, 9),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
                Row(
                  children: [
                    AppTextWidget(
                      text: 'Source of Observation',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => DropdownButtonFormField<String>(
                      // isDense: false,

                      value: safetyViolationDetailsController
                              .selectObservation.value.isNotEmpty
                          ? safetyViolationDetailsController
                              .selectObservation.value
                          : null,
                      items: safetyViolationDetailsController.observation
                          .map((observation) => DropdownMenuItem(
                                value: observation,
                                child: AppTextWidget(
                                    text: observation,
                                    fontSize: AppTextSize.textSizeMedium,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryText),
                              ))
                          .toList(),
                      onChanged: (value) {
                        safetyViolationDetailsController
                            .selectObservation.value = value ?? '';
                      },
                      hint: AppTextWidget(
                        text: 'Select Source of Observation',
                        fontSize: AppTextSize.textSizeSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.searchfeild,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down, // Your custom dropdown icon
                        color: AppColors.searchfeild, // Adjust color as needed
                        size: 27,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.searchfeildcolor, width: 1),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 126, 16, 9),
                            width: 1,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 126, 16, 9),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),

                Row(
                  children: [
                    AppTextWidget(
                      text: 'Select Involved Persons',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                Obx(() {
                  final added = selectInvolvedPersonController.addedPersons.keys
                      .where(
                        (key) =>
                            selectInvolvedPersonController.addedPersons[key] ==
                            true,
                      )
                      .toList();

                  if (added.isEmpty) {
                    return SizedBox.shrink(); // Hide when no contacts are added
                  }

                  return Column(
                    children: added.map((name) {
                      final contact = selectInvolvedPersonController
                          .selectInvoledPersons.values
                          .expand((list) => list)
                          .firstWhere((c) => c['name'] == name,
                              orElse: () => {});

                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.heightMultiplier * 1,
                          horizontal: SizeConfig.widthMultiplier * 4,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// **Profile Image**
                            Container(
                              width: SizeConfig.imageSizeMultiplier * 15,
                              height: SizeConfig.imageSizeMultiplier * 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/person_labour.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: SizeConfig.widthMultiplier * 4),

                            /// **Name & Designation**
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextWidget(
                                  text: name,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryText,
                                ),
                                SizedBox(
                                    height: SizeConfig.heightMultiplier * 0.5),
                                AppTextWidget(
                                  text: contact['designation'] ?? 'Unknown',
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondaryText,
                                ),
                              ],
                            ),

                            Spacer(),

                            /// **Remove Button**
                            GestureDetector(
                              onTap: () {
                                selectInvolvedPersonController
                                    .removeAddedPersons(name);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: AppColors.thirdText,
                        width: 0.8,
                      ),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Get.to(SelectInvolvedPerson());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 28,
                        color: AppColors.thirdText,
                        weight: 0.2,
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 1,
                      ),
                      AppTextWidget(
                        text: "Add Involved Persons",
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w400,
                        color: AppColors.thirdText,
                      ),
                    ],
                  ),
                ),
//-----------------------------------

//--------------------------------

                SizedBox(height: SizeConfig.heightMultiplier * 3),

                Row(
                  children: [
                    AppTextWidget(
                      text: 'Select Informed People',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                Obx(() {
                  final added = selectSafetyInformedPeopleController
                      .addedInformedPeople.keys
                      .where(
                        (key) =>
                            selectSafetyInformedPeopleController
                                .addedInformedPeople[key] ==
                            true,
                      )
                      .toList();

                  if (added.isEmpty) {
                    return SizedBox.shrink(); // Hide when no contacts are added
                  }

                  return Column(
                    children: added.map((name) {
                      final contact = selectSafetyInformedPeopleController
                          .selectinformedPeople.values
                          .expand((list) => list)
                          .firstWhere((c) => c['name'] == name,
                              orElse: () => {});

                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.heightMultiplier * 1,
                          horizontal: SizeConfig.widthMultiplier * 4,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// **Profile Image**
                            Container(
                              width: SizeConfig.imageSizeMultiplier * 15,
                              height: SizeConfig.imageSizeMultiplier * 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/person_labour.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: SizeConfig.widthMultiplier * 4),

                            /// **Name & Designation**
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextWidget(
                                  text: name,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryText,
                                ),
                                SizedBox(
                                    height: SizeConfig.heightMultiplier * 0.5),
                                AppTextWidget(
                                  text: contact['designation'] ?? 'Unknown',
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondaryText,
                                ),
                              ],
                            ),

                            Spacer(),

                            /// **Remove Button**
                            GestureDetector(
                              onTap: () {
                                selectSafetyInformedPeopleController
                                    .removeAddedInformedPeople(name);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: AppColors.thirdText,
                        width: 0.8,
                      ),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Get.to(SelectSafetyInformedPeople());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 28,
                        color: AppColors.thirdText,
                        weight: 0.2,
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 1,
                      ),
                      AppTextWidget(
                        text: "Add Informed People",
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w400,
                        color: AppColors.thirdText,
                      ),
                    ],
                  ),
                ),

                //-----------------------------------------------------------------
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                // Row(
                //   children: [
                //     AppTextWidget(
                //       text: 'Select Assignee',
                //       fontSize: AppTextSize.textSizeSmall,
                //       fontWeight: FontWeight.w500,
                //       color: AppColors.primaryText,
                //     ),
                //     AppTextWidget(
                //         text: AppTexts.star,
                //         fontSize: AppTextSize.textSizeExtraSmall,
                //         fontWeight: FontWeight.w400,
                //         color: AppColors.starcolor),
                //   ],
                // ),

                // SizedBox(
                //   height: SizeConfig.heightMultiplier * 2.5,
                // ),

                Row(
                  children: [
                    AppTextWidget(
                      text: 'Select Assignee',
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                    AppTextWidget(
                        text: AppTexts.star,
                        fontSize: AppTextSize.textSizeExtraSmall,
                        fontWeight: FontWeight.w400,
                        color: AppColors.starcolor),
                  ],
                ),
                Obx(() {
                  final addedNames = selectSafetyAssigneeController
                      .addedAssignee.keys
                      .where(
                        (key) =>
                            selectSafetyAssigneeController.addedAssignee[key] ==
                            true,
                      )
                      .toList();

                  if (addedNames.isEmpty) {
                    return SizedBox.shrink(); // Hide when no contacts are added
                  }

                  return Column(
                    children: addedNames.map((name) {
                      final contact = selectSafetyAssigneeController
                          .selectlistAssignee.values
                          .expand((list) => list)
                          .firstWhere((c) => c['name'] == name,
                              orElse: () => {});

                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.heightMultiplier * 1,
                          horizontal: SizeConfig.widthMultiplier * 4,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// **Profile Image**
                            Container(
                              width: SizeConfig.imageSizeMultiplier * 15,
                              height: SizeConfig.imageSizeMultiplier * 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/person_labour.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: SizeConfig.widthMultiplier * 4),

                            /// **Name & Designation**
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextWidget(
                                  text: name,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryText,
                                ),
                                SizedBox(
                                    height: SizeConfig.heightMultiplier * 0.5),
                                AppTextWidget(
                                  text: contact['designation'] ?? 'Unknown',
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondaryText,
                                ),
                              ],
                            ),

                            Spacer(),

                            /// **Remove Button**
                            GestureDetector(
                              onTap: () {
                                selectSafetyAssigneeController
                                    .removeAddedAssignee(name);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                }),

                SizedBox(
                  height: SizeConfig.heightMultiplier * 1,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: AppColors.thirdText,
                        width: 0.8,
                      ),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Get.off(SelectSafetyAssignee());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 28,
                        color: AppColors.thirdText,
                        weight: 0.2,
                      ),
                      SizedBox(
                        width: SizeConfig.widthMultiplier * 1,
                      ),
                      AppTextWidget(
                        text: "Select Assignee",
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w400,
                        color: AppColors.thirdText,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
            ),
            AppElevatedButton(
                text: 'Next',
                onPressed: () {
                  Get.to(SafetyAttestaionScreen());
                }),
            SizedBox(height: SizeConfig.heightMultiplier * 5),
          ]),
        ),
      ),
    );
  }
}
