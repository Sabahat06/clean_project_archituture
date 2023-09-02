import 'package:flutter/material.dart';
import 'package:pak_mcqs/view/widgets/extention/int_extension.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';


class BottomNavigateBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, controller, child) {
      return ClipRRect(
        child: Container(
          height: 57.h,
          child: BottomNavigationBar(
            backgroundColor: textFieldColor,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(color: yellowPrimary, fontSize: 11),
            unselectedLabelStyle: const TextStyle(color: backgroundColor, fontSize: 8),
            currentIndex: controller.currentBNBIndex,
            onTap: controller.indexChanged,
            selectedItemColor: yellowPrimary,
            unselectedItemColor: iconColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(Images.history),),
                label: controller.currentBNBIndex == 0 ? 'History' : '',
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(Images.live),),
                label: controller.currentBNBIndex == 1 ? 'Live' : '',
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(Images.buyPack),),
                label: controller.currentBNBIndex == 2 ? 'Buy Pack' : '',
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(Images.upcoming),),
                label: controller.currentBNBIndex == 3 ? 'Upcoming' : '',
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(Images.profile,),),
                label: controller.currentBNBIndex == 4 ? 'Account' : '',
              ),
            ],
          ),
        ),
      );
    });
  }
}