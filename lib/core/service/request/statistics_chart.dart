import 'package:bilibili_getx/core/service/utils/http_base_request.dart';

import '../../model/covid_province_model.dart';

///图表数据
class HYStatisticChartRequest {
  HYStatisticChartRequest._internal();

  static final HYStatisticChartRequest _instance =
      HYStatisticChartRequest._internal();

  factory HYStatisticChartRequest() => _instance;

  Future<List<Datum>?> fetchCovidProvinceData() async {
    const url = "/api/covid";
    final result = await HttpBaseRequest().request("covid", url);
    CovidProvinceModel covidProvinceModel = CovidProvinceModel.fromJson(result);
    if (covidProvinceModel.success) {
      return covidProvinceModel.data;
    } else {
      return [];
    }
  }
}
