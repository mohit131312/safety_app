import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_elevated_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/contractor/add_contractor/add_contractor_controller.dart';
import 'package:flutter_app/features/contractor/contractor_details/contractor_details_screen.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddContractor extends StatelessWidget {
  AddContractor({super.key});

  final AddContractorController addContractorController =
      Get.put(AddContractorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: SizedBox(
              height: SizeConfig.heightMultiplier * 85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.25,
                          backgroundColor: AppColors.searchfeildcolor,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.defaultPrimary),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '01/04',
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
                    text: AppTexts.contractordetails,
                    fontSize: AppTextSize.textSizeMediumm,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText,
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 0.3,
                  ),
                  AppTextWidget(
                    text: AppTexts.entercontractordetails,
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
                        text: AppTexts.contractorfirm,
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
                          addContractorController.contractorfirmnameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Contractor Firm Name',
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
                  AppTextWidget(
                    text: AppTexts.contractorgrp,
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

                        value: addContractorController
                                .selectedContractorgrp.value.isNotEmpty
                            ? addContractorController
                                .selectedContractorgrp.value
                            : null,
                        items: addContractorController.contractorgrp
                            .map((contractorgrp) => DropdownMenuItem(
                                  value: contractorgrp,
                                  child: AppTextWidget(
                                      text: contractorgrp,
                                      fontSize: AppTextSize.textSizeMedium,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryText),
                                ))
                            .toList(),
                        onChanged: (value) {
                          addContractorController.selectedContractorgrp.value =
                              value ?? '';
                        },
                        hint: AppTextWidget(
                          text: 'Select Contractor Group',
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
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 1.5,
                  ),
                  Row(
                    children: [
                      AppTextWidget(
                        text: AppTexts.gstn,
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
                      controller: addContractorController.gstnController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Contractor GSTN Number',
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
                  AppTextWidget(
                    text: AppTexts.servicearea,
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

                        value: addContractorController
                                .selectedServiceArea.value.isNotEmpty
                            ? addContractorController.selectedServiceArea.value
                            : null,
                        items: addContractorController.serviceArea
                            .map((serviceArea) => DropdownMenuItem(
                                  value: serviceArea,
                                  child: AppTextWidget(
                                      text: serviceArea,
                                      fontSize: AppTextSize.textSizeMedium,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryText),
                                ))
                            .toList(),
                        onChanged: (value) {
                          addContractorController.selectedServiceArea.value =
                              value ?? '';
                        },
                        hint: AppTextWidget(
                          text: 'Select Service Area',
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
                  Spacer(),
                  AppElevatedButton(
                      text: 'Next',
                      onPressed: () {
                        Get.to(ContractorDetailsScreen());
                      }),
                  SizedBox(height: SizeConfig.heightMultiplier * 5),
                ],
              ),
            )),
      ),
    );
  }
}
