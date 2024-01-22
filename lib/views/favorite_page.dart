import 'package:coinite/controllers/favorite_controller.dart';
import 'package:coinite/controllers/home_controller.dart';
import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:coinite/data/vo/detail_vo.dart';
import 'package:coinite/views/detail_page.dart';
import 'package:coinite/widgets/list_title_section.dart';
import 'package:coinite/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:coinite/resources/dimens.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print(controller.favList);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2,
            vertical: MARGIN_MEDIUM,
          ),
          child: TitleText(title: "Favorite List"),
        ),
        ListTitleSection(),
        Obx(() {
          if (controller.favList.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                itemCount: controller.favList.length,
                itemBuilder: (context, index) {
                  CryptoVO crypto = controller.favList[index];
                  DetailVO detail = crypto.quotes.detailVO;
                  return ListTile(
                    onTap: () {
                      Get.to(() => DetailPage(), arguments: [crypto]);
                    },
                    leading: Text(
                      "${index + 1}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              crypto.symbol,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              crypto.name,
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Text(
                            controller.stringToDoubleAsFixFour(detail.price),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: controller
                        .get24HoursChange(detail.percentChange24h ?? 0.0),
                  );
                },
              ),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Center(
                child: Text("There is no favorite list!"),
              ),
            );
          }
        })
      ],
    );
  }
}
