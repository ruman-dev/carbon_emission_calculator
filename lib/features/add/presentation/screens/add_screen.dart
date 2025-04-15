import 'package:carbon_emission_calculator/core/global_widget/custom_button.dart';
import 'package:carbon_emission_calculator/core/global_widget/custom_text_poppins.dart';
import 'package:carbon_emission_calculator/core/resources/assets/asset_path.dart';
import 'package:carbon_emission_calculator/features/add/controller/add_controller.dart';
import 'package:carbon_emission_calculator/features/add/presentation/widgets/custom_input.dart';
import 'package:carbon_emission_calculator/features/result/presentation/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final AddController _controller = Get.find<AddController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.025,
            vertical: screenWidth * 0.02,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetPath.officeIcon, width: 25.w),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      CustomTextPoppins(
                        text: 'Office',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      SizedBox(
                        width: screenWidth * 0.2,
                        child: Divider(color: Color(0xFFADADAD), height: 5),
                      ),
                    ],
                  ),
                ],
              ),

              /// Calculations
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.025,
                  vertical: screenWidth * 0.05,
                ),
                child: Column(
                  children: [
                    Obx(
                      () => CustomInput(
                        inputTitle: 'Total Number of people',
                        onValue: _controller.numOfPeople.value.toString().obs,
                        onIncrementTap: _controller.incrementPeople,
                        onDecrementTap: _controller.decrementPeople,
                      ),
                    ),
                    Obx(
                      () => CustomInput(
                        inputTitle: 'Total number of rooms',
                        onValue: _controller.numOfRooms.value.toString().obs,
                        onIncrementTap: _controller.incrementRooms,
                        onDecrementTap: _controller.decrementRooms,
                      ),
                    ),
                    Obx(
                      () => CustomInput(
                        inputTitle: 'Total area (sqft.)',
                        onValue: _controller.totalArea.value.toString().obs,
                        onIncrementTap: _controller.incrementArea,
                        onDecrementTap: _controller.decrementArea,
                      ),
                    ),
                    Obx(
                      () => CustomInput(
                        inputTitle: 'Total AC',
                        onValue: _controller.totalAC.value.toString().obs,
                        onIncrementTap: _controller.incrementAC,
                        onDecrementTap: _controller.decrementAC,
                      ),
                    ),
                    Obx(
                      () => CustomInput(
                        inputTitle: 'Total Refrigerator',
                        onValue: _controller.totalRef.value.toString().obs,
                        onIncrementTap: _controller.incrementRef,
                        onDecrementTap: _controller.decrementRef,
                      ),
                    ),
                    Obx(
                      () => CustomInput(
                        inputTitle: 'Total Computers',
                        onValue:
                            _controller.totalComputers.value.toString().obs,
                        onIncrementTap: _controller.incrementComputers,
                        onDecrementTap: _controller.decrementComputers,
                      ),
                    ),
                    Obx(
                      () => CustomInput(
                        inputTitle: 'Total Indoor Plants',
                        onValue: _controller.totalInPlants.value.toString().obs,
                        onIncrementTap: _controller.incrementPlants,
                        onDecrementTap: _controller.decrementPlants,
                      ),
                    ),
                    Obx(
                      () => CustomInput(
                        inputTitle: 'Total Kitchen Burner',
                        onValue:
                            _controller.totalKitBurners.value.toString().obs,
                        onIncrementTap: _controller.incrementKitBurners,
                        onDecrementTap: _controller.decrementKitBurners,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.025,
                  vertical: screenWidth * 0.05,
                ),
                child: CustomButton(
                  text: 'Calculate Carbon Emission',
                  onPressed: () {
                    Get.to(() => ResultScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
