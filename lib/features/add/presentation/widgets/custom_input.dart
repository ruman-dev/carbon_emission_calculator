import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/global_widget/custom_text_poppins.dart';
import '../../../../core/resources/app_colors/app_colors.dart';

// class CustomInput extends StatelessWidget {
//   const CustomInput({super.key, required this.inputTitle, this.onValue, this.onIncrementTap, this.onDecrementTap});
//
//   final String inputTitle;
//   final RxString? onValue;
//   final void Function()? onIncrementTap;
//   final void Function()? onDecrementTap;
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.sizeOf(context).width;
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             width: screenWidth * 0.45,
//             child: Row(
//               children: [
//                 CircleAvatar(backgroundColor: AppColors.primaryColor, radius: 10),
//                 SizedBox(width: 10),
//                 Expanded(
//                   child: CustomTextPoppins(
//                     text: inputTitle,
//                     fontWeight: FontWeight.w300,
//                     fontSize: 14.sp,
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 1,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             // width: screenWidth * 0.55,
//             child: Row(
//               children: [
//                 InkWell(
//                   onTap: onDecrementTap,
//                   child: Container(
//                     width: screenWidth * 0.15,
//                     padding: EdgeInsets.all(screenWidth * 0.01),
//                     decoration: BoxDecoration(color: Color(0xFFF7F7F7), borderRadius: BorderRadius.circular(8.r)),
//                     child: Icon(Icons.remove, color: Color(0xFF797979)),
//                   ),
//                 ),
//                 SizedBox(width: screenWidth * 0.05),
//                 Obx(
//                   () => SizedBox(
//                     width: screenWidth * 0.2,
//                     child: CustomTextPoppins(
//                       text: onValue?.value ?? '',
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w300,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: screenWidth * 0.05),
//                 InkWell(
//                   onTap: onIncrementTap,
//                   child: Container(
//                     width: screenWidth * 0.1,
//                     padding: EdgeInsets.all(screenWidth * 0.01),
//                     decoration: BoxDecoration(color: Color(0xFFF7F7F7), borderRadius: BorderRadius.circular(8.r)),
//                     child: Icon(Icons.add, color: Color(0xFF797979)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.inputTitle,
    this.onValue,
    this.onIncrementTap,
    this.onDecrementTap,
  });

  final String inputTitle;
  final RxString? onValue;
  final void Function()? onIncrementTap;
  final void Function()? onDecrementTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        children: [
          // Left Title
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 10,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomTextPoppins(
                    text: inputTitle,
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenWidth * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: screenWidth * 0.08,
                  child: InkWell(
                    onTap: onDecrementTap,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Color(0xFF797979),
                        size: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Obx(
                  () => SizedBox(
                    width: screenWidth * 0.12,
                    child: CustomTextPoppins(
                      text: onValue?.value ?? '',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                SizedBox(
                  width: screenWidth * 0.08,
                  child: InkWell(
                    onTap: onIncrementTap,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFF797979),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
