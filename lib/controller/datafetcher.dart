import 'package:dio/dio.dart';

import 'package:catfacts/controller/connector.dart';
import 'package:catfacts/models/constants.dart';
import 'package:catfacts/models/data.dart';

class FetchData {
  final Connector _connector = Connector();

  Future<CatFact> getCatFact() async {
    CatFact catFact = CatFact(fact: "");
    Response<dynamic>? response = await _connector.getData(API.baseUrl);
    if (response != null) {
      if (response.statusCode == 200) {
        catFact = CatFact(fact: response.data["fact"]);
      }
      print(response.statusCode);
    }
    return catFact;
  }
}
