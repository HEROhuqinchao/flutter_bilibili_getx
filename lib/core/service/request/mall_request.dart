
import 'package:bilibili_getx/core/model/android/mall/mall_search_model.dart';
import 'package:bilibili_getx/core/model/web/mall/ticket_project_listV2_model.dart';

import '../../../ui/shared/params_sign.dart';
import '../utils/http_base_request.dart';

// Map<String, dynamic> params = {
//   'access_key': '318a42dd67c273c005f3b64464adcf71',
//   'adExtra':
//   '611A2E4B12D98FBF338F2BF6B58C2FBCEE4EF3B5F4163CA3F71C524BD4C28E64E5EF0D9A03448575CD92322023DFD61BD04B1044511D9C95DDA5AEBD99E97AC422A6F04E4C3563B8F4EE54C794BC4DD4ACE2722E8700B6E37EFF6FF86156D3598455C8A00CDF2580FA23C384655B8D33FB8F3873F812081582033F94450A1C040AA989CDC073AE83618B1AF95E5385C1CDCB72C8AD21C58E79DC5188C0BB0F387B7ECA2DCD8C7BB080F715FAC954182FC6DDDFA8A6216557417B33F3DEA13AF6C4A4A4E3313A70B6611BF5F8D04B182E6608EDF167E4438E42F1B75DEF36ECDE2E6A8A71E504AFB5AB2FDEDE0DEC519FC940C48E7DFCDEE77DAD5029AE9AE88ABFDABBCBB9EF2B82122CF1FF018FE3A95B31EC2C88054257EF1C9943589FE14124A08209D5AC110779FB9411C7273E38C0C81F5B6662CB4CAF6EE8863F442ED5ACCC8CD55DBBF750C662A617BEC2518F909CBCCE2C78A5B47B366B96FA00778CBEF1BDDC154C929321D6B508F934F9052FA4670A702B479098690FE64567D80EC53B2A7F7C1ED563F0C8B043C656B4D535BAD5D7857D8A2E92A942C7196844DCF44D4FC25AA22B539621A470E2C57B5822719544C972C0A4C25642E320D6495B1E02B7A6E40B9821D27B39839D6C46B6D45C55DE7762C3B0E72C450857ACB38CB5D7BFA25C7DC25394CD8FDEEA3BAC1A5C44045D48F7D53F77AFC45D771B525329D6818E121275DA710AD25E2158C86112E828F5AD6ED4DF2A1AAACE82501CCE264C10F391981C66600E37BF9E5442D30E181F9099698E074A59D5F10C37156B76E4FDC4B6A58FCC308188F04073DB43F1019D20A57D6D2ADB6119EA2ECCD6A1159344511E1B0FC1F55EF07DCF2803B78781B6B6B18DA41077CD47F68D7B739008B61136885A70E006EA201D4AD8F84690577D6A4CABEAE2E5E7F7F629C4EB0DBA9D93FCF45B77DA0299A8B71CD177DE8D993245F600B1F298E8B5E50A8C29BB',
//   'appkey': '1d8b6e7d45233436',
//   'brand': 'Android',
//   'build': '6720300',
//   'c_locale': 'zh_CN',
//   'channel': 'html5_search_baidu',
//   'cityCode': '440106',
//   'disable_rcmd': '0',
//   'feedType': '0',
//   'mVersion': '133',
//   'mallVersion': '6720300',
//   'mobi_app': 'android',
//   'pageNum': '1',
//   'platform': 'android',
//   's_locale': 'zh_CN',
//   'statistics':
//   '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%226.72.0%22%2C%22abtest%22%3A%22%22%7D',
//   'tribeVersion': '0',
//   'ts': '1659266022',
//   'sign': '9b58aebd3e6c0a1021031ed8e5b0522b'
// };
class HYMallRequest {
  ///????????????????????????
  static Future<MallSearchModel> fetchAndroidMallData(params) async {
    String url = "/mall-c-search/home/index/v2?${ParamsSign.paramsSerialization(params)}";
    final result = await HttpBaseRequest.request("mall", url);
    return MallSearchModel.fromJson(result);
  }
  static Future<Feeds> fetchAndroidMoreMallData(params) async {
    String url = "/mall-c-search/home/feed/list?${ParamsSign.paramsSerialization(params)}";
    final result = await HttpBaseRequest.request("mall", url);
    return Feeds.fromJson(result["data"]["vo"]);
  }
  // https://show.bilibili.com/api/ticket/project/listconf?city_id=-1&platform=pc
  // https://show.bilibili.com/api/ticket/city/list?channel=4
  static Future<TicketProjectListV2Model> fetchWebMallData() async {
    String url = "/api/ticket/project/listV2?version=134&page=1&pagesize=16&area=330200&filter=&platform=web&p_type=%E5%85%A8%E9%83%A8%E7%B1%BB%E5%9E%8B";
    final result = await HttpBaseRequest.request("mall-web", url);
    return TicketProjectListV2Model.fromJson(result);
  }
}
