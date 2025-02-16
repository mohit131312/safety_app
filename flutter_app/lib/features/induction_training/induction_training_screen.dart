import 'package:flutter/material.dart';
import 'package:flutter_app/components/app_text_widget.dart';
import 'package:flutter_app/features/Labour_add/add_labour_screen.dart';
import 'package:flutter_app/features/contractor/add_contractor/add_contractor.dart';
import 'package:flutter_app/features/induction_training/induction_training_controller.dart';
import 'package:flutter_app/features/staff/staff_add/add_staff_screen.dart';
import 'package:flutter_app/utils/app_color.dart';
import 'package:flutter_app/utils/app_texts.dart';
import 'package:flutter_app/utils/app_textsize.dart';
import 'package:flutter_app/utils/size_config.dart';
import 'package:get/get.dart';

class InductionTrainingScreen extends StatelessWidget {
  InductionTrainingScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  final InductionTrainingController inductionTrainingController =
      Get.put(InductionTrainingController());

  final List<Map<String, String>> gridItems = [
    {'img': 'assets/icons/building-bank.png', 'text': 'Gov. Offical'},
    {'img': 'assets/icons/User.png', 'text': 'Client'},
    {'img': 'assets/icons/messages.png', 'text': 'Consultant'},
    {'img': 'assets/icons/Labours.png', 'text': 'Labour'},
    {'img': 'assets/icons/users.png', 'text': 'Staff'},
    {'img': 'assets/icons/Contractor.png', 'text': 'Contractor'},
  ];
  final RxBool isFabExpanded = true.obs;

  void _showFabMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                isFabExpanded.value = !isFabExpanded.value;
              },
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              left: 20,
              bottom: 100,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: SizeConfig.widthMultiplier * 90,
                  padding: const EdgeInsets.only(top: 15, left: 6, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 4,
                          childAspectRatio: 1,
                        ),
                        itemCount: gridItems.length,
                        itemBuilder: (context, index) {
                          final item = gridItems[index];
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                print("Tapped on item 0");
                              } else if (index == 1) {
                                print("Tapped on item 1");
                              } else if (index == 2) {
                                print("Tapped on item 2");
                              } else if (index == 3) {
                                Get.to(AddLabourScreen());
                              } else if (index == 4) {
                                Get.to(AddStaffScreen());

                                print("Tapped on item 2");
                              } else {
                                Get.to(AddContractor());

                                print("Tapped on item $index");
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(item['img']!,
                                    height: 30, width: 30),
                                const SizedBox(height: 6),
                                Flexible(
                                  child: Text(
                                    item['text']!,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: AppTextSize.textSizeSmalle,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
                  text: AppTexts.inductiontraining,
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
                    hintText: 'Search here..',
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
                    inductionTrainingController.searchLabor(value);
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
                      text: AppTexts.inductees,
                    ),
                  ),
                  SizedBox(
                    child: const Tab(
                      text: AppTexts.bulkInduction,
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
                      itemCount:
                          inductionTrainingController.filteredDetails.length,
                      itemBuilder: (context, index) {
                        var item =
                            inductionTrainingController.filteredDetails[index];
                        return Column(
                          children: [
                            ListTile(
                              leading: Container(
                                width: SizeConfig.imageSizeMultiplier * 11.11,
                                height: SizeConfig.imageSizeMultiplier * 11.11,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(item['img']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: AppTextWidget(
                                text: item['title']!,
                                fontSize: AppTextSize.textSizeSmall,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryText,
                              ),
                              subtitle: AppTextWidget(
                                text: item['subtitle']!,
                                fontSize: AppTextSize.textSizeExtraSmall,
                                fontWeight: FontWeight.w500,
                                color: AppColors.secondaryText,
                              ),
                              trailing: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(237, 245, 225, 203),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, right: 12, top: 8, bottom: 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        item['icon']!,
                                        height:
                                            SizeConfig.imageSizeMultiplier * 4,
                                        width:
                                            SizeConfig.imageSizeMultiplier * 4,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.widthMultiplier * 1,
                                      ),
                                      AppTextWidget(
                                        text: item['text']!,
                                        fontSize:
                                            AppTextSize.textSizeExtraSmall,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.buttoncolor,
                                      ),
                                    ],
                                  ),
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
                    Center(child: Text('Second Tab Content')),
                    Center(child: Text('Third Tab Content')),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(
          () => SizedBox(
            width: isFabExpanded.value
                ? SizeConfig.widthMultiplier * 36
                : SizeConfig.widthMultiplier * 14,
            height: isFabExpanded.value
                ? SizeConfig.heightMultiplier * 6
                : SizeConfig.heightMultiplier * 6,
            child: FloatingActionButton(
              onPressed: () {
                isFabExpanded.value = !isFabExpanded.value;

                _showFabMenu(context);
              },
              backgroundColor: AppColors.buttoncolor,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isFabExpanded.value
                      ? Icon(
                          Icons.add,
                          size: 26,
                          color: AppColors.primary,
                        )
                      : Icon(
                          Icons.close,
                          size: 26,
                          color: AppColors.primary,
                        ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 1,
                  ),
                  isFabExpanded.value
                      ? AppTextWidget(
                          text: "Add",
                          fontSize: AppTextSize.textSizeMedium,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        )
                      : AppTextWidget(
                          text: "",
                          fontSize: AppTextSize.textSizeMedium,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
