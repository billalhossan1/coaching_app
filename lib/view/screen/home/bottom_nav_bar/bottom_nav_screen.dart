import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_coaching_coach_app/view/screen/home/bottom_nav_bar/controller/controller.dart';
import 'package:get/get.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../widget/responsive_design.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BottomNavController(),
      builder: (navigationController) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(index: navigationController.selectedIndex.value, children: navigationController.getPages()),
          ),

          bottomNavigationBar: SizedBox(
            height: Responsive.height(context, 70),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                boxShadow: [BoxShadow(color: Colors.black.withAlpha(20), spreadRadius: 1, blurRadius: 15, offset: const Offset(0, -0.5))],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: BottomAppBar(
                  color: AppColors.bottomNavBar,
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: navigationController.getNavItems().asMap().entries.map((entry) {
                        int index = entry.key;
                        var item = entry.value;
                        return _navIcon(
                          onTap: () {
                            navigationController.changePage(index);
                          },
                          selected: navigationController.selectedIndex.value == index,
                          nonSelectedImg: item['nonSelected']!,
                          selectedImg: item['selected']!,
                          index: index,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _navIcon({
    required String nonSelectedImg,
    required String selectedImg,
    required int index,
    required void Function()? onTap,
    required bool selected,
  }) {
    return GestureDetector(onTap: onTap, child: SvgPicture.asset(selected ? selectedImg : nonSelectedImg));
  }
}
