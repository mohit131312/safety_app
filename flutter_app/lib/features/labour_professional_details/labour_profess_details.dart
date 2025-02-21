import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_search_dropdown.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/components/app_textformfeild.dart';
import 'package:flutter_app/features/induction_training/induction_training_controller.dart';
import 'package:flutter_app/features/labour_documentation/labour_documentation.dart';
import 'package:flutter_app/features/labour_professional_details/labour_profess_details_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LabourProfessDetails extends StatelessWidget {
  LabourProfessDetails({super.key});
  final InductionTrainingController inductionTrainingController =
      Get.put(InductionTrainingController());
  final LabourProfessDetailsController labourProfessDetailsController =
      Get.put(LabourProfessDetailsController());
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
                text: AppTexts.addlabour,
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
                    value: 0.4,
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
              text: AppTexts.labourprofessinaldetails,
              fontSize: AppTextSize.textSizeMediumm,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.3,
            ),
            AppTextWidget(
              text: AppTexts.enterlabourprofessionaldetails,
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
                    text: AppTexts.trade,
                    fontSize: AppTextSize.textSizeSmall,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText),
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
            AppSearchDropdown(
              items: inductionTrainingController.tradeList
                  .map(
                    (trade) => trade.inductionDetails,
                  )
                  .toList(),
              selectedItem:
                  labourProfessDetailsController.selectedtrade.value.isNotEmpty
                      ? labourProfessDetailsController.selectedtrade.value
                      : null,
              hintText: 'Select Trade',
              onChanged: (value) {
                labourProfessDetailsController.selectedtrade.value =
                    value ?? '';
              },
            ),

            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: AppTexts.yoexperience,
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
            AppTextFormfeild(
              controller: labourProfessDetailsController.yoexperienceController,
              hintText: 'Enter year count',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              enabled: true, // Set to false to disable the field
              readOnly: false, // Set to true if you don't want it editable
              validator: (value) {
                return null;
              },
            ),

            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: AppTexts.skill,
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
            Obx(() => Row(
                  children: [
                    Radio(
                      value: 'Skilled',
                      groupValue: labourProfessDetailsController
                          .selectedSkillLevel.value,
                      activeColor:
                          Colors.orange, // Matches the UI in your image
                      onChanged: (value) {
                        labourProfessDetailsController.updateSkillLevel(value!);
                      },
                    ),
                    AppTextWidget(
                      text: 'Skilled',
                      fontSize: AppTextSize.textSizeSmallm,
                      fontWeight: FontWeight.w500,
                      color: AppColors.searchfeild,
                    ),
                    SizedBox(width: 16), // Space between options
                    Radio(
                      value: 'Unskilled',
                      groupValue: labourProfessDetailsController
                          .selectedSkillLevel.value,
                      activeColor: Colors.orange,
                      onChanged: (value) {
                        labourProfessDetailsController.updateSkillLevel(value!);
                      },
                    ),
                    AppTextWidget(
                      text: 'Unskilled',
                      fontSize: AppTextSize.textSizeSmallm,
                      fontWeight: FontWeight.w500,
                      color: AppColors.searchfeild,
                    ),
                  ],
                )),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Row(
              children: [
                AppTextWidget(
                  text: AppTexts.firmname,
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

            //------------------------------
            AppSearchDropdown(
              items: inductionTrainingController.contractorLists
                  .map(
                    (contractor) => contractor.contractorCompanyName,
                  )
                  .toList(),
              selectedItem: labourProfessDetailsController
                      .contractorCompanyName.value.isNotEmpty
                  ? labourProfessDetailsController.contractorCompanyName.value
                  : null,
              hintText: 'Select Name',
              onChanged: (value) {
                labourProfessDetailsController.contractorCompanyName.value =
                    value ?? '';
              },
            ),

            SizedBox(
              height: SizeConfig.heightMultiplier * 12,
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
                      Get.to(LabourDocumentation());
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
              height: SizeConfig.heightMultiplier * 3,
            ),
          ]),
        ),
      ),
    );
  }
}
