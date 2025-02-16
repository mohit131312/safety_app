import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_medium_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/contractor/service_details/service_details_controller.dart';
import 'package:flutter_app/features/contractor/service_undertaking/service_undertaking.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ServiceDetailsScreen extends StatelessWidget {
  ServiceDetailsScreen({super.key});

  final ServiceDetailsController serviceDetailsController =
      Get.put(ServiceDetailsController());
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
                    value: 0.75,
                    backgroundColor: AppColors.searchfeildcolor,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.defaultPrimary),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '03/05',
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
              text: 'Services Details',
              fontSize: AppTextSize.textSizeMediumm,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.3,
            ),
            AppTextWidget(
              text: 'Enter contractor services details',
              fontSize: AppTextSize.textSizeSmalle,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryText,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            //primaryContactPerson

            Row(
              children: [
                AppTextWidget(
                  text: 'Select Activity',
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
                      serviceDetailsController.selectedactivity.value.isNotEmpty
                          ? serviceDetailsController.selectedactivity.value
                          : null,
                  items: serviceDetailsController.activity
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
                    serviceDetailsController.selectedactivity.value =
                        value ?? "";
                  },
                  hint: AppTextWidget(
                    text: 'Select Activity',
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
                  text: 'Select SubActivity',
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Obx(
                () => DropdownButtonFormField<String>(
                  // isDense: false,

                  value:
                      serviceDetailsController.selectedactivity.value.isNotEmpty
                          ? serviceDetailsController.selectedactivity.value
                          : null,
                  items: serviceDetailsController.activity
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
                    serviceDetailsController.selectedactivity.value =
                        value ?? "";
                  },
                  hint: AppTextWidget(
                    text: 'Select SubActivity',
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.thirdText,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: AppColors.thirdText,
                    width: 0.8,
                  ),
                ),
                minimumSize: Size(double.infinity, 42),
              ),
              onPressed: () {
                // Get.toNamed("/selectreviewer");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextWidget(
                    text: "Add Service",
                    fontSize: AppTextSize.textSizeSmallm,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.5,
            ),

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primary,
                  border:
                      Border.all(width: 0.7, color: AppColors.backbuttoncolor)),
              width: SizeConfig.widthMultiplier * 92,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            topRight: Radius.circular(8),
                          ),
                          color: Colors.red,
                        ),
                        height: SizeConfig.imageSizeMultiplier * 10,
                        width: SizeConfig.widthMultiplier * 10,
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            serviceDetailsController.selectedactivity.value =
                                "";
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                  text: AppTexts.activity,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.searchfeild),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 1,
                              ),
                              Obx(
                                () => AppTextWidget(
                                  text: serviceDetailsController
                                      .selectedactivity.value,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.searchfeild,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 1.5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 40,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                  text: 'Sub-Activity',
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.searchfeild),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 1,
                              ),
                              Obx(
                                () => AppTextWidget(
                                  text: serviceDetailsController
                                      .selectedactivity.value,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.searchfeild,
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.heightMultiplier * 1.5,
                              ),
                            ],
                          ),
                        ),

                        //--------------------------------------

                        //---------------------------------------------

                        SizedBox(
                          height: SizeConfig.heightMultiplier * 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 5,
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
                      Get.to(ServiceUndertaking());
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
