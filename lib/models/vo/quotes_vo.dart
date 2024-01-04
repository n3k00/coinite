import 'package:coinite/models/vo/detail_vo.dart';

class Quotes {
  DetailVO detailVO;

  Quotes({
    required this.detailVO,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        detailVO: DetailVO.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": detailVO.toJson(),
      };
}
