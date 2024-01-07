import 'package:coinite/controllers/home_controller.dart';
import 'package:coinite/data/models/crypto_model_impl.dart';
import 'package:coinite/data/vo/crypto_vo.dart';
import 'package:coinite/data/vo/detail_vo.dart';
import 'package:coinite/resources/dimens.dart';
import 'package:coinite/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(title: "Cryptocurrency"),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: TEXT_REGULAR_3X,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        ListTitleSection(),
        Expanded(
          child: FutureBuilder(
              future: CryptoModelImpl().getCryptoList(100),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CryptoVO>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      CryptoVO crypto = snapshot.data![index];
                      DetailVO detail = crypto.quotes.detailVO;
                      int number = index + 1;
                      return cryptoSection(number, crypto, detail);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }

  ListTile cryptoSection(int number, CryptoVO crypto, DetailVO detail) {
    return ListTile(
      leading: Text(
        number.toString(),
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
      trailing: controller.get24HoursChange(
        detail.percentChange24h,
      ),
    );
  }
}

class ListTitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "#",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Coins",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Text(
              "Price(USD)  ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      trailing: Text(
        "24h %",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}
