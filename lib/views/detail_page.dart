import 'package:coinite/controllers/home_controller.dart';
import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:coinite/resources/dimens.dart';
import 'package:coinite/widgets/title_view_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  final CryptoVO crypto = Get.arguments[0];
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    controller.checkFavorite(crypto);
    return Scaffold(
      appBar: AppBar(
        title: Text(crypto.symbol),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                controller.toggleButton(crypto);
              },
              icon: Icon(
                controller.isFavorite.value
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM),
        child: Column(
          children: [
            TitleAndViewSection(title: "Name", value: crypto.name),
            TitleAndViewSection(
              title: "Price",
              value: crypto.quotes.detailVO.price.toString(),
              isSign: true,
            ),
            TitleAndViewSection(
              title: "Rank",
              value: crypto.rank.toString(),
            ),
            TitleAndViewSection(
              title: "Percent Change 24H",
              value: crypto.quotes.detailVO.percentChange24h.toString(),
              isChange: true,
            ),
            TitleAndViewSection(
              title: "Percent Change 7D",
              value: crypto.quotes.detailVO.percentChange7d.toString(),
              isChange: true,
            ),
            TitleAndViewSection(
              title: "Market Cap",
              value: crypto.quotes.detailVO.marketCap.toString(),
              isChange: true,
            ),
            TitleAndViewSection(
                title: "Total Supply", value: crypto.totalSupply.toString()),
            TitleAndViewSection(
                title: "Max Supply", value: crypto.maxSupply.toString()),
          ],
        ),
      ),
    );
  }
}
