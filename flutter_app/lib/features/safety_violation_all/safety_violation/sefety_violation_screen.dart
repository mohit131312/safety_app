import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/safety_violation_all/safety_violation/sefety_violation_controller.dart';
import 'package:flutter_app/features/safety_violation_all/safety_violation_assignee/safety_preview_assignee/safety_preview_assignee_screen.dart';
import 'package:flutter_app/features/safety_violation_all/safety_violation_details/safety_violation_details.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class SefetyViolationScreen extends StatelessWidget {
  SefetyViolationScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final SefetyViolationController sefetyViolationController =
      Get.put(SefetyViolationController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.heightMultiplier * 2,
                    right: SizeConfig.widthMultiplier * 5,
                  ),
                  child: Image.asset(
                    "assets/icons/frame_icon.png",
                    height: SizeConfig.imageSizeMultiplier * 6,
                    width: SizeConfig.imageSizeMultiplier * 6,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 2,
              ),
              child: SizedBox(
                height: SizeConfig.heightMultiplier * 6.5,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search labour here..',
                    hintStyle: TextStyle(
                      fontSize: AppTextSize.textSizeSmall,
                      fontWeight: FontWeight.w400,
                      color: AppColors.searchfeildcolor,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.searchfeildcolor,
                      size: 30,
                    ),
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
                  ),
                  onChanged: (value) {
                    sefetyViolationController.searchLabor(value);
                  },
                ),
              ),
            ),
            Container(
              height: SizeConfig.heightMultiplier * 6,
              width: SizeConfig.widthMultiplier * 92,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.heightMultiplier * 0.8,
                horizontal: SizeConfig.widthMultiplier * 1.5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.textfeildcolor,
              ),
              child: TabBar(
                isScrollable: true,
                indicatorColor: AppColors.textfeildcolor,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.searchfeild,
                indicator: BoxDecoration(
                  color: AppColors.thirdText,
                  borderRadius: BorderRadius.circular(20),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                tabAlignment: TabAlignment.start,
                tabs: [
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 20,
                    child: const Tab(
                      text: AppTexts.all,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 20,
                    child: const Tab(
                      text: 'Assignor',
                    ),
                  ),
                  SizedBox(
                    child: const Tab(
                      text: 'Assignee',
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      //    shrinkWrap: true,
                      //   physics: NeverScrollableScrollPhysics(),
                      itemCount: sefetyViolationController
                          .incidentfilteredDetails.length,
                      itemBuilder: (context, index) {
                        var item = sefetyViolationController
                            .incidentfilteredDetails[index];
                        return Column(
                          children: [
                            ListTile(
                              title: AppTextWidget(
                                text: item['title']!,
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryText,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextWidget(
                                    text: item['subtitle']!,
                                    fontSize: AppTextSize.textSizeExtraSmall,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.secondaryText,
                                  ),
                                  AppTextWidget(
                                    text: item['date']!,
                                    fontSize: AppTextSize.textSizeExtraSmall,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.secondaryText,
                                  ),
                                ],
                              ),
                              trailing: Padding(
                                padding: EdgeInsets.only(
                                    left: 12, right: 12, top: 8, bottom: 3),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppTextWidget(
                                      text: item['text']!,
                                      fontSize: AppTextSize.textSizeExtraSmall,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.buttoncolor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              color: AppColors.textfeildcolor,
                              thickness: 1.5,
                              height: 2,
                            ),
                          ],
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        log('----------------------------${sefetyViolationController.selectedOption.value}');

                        if (sefetyViolationController.selectedOption.value ==
                            1) {
                          Get.to(SafetyViolationDetails());
                        }
                      },
                      child: ListView.builder(
                        //    shrinkWrap: true,
                        //   physics: NeverScrollableScrollPhysics(),
                        itemCount: sefetyViolationController
                            .incidentfilteredDetails.length,
                        itemBuilder: (context, index) {
                          var item = sefetyViolationController
                              .incidentfilteredDetails[index];
                          return Column(
                            children: [
                              ListTile(
                                title: AppTextWidget(
                                  text: item['title']!,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryText,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextWidget(
                                      text: item['subtitle']!,
                                      fontSize: AppTextSize.textSizeExtraSmall,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.secondaryText,
                                    ),
                                    AppTextWidget(
                                      text: item['date']!,
                                      fontSize: AppTextSize.textSizeExtraSmall,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.secondaryText,
                                    ),
                                  ],
                                ),
                                trailing: Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, right: 12, top: 8, bottom: 3),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        children: [
                                          AppTextWidget(
                                            text: item['text']!,
                                            fontSize:
                                                AppTextSize.textSizeExtraSmall,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.buttoncolor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: AppColors.textfeildcolor,
                                thickness: 1.5,
                                height: 2,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        log('----------------------------${sefetyViolationController.selectedOption.value}');
                        if (sefetyViolationController.selectedOption.value ==
                            1) {
                          Get.to(SafetyPreviewAssigneeScreen());
                        }
                      },
                      child: ListView.builder(
                        //    shrinkWrap: true,
                        //   physics: NeverScrollableScrollPhysics(),
                        itemCount: sefetyViolationController
                            .incidentfilteredDetails.length,
                        itemBuilder: (context, index) {
                          var item = sefetyViolationController
                              .incidentfilteredDetails[index];
                          return Column(
                            children: [
                              ListTile(
                                title: AppTextWidget(
                                  text: item['title']!,
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryText,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextWidget(
                                      text: item['subtitle']!,
                                      fontSize: AppTextSize.textSizeExtraSmall,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.secondaryText,
                                    ),
                                    AppTextWidget(
                                      text: item['date']!,
                                      fontSize: AppTextSize.textSizeExtraSmall,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.secondaryText,
                                    ),
                                  ],
                                ),
                                trailing: Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, right: 12, top: 8, bottom: 3),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        children: [
                                          AppTextWidget(
                                            text: item['text']!,
                                            fontSize:
                                                AppTextSize.textSizeExtraSmall,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.buttoncolor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                color: AppColors.textfeildcolor,
                                thickness: 1.5,
                                height: 2,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: SizeConfig.widthMultiplier * 36,
          height: SizeConfig.heightMultiplier * 6.5,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.buttoncolor,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 26,
                  color: AppColors.primary,
                ),
                SizedBox(
                  width: SizeConfig.widthMultiplier * 1,
                ),
                AppTextWidget(
                  text: "Add",
                  fontSize: AppTextSize.textSizeMedium,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
