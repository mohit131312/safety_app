import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_elevated_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/staff/staff_add/add_staff_controller.dart';
import 'package:flutter_app/features/staff/staff_documentation/staff_documentation.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddStaffScreen extends StatelessWidget {
  AddStaffScreen({super.key});

  final AddStaffController addStaffController = Get.put(AddStaffController());

  TextEditingController dateController = TextEditingController();

  void showDatePicker(
      BuildContext context, AddStaffController addStaffController) {
    DateTime tempPickedDate =
        addStaffController.selectedStaffDate.value ?? DateTime.now();

    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextWidget(
                    text: 'Date of Birth',
                    fontSize: AppTextSize.textSizeMediumm,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                ),
                Container(
                  width: SizeConfig.widthMultiplier * 100,
                  height: SizeConfig.heightMultiplier * 0.1,
                  color: AppColors.secondaryText,
                ),
                // Date Picker
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 120,
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.buttoncolor,
                          ),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: tempPickedDate.isAfter(DateTime.now())
                            ? DateTime.now()
                            : tempPickedDate,
                        maximumDate: DateTime.now(),
                        onDateTimeChanged: (DateTime newDate) {
                          tempPickedDate = newDate;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: AppTextWidget(
                        text: 'Cancel',
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryText,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        addStaffController
                            .updateDate(tempPickedDate); // Save date
                        Navigator.pop(context);
                      },
                      child: AppTextWidget(
                        text: 'Done',
                        fontSize: AppTextSize.textSizeSmallm,
                        fontWeight: FontWeight.w600,
                        color: AppColors.buttoncolor,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTextField(String hint, index) {
    return TextFormField(
      controller: addStaffController.addressStaffControllers[index],
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: AppTextSize.textSizeSmall,
          fontWeight: FontWeight.w400,
          color: AppColors.searchfeild,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.searchfeildcolor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.searchfeildcolor, width: 1),
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
      onChanged: (value) {
        addStaffController.updateFormattedAddress();
      },
    );
  }

  Widget buildTextField2(String hint, index) {
    return TextFormField(
      controller: addStaffController.permanantAddressStaffController[index],
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: AppTextSize.textSizeSmall,
          fontWeight: FontWeight.w400,
          color: AppColors.searchfeild,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.searchfeildcolor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.searchfeildcolor, width: 1),
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
      onChanged: (value) {
        addStaffController.updateFormattedpermenantAddress();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
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
                  text: 'Add Staff',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.2,
                          backgroundColor: AppColors.searchfeildcolor,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.defaultPrimary),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '01/05',
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
                    text: AppTexts.personaldetailss,
                    fontSize: AppTextSize.textSizeMediumm,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 0.3,
                  ),
                  AppTextWidget(
                    text: AppTexts.enterstaffdetails,
                    fontSize: AppTextSize.textSizeSmalle,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryText,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.5,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                          text: AppTexts.profilephoto,
                          fontSize: AppTextSize.textSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryText),
                      AppTextWidget(
                          text: AppTexts.star,
                          fontSize: AppTextSize.textSizeExtraSmall,
                          fontWeight: FontWeight.w400,
                          color: AppColors.starcolor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Stack(
                            children: [
                              Obx(
                                () => Container(
                                  decoration: BoxDecoration(
                                    shape:
                                        BoxShape.circle, // Circular container
                                    color: AppColors.textfeildcolor,
                                  ),
                                  height: SizeConfig.imageSizeMultiplier * 28,
                                  width: SizeConfig.imageSizeMultiplier * 28,
                                  child: ClipOval(
                                    child: addStaffController
                                            .selectedImgPath.isNotEmpty
                                        ? Image.file(
                                            File(addStaffController
                                                .selectedImgPath.value),
                                            fit: BoxFit.cover,
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(30.0),
                                            child: Image.asset(
                                              'assets/images/blackUser.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: SizeConfig.heightMultiplier * 1,
                            left: SizeConfig.heightMultiplier * 7,
                            child: GestureDetector(
                              onTap: () => addStaffController.pickStaffImage(),
                              child: Container(
                                height: SizeConfig.imageSizeMultiplier * 8,
                                width: SizeConfig.imageSizeMultiplier * 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.fourtText,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.thirdText,
                                  ),
                                  height: SizeConfig.imageSizeMultiplier * 6,
                                  width: SizeConfig.imageSizeMultiplier * 6,
                                  child: Image.asset(
                                      "assets/icons/camera_icon.png"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                        text: AppTexts.fullname,
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
                      controller: addStaffController.fullnameStaffController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Full Name',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                          return 'Only letters are allowed';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                        text: AppTexts.gender,
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
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                          addStaffController.staffgenders.length, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 1),
                          child: ChoiceChip(
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  addStaffController.staffgenders[index]['icon']
                                      .toString(),
                                  height: SizeConfig.imageSizeMultiplier * 4,
                                  width: SizeConfig.imageSizeMultiplier * 4,
                                ),
                                SizedBox(width: 5),
                                Text(addStaffController.staffgenders[index]
                                        ['label'] ??
                                    ''),
                              ],
                            ),
                            selected:
                                addStaffController.selectedStaffGender.value ==
                                    index,
                            onSelected: (selected) {
                              addStaffController.selectStaffGender(index);
                            },
                            selectedColor: Colors.blue[100], // Adjust as needed
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: addStaffController
                                          .selectedStaffGender.value ==
                                      index
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                            ),
                            labelStyle: TextStyle(
                              color: addStaffController
                                          .selectedStaffGender.value ==
                                      index
                                  ? Colors.black
                                  : Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                        text: AppTexts.dob,
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
                  GestureDetector(
                    onTap: () => showDatePicker(context, addStaffController),
                    child: Obx(
                      () => TextFormField(
                        controller: addStaffController.dateStaffController,
                        decoration: InputDecoration(
                          hintText:
                              addStaffController.selectedStaffDate.value == null
                                  ? "Select Date"
                                  : addStaffController.dateStaffController
                                      .text, // Show selected date
                          hintStyle: TextStyle(
                            fontSize: AppTextSize.textSizeSmall,
                            fontWeight: FontWeight.w400,
                            color: AppColors.searchfeild,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: AppColors.searchfeildcolor, width: 1),
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
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8),
                            child: GestureDetector(
                              onTap: () =>
                                  showDatePicker(context, addStaffController),
                              child: Image.asset(
                                'assets/icons/calendar.png',
                                height: SizeConfig.imageSizeMultiplier * 3,
                                width: SizeConfig.imageSizeMultiplier * 3,
                              ),
                            ),
                          ),
                        ),
                        readOnly: true, // Prevent manual input
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  AppTextWidget(
                    text: AppTexts.bloodgrp,
                    fontSize: AppTextSize.textSizeSmall,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
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

                        value: addStaffController
                                .selectedBloodGroup.value.isNotEmpty
                            ? addStaffController.selectedBloodGroup.value
                            : null,
                        items: addStaffController.bloodGroups
                            .map((activity) => DropdownMenuItem(
                                  value: activity,
                                  child: AppTextWidget(
                                      text: activity,
                                      fontSize: AppTextSize.textSizeMedium,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryText),
                                ))
                            .toList(),
                        onChanged: (value) {
                          //  controller.selectedActivity.value = value ?? '';
                          addStaffController.selectedBloodGroup.value =
                              value ?? ''; // Update selectedBloodGroup
                        },
                        hint: AppTextWidget(
                          text: 'Select Blood Group',
                          fontSize: AppTextSize.textSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: AppColors.searchfeild,
                        ),
                        icon: Icon(
                          Icons
                              .keyboard_arrow_down, // Your custom dropdown icon
                          color:
                              AppColors.searchfeild, // Adjust color as needed
                          size: 27,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 12),
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
                  AppTextWidget(
                    text: AppTexts.reasonforvisit,
                    fontSize: AppTextSize.textSizeSmall,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
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

                        value:
                            addStaffController.selectedreasons.value.isNotEmpty
                                ? addStaffController.selectedreasons.value
                                : null,
                        items: addStaffController.reasons
                            .map((reasons) => DropdownMenuItem(
                                  value: reasons,
                                  child: Text(
                                    reasons,
                                    style: TextStyle(
                                        fontSize: AppTextSize.textSizeSmalle,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.secondaryText),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          addStaffController.selectedreasons.value =
                              value ?? '';
                        },
                        hint: AppTextWidget(
                          text: 'Select Reason',
                          fontSize: AppTextSize.textSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: AppColors.searchfeild,
                        ),
                        icon: Icon(
                          Icons
                              .keyboard_arrow_down, // Your custom dropdown icon
                          color:
                              AppColors.searchfeild, // Adjust color as needed
                          size: 27,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 12),
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
                        text: AppTexts.contactno,
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
                          addStaffController.contactnumberStaffController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Contact Number',
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
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 13, bottom: 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.searchfeildcolor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addStaffController.toggleExpansion();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppTextWidget(
                                      text: 'Current Address',
                                      fontSize: AppTextSize.textSizeSmall,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryText,
                                    ),
                                    AppTextWidget(
                                      text: AppTexts.star,
                                      fontSize: AppTextSize.textSizeExtraSmall,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.starcolor,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons
                                    .keyboard_arrow_down, // Your custom dropdown icon
                                color: AppColors
                                    .searchfeild, // Adjust color as needed
                                size: 27,
                              ),
                            ],
                          ),
                        ),

                        Obx(() => addStaffController.isExpanded.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(6, (index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1),
                                      AppTextWidget(
                                        text: addStaffController
                                            .addressLabels[index],
                                        fontSize: AppTextSize.textSizeSmall,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryText,
                                      ),
                                      SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1),
                                      buildTextField(
                                        "Enter ${addStaffController.addressLabels[index]}",
                                        index,
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  );
                                }),
                              )
                            : SizedBox()), // Empty SizedBox when collapsed

                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 3,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 13, bottom: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.searchfeildcolor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            addStaffController.toggleExpansion2();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppTextWidget(
                                      text: 'Permanent Address',
                                      fontSize: AppTextSize.textSizeSmall,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryText,
                                    ),
                                    AppTextWidget(
                                      text: AppTexts.star,
                                      fontSize: AppTextSize.textSizeExtraSmall,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.starcolor,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons
                                    .keyboard_arrow_down, // Your custom dropdown icon
                                color: AppColors
                                    .searchfeild, // Adjust color as needed
                                size: 27,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 1),
                        Obx(() => addStaffController.isExpanded2.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(6, (index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppTextWidget(
                                        text: addStaffController
                                            .addresspermanantLabels[index],
                                        fontSize: AppTextSize.textSizeSmall,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryText,
                                      ),
                                      SizedBox(
                                          height:
                                              SizeConfig.heightMultiplier * 1),
                                      buildTextField2(
                                        "Enter ${addStaffController.addresspermanantLabels[index]}",
                                        index,
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  );
                                }),
                              )
                            : SizedBox()), // Empty SizedBox when collapsed
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  AppTextWidget(
                    text: AppTexts.emergencydetails,
                    fontSize: AppTextSize.textSizeSmallm,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                        text: AppTexts.emergencyname,
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
                          addStaffController.econtactnameStaffController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Emergency contact name',
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
                        text: AppTexts.emergencynumber,
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
                          addStaffController.econtactnumberStaffController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Emergency contact number',
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
                        text: AppTexts.emergencyrelation,
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

                        value:
                            addStaffController.selectedrelation.value.isNotEmpty
                                ? addStaffController.selectedrelation.value
                                : null,
                        items: addStaffController.relations
                            .map((relations) => DropdownMenuItem(
                                  value: relations,
                                  child: Text(
                                    relations,
                                    style: TextStyle(
                                        fontSize: AppTextSize.textSizeSmalle,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.secondaryText),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          addStaffController.selectedrelation.value =
                              value ?? '';
                        },
                        hint: AppTextWidget(
                          text: 'Emergency contact relation',
                          fontSize: AppTextSize.textSizeSmall,
                          fontWeight: FontWeight.w400,
                          color: AppColors.searchfeild,
                        ),
                        icon: Icon(
                          Icons
                              .keyboard_arrow_down, // Your custom dropdown icon
                          color:
                              AppColors.searchfeild, // Adjust color as needed
                          size: 27,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 13, horizontal: 12),
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
                  SizedBox(height: SizeConfig.heightMultiplier * 5),
                  AppElevatedButton(
                      text: 'Next',
                      onPressed: () {
                        Get.to(StaffDocumentation());
                      }),
                  SizedBox(height: SizeConfig.heightMultiplier * 5),
                ],
              )),
        ),
      ),
    );
  }
}
