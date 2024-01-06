import 'package:coinite/controllers/main_wrapper_controller.dart';
import 'package:coinite/data/models/crypto_model.dart';
import 'package:coinite/data/models/crypto_model_impl.dart';
import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:coinite/data/vo/fear_vo.dart';
import 'package:coinite/network/data_agents/crypto_data_agent.dart';
import 'package:coinite/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:coinite/networks.dart';
import 'package:coinite/resources/dimens.dart';
import 'package:coinite/views/favorite_page.dart';
import 'package:coinite/views/fear_index_page.dart';
import 'package:coinite/views/home_page.dart';
import 'package:coinite/views/porfolio_page.dart';
import 'package:coinite/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainWrapper extends StatelessWidget {
  final MainWrapperController controller = Get.put(MainWrapperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.animatedToTab,
        physics: BouncingScrollPhysics(),
        children: [
          HomePage(),
          FavoritePage(),
          FearIndexPage(),
          PortfolioPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        notchMargin: 10,
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomAppBarItem(
                  context,
                  icons: FontAwesomeIcons.house,
                  page: 0,
                  label: "Home",
                ),
                _bottomAppBarItem(
                  context,
                  icons: FontAwesomeIcons.star,
                  page: 1,
                  label: "Favorite",
                ),
                _bottomAppBarItem(
                  context,
                  icons: FontAwesomeIcons.chartLine,
                  page: 2,
                  label: "Fear Index",
                ),
                _bottomAppBarItem(
                  context,
                  icons: FontAwesomeIcons.chartPie,
                  page: 3,
                  label: "Portfolio",
                ),
                _bottomAppBarItem(
                  context,
                  icons: FontAwesomeIcons.user,
                  page: 4,
                  label: "Profile",
                ),
              ],
            )),
      ),
    );
  }

  Widget _bottomAppBarItem(
    BuildContext context, {
    required icons,
    required page,
    required label,
  }) {
    return ZoomTapAnimation(
      onTap: () => controller.goToTab(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icons,
              size: TEXT_REGULAR_3X,
              color: controller.currentPage.value == page
                  ? Colors.green
                  : Colors.grey,
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              label,
              style: TextStyle(
                color: controller.currentPage.value == page
                    ? Colors.green
                    : Colors.grey,
                fontSize: NAV_BAR_UNSELECT_TEXT_SIZE,
                fontWeight: controller.currentPage.value == page
                    ? FontWeight.w600
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
