import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_elevated_button.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/toolbox_training_all/select_reviewer/select_reviewer_controller.dart';
import 'package:flutter_app/features/toolbox_training_all/toolbox_t_details/toolbox_t_details_screen.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SelectReviewer extends StatelessWidget {
  SelectReviewer({super.key});

  final SelectReviewerController selectReviewerController =
      Get.put(SelectReviewerController());

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
                text: 'Select Reviewer',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 2,
              ),
              child: SizedBox(
                height: SizeConfig.heightMultiplier * 6,
                child: TextField(
                  controller: selectReviewerController.searchReviwerController,
                  decoration: InputDecoration(
                    hintText: 'Search here...',
                    hintStyle: TextStyle(
                      fontSize: AppTextSize.textSizeSmallm,
                      fontWeight: FontWeight.w400,
                      color: AppColors.searchfeild,
                    ),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: AppColors.searchfeild,
                      size: 24,
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
                    selectReviewerController.searchReviewerQuery.value = value;
                  },
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 0.2,
            ),

            /// **Contact List (Grouped by Alphabet)**
            Obx(
              () {
                final groupedContacts =
                    selectReviewerController.getGroupedReviewer();

                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: groupedContacts.keys.length,
                  itemBuilder: (context, index) {
                    String letter = groupedContacts.keys.elementAt(index);
                    // ignore: unused_local_variable
                    List<Map<String, String>> contacts =
                        groupedContacts[letter] ?? [];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// **Section Header**
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 4,
                              vertical: 8),
                          child: AppTextWidget(
                            text: letter,
                            fontSize: AppTextSize.textSizeMedium,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),

                        Obx(() {
                          List<Map<String, String>> filteredContacts =
                              selectReviewerController.getFilteredReviewer();
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: filteredContacts.length,
                            itemBuilder: (context, index) {
                              var contact = filteredContacts[index];
                              return ListTile(
                                contentPadding:
                                    EdgeInsets.only(left: 0, right: 20),
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Obx(
                                      () => IconButton(
                                        onPressed: () {
                                          selectReviewerController
                                              .toggleReviewerSelection(
                                                  contact['name']!);
                                        },
                                        icon: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2,
                                                  color: AppColors.thirdText)),
                                          child: Container(
                                            margin: const EdgeInsets.all(3.0),
                                            child: CircleAvatar(
                                              radius: 7,
                                              backgroundColor: selectReviewerController
                                                              .selectedContacts[
                                                          contact['name']!] ??
                                                      false
                                                  ? AppColors
                                                      .thirdText // Selected state color
                                                  : Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundImage: AssetImage(
                                          'assets/images/profile_big.png'),
                                    ),
                                  ],
                                ),
                                title: AppTextWidget(
                                  text: contact['name'].toString(),
                                  fontSize: AppTextSize.textSizeSmall,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryText,
                                ),
                                subtitle: AppTextWidget(
                                  text: contact['designation'].toString(),
                                  fontSize: AppTextSize.textSizeSmalle,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondaryText,
                                ),
                                trailing: SizedBox(
                                  width: SizeConfig.imageSizeMultiplier * 10,
                                  height: SizeConfig.imageSizeMultiplier * 10,
                                  child: Image.asset(
                                    contact['img'].toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    );
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 2,
              ),
              child: AppElevatedButton(
                text: "Add",
                onPressed: () {
                  selectReviewerController.confirmReviewerSelection();
                  Get.off(ToolboxTDetailsScreen());
                },
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 4),
          ],
        ),
      ),
    );
  }
}
