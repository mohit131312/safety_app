import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/contractor/contractor_details/contractor_details_controller.dart';
import 'package:flutter_app/features/contractor/service_details/service_details_screen.dart';
import 'package:flutter_app/features/labour_documentation/labour_documentation_controller.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_t_details/toolbox_t_details_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ContractorDetailsScreen extends StatelessWidget {
  ContractorDetailsScreen({super.key});
  final ContractorDetailsController contractorDetailsController =
      Get.put(ContractorDetailsController());
  final ToolboxTDetailsController controller =
      Get.put(ToolboxTDetailsController());
  final LabourDocumentationController labourDocumentationController =
      Get.put(LabourDocumentationController());
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
                text: AppTexts.addContractor,
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
                  '02/05',
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
              text: AppTexts.contdetails,
              fontSize: AppTextSize.textSizeMediumm,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.3,
            ),
            AppTextWidget(
              text: AppTexts.entercontractorcontactdetails,
              fontSize: AppTextSize.textSizeSmalle,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.5,
            ),
            //primaryContactPerson
            AppTextWidget(
              text: AppTexts.primaryContactPerson,
              fontSize: AppTextSize.textSizeMedium,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryText,
            ),

            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: AppTexts.name,
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
                controller: contractorDetailsController.nameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Name',
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
                    borderSide:
                        BorderSide(color: AppColors.searchfeildcolor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.searchfeildcolor, width: 1),
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
                controller: contractorDetailsController.contactnoController,
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
                    borderSide:
                        BorderSide(color: AppColors.searchfeildcolor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.searchfeildcolor, width: 1),
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
                  text: AppTexts.emailid,
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
                controller: contractorDetailsController.emailidController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Email',
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
                    borderSide:
                        BorderSide(color: AppColors.searchfeildcolor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.searchfeildcolor, width: 1),
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
                  text: AppTexts.idprooftype,
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

                  value: contractorDetailsController
                          .selectedidProoftype.value.isNotEmpty
                      ? contractorDetailsController.selectedidProoftype.value
                      : null,
                  items: contractorDetailsController.idprooftype
                      .map((idprooftype) => DropdownMenuItem(
                            value: idprooftype,
                            child: AppTextWidget(
                                text: idprooftype,
                                fontSize: AppTextSize.textSizeMedium,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryText),
                          ))
                      .toList(),
                  onChanged: (value) {
                    contractorDetailsController.selectedidProoftype.value =
                        value!;
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
                  text: AppTexts.idproofno,
                  fontSize: AppTextSize.textSizeSmall,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1,
            ),
            Container(
              decoration: BoxDecoration(),
              child: TextFormField(
                controller: contractorDetailsController.idproofController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'ID Proof Number',
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
                    borderSide:
                        BorderSide(color: AppColors.searchfeildcolor, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.searchfeildcolor, width: 1),
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
            ////---------------
            Column(
              children: [
                Row(
                  children: [
                    AppTextWidget(
                      text: AppTexts.docphoto,
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
                  () => contractorDetailsController.adharImageCount < 1
                      ? GestureDetector(
                          onTap: () {
                            contractorDetailsController.pickadharImages();
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
                                    text: AppTexts.uploadphoto,
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
                                    height: SizeConfig.imageSizeMultiplier *
                                        20, // Adjust based on UI needs

                                    child: GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: contractorDetailsController
                                            .labourAdharcard.length,
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
                                                        contractorDetailsController
                                                            .labourAdharcard[
                                                                index]
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
                                                    labourDocumentationController
                                                        .removeAdharImage(
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
                                    contractorDetailsController
                                        .pickadharImages();
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 3,
                    ),
                    //primaryContactPerson
                    AppTextWidget(
                      text: AppTexts.secContactPerson,
                      fontSize: AppTextSize.textSizeMedium,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),

                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Row(
                      children: [
                        AppTextWidget(
                          text: AppTexts.name,
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
                            contractorDetailsController.secondarynameController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            fontSize: AppTextSize.textSizeSmall,
                            fontWeight: FontWeight.w400,
                            color: AppColors.searchfeild,
                          ),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          } else if (!RegExp(r'^[a-zA-Z\s]+$')
                              .hasMatch(value)) {
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
                        controller: contractorDetailsController
                            .secondarycontactController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Contact Number',
                          hintStyle: TextStyle(
                            fontSize: AppTextSize.textSizeSmall,
                            fontWeight: FontWeight.w400,
                            color: AppColors.searchfeild,
                          ),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          } else if (!RegExp(r'^[a-zA-Z\s]+$')
                              .hasMatch(value)) {
                            return 'Only letters are allowed';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 2,
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppMediumButton(
                      label: "Previous",
                      borderColor: AppColors.buttoncolor,
                      iconColor: AppColors.buttoncolor,
                      backgroundColor: Colors.white,
                      textColor: AppColors.buttoncolor,
                      imagePath: 'assets/icons/arrow-narrow-left.png',
                    ),
                  ),
                  SizedBox(width: SizeConfig.widthMultiplier * 5),
                  GestureDetector(
                    onTap: () {
                      Get.to(ServiceDetailsScreen());
                    },
                    child: AppMediumButton(
                      label: "Next",
                      borderColor: AppColors.backbuttoncolor,
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      backgroundColor: AppColors.buttoncolor,
                      imagePath2: 'assets/icons/arrow-narrow-right.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 6,
            ),
          ]),
        ),
      ),
    );
  }
}
