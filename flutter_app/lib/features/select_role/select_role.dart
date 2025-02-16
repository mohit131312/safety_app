import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/login/login_screen.dart';
import 'package:flutter_app/features/select_project/select_project_controller.dart';
import 'package:flutter_app/features/select_project/select_project_screen.dart';
import 'package:flutter_app/features/select_role/select_role_controller.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/loader_screen.dart';
import 'package:flutter_app/utils/logout_user.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class SelectRole extends StatefulWidget {
  const SelectRole({super.key});
  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  final SelectRoleController selectRoleController =
      Get.put(SelectRoleController());
  final SelectProjectController selectProjectController =
      Get.put(SelectProjectController());

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
                text: AppTexts.selectrole,
                fontSize: AppTextSize.textSizeMediumm,
                fontWeight: FontWeight.w400,
                color: AppColors.primary,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
                child: IconButton(
                  onPressed: () {
                    logout();
                    Get.offAll(() => LoginScreen());
                  },
                  icon: Icon(
                    Icons.logout,
                    size: SizeConfig.heightMultiplier * 2.5,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 4,
            vertical: SizeConfig.heightMultiplier * 1.3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: selectRoleController.roleArray.length,
                  itemBuilder: (context, index) {
                    log('-------------${selectRoleController.roleArray.length}');
                    return GestureDetector(
                      onTap: () async {
                        selectRoleController.selectItem(index);
                        // Get.to(HomeScreen(
                        //   userId: selectRoleController.selectRoleMap['user_id'],
                        //   roleId: selectRoleController.roleArray[index].id,
                        //   selectedproject: 'dummyname',
                        // ));
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomLoadingPopup());

                        await selectProjectController.getProjectDetails(
                          await selectRoleController.selectRoleMap['user_id'],
                          selectRoleController.roleArray[index].id,
                        );
                        Navigator.pop(context);

                        log('----------------${selectRoleController.selectRoleMap['user_id']}');
                        log('----------------${selectRoleController.roleArray[index].id}');
                        //  Navigator.pop(context);

                        if (logStatus == true) {
                          Get.to(
                            SelectProjectScreen(
                              userId:
                                  selectRoleController.selectRoleMap['user_id'],
                              roleId: selectRoleController.roleArray[index].id,
                            ),
                          );
                        } else {
                          logout();
                        }
                      },
                      child: Obx(
                        () {
                          bool isSelected =
                              selectRoleController.selectedIndex.value == index;
                          return Container(
                            decoration: BoxDecoration(
                                color: AppColors.textfeildcolor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: isSelected
                                        ? AppColors.buttoncolor
                                        : AppColors.searchfeildcolor,
                                    width: 1)),
                            padding: EdgeInsets.only(
                                left: SizeConfig.widthMultiplier * 8,
                                right: SizeConfig.widthMultiplier * 8),
                            height: SizeConfig.heightMultiplier * 9,
                            width: SizeConfig.widthMultiplier * 90,
                            child: Row(
                              children: [
                                AppTextWidget(
                                    text: selectRoleController
                                        .roleArray[index].roleName,
                                    fontSize: AppTextSize.textSizeSmall,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? AppColors.buttoncolor
                                        : AppColors.primaryText),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: SizeConfig.heightMultiplier * 2.5,
                                  color: AppColors.primaryText,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
