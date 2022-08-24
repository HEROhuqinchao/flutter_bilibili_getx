import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';

import '../../../../../core/model/feed_index_model.dart';
import '../../../../../core/service/request/home_request.dart';
import '../../../../../core/service/utils/constant.dart';
import '../../../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../../../core/shared_preferences/shared_preference_util.dart';
import '../../../../shared/image_asset.dart';
import '../../../../shared/params_sign.dart';
import '../../../../widgets/recommend_item.dart';
import 'recommend_state.dart';

class RecommendLogic extends GetxController {
  final RecommendState state = RecommendState();

  @override
  void onReady() {
    fetchFeedIndexData();
    super.onReady();
  }

  @override
  void onClose() {
    state.easyRefreshController.dispose();
    state.swiperController.dispose();
    state.easyRefreshScrollController.dispose();
    state.gridViewController.dispose();
    super.onClose();
  }

  ///初始化界面
  void initHomeRecommendWidgets() {
    ///还没有数据就初始化数据
    if (state.homeRecommendWidgets.isEmpty) {
      if (state.feedIndexItemList.length == 10) {
        ///单纯的十条数据
        state.homeRecommendWidgets
            .add(buildHomeRecommendVideoCards(state.feedIndexItemList));
      } else if (state.feedIndexItemList.length == 11) {
        ///有轮播图的是十一条数据
        state.homeRecommendWidgets.addAll([
          ///前三条视频数据为轮播图数据
          buildHomeRecommendCarousel(state.feedIndexItemList[0].bannerItems!),

          ///后面的数据用于card
          buildHomeRecommendVideoCards(state.feedIndexItemList.sublist(1)),
        ]);
      } else {
        if (Constant.isDebug) {
          print(state.feedIndexItemList.length);
        }
      }
    }
  }

  ///清空数据
  void clearFeedIndexData() {
    state.feedIndexItemList.clear();
    state.homeRecommendWidgets.clear();
    fetchFeedIndexData();
  }

  ///获取数据
  void fetchFeedIndexData() {
    HYHomeRequest.getFeedIndexData(fetchFeedIndexParamsWithSign())
        .then((value) async {
      state.feedIndexItemList.addAll(value.data.items);
      initHomeRecommendWidgets();
      await Future.delayed(const Duration(seconds: 1), () {
        update();
      });
    });
  }

  ///获取有sign值的参数
  Map<String, dynamic> fetchFeedIndexParamsWithSign() {
    bool isLogin =
        SharedPreferenceUtil.getBool(BilibiliSharedPreference.isLogin) ?? false;
    Map<String, dynamic> params = {
      // 'ad_extra':
      //     '611A2E4B12D98FBF338F2BF6B58C2FBCEE4EF3B5F4163CA3F71C524BD4C28E64E5EF0D9A03448575CD92322023DFD61BD04B1044511D9C95DDA5AEBD99E97AC422A6F04E4C3563B8F4EE54C794BC4DD41CAA06F3417CCEED1BDCB21D9CB8AEFC09CDCD6BC8AE11FE730C70040DBC291FA9996D5FF9DFDD8A32592C9DC1FD0012C462E454346FC6D9803493CD2E6110A78CEB8E44A61C37D7A883513099E8757E8F0B65CBA9AE4982D8A0E3B9AEAB0FCAA623115E2353DE323DD4F227C7A4F65052AB2A165F76E478BA72A469C42459FBA88A778A7FFF23465258B116451B24011E20B8A895EC2A074AE13BA7E4E444842F8F069F2BB6F7DAC03C2B0EFD5E1D845B8ED6B088D879FF5E67FD2A103A145DF91A0211C772669B4BFB17D2977D2BE1244656631B96A9A915631E21549524C4986D7BA84B5B31CAFB2C1994C7DE6D789F9EF059F8DCA4A30E28E427E3F412AE8BF7882A2908ACEB195847672603F90DD1C8C6D1E0FC5EF6C905AB3B7F9E5B260904BBAE6E560EC81913C2606ECE6A70888189CBCDEFD901C9C3FB694455ECE82B6D0E9DDB97C0092131E3A66F85DFB74296BF213260D773ECB93C288EFD43B185A348EA902B8946588B3555CC4331DB8EF2279D7A2A1819BCE53A55E9D1680DEF20CAA3ABE3AFCB33146EB0449BF8B4FE5DF3864B9CB626CC6C809D7F6E888F64B9DF2C672E9C2252BAE088B57B1FD96391CE29550E5D59D3E6410E7160C9220D2A9C1A4F4F47CECF66CF689335EED850F089B8990DEDDCB4F352346A9B8213319E5AB61679F65A75401B7D72A96A182E109DEA531325737993F0BF6B09EE376B1374F44EE191D8CC6C9858BAD6896C0395971D25BB84989A6ABA19E5E1C8ECEA518545F76E0EDFD773BA67CA98208D5BAF3150057461891D56E204C8E7B7237F967BF88ADF0669F136BD818051B0F2DE7140D2A02A4604B8342668BE392889B4539A24CE996FE103A4AB0D3680AA42',
      'appkey': Constant.appKey,
      'autoplay_card': '11',
      'autoplay_timestamp': '0',
      'build': '6720300',
      'c_locale': 'zh_CN',
      'channel': 'html5_search_baidu',
      'column': '2',
      'column_timestamp': '0',
      'device_name': 'MuMu',
      'device_type': '0',
      'disable_rcmd': '0',
      'flush': '0',
      'fnval': '272',
      'fnver': '0',
      'force_host': '0',
      'fourk': '0',
      'guidance': '0',
      'https_url_req': '0',
      'idx': '0',
      'inline_danmu': '2',
      'inline_sound': '1',
      'interest_id': '0',
      'login_event': '1',
      'mobi_app': 'android',
      'network': 'wifi',
      'open_event': 'cold',
      'platform': 'android',
      'player_net': '1',
      'pull': 'true',
      'qn': '32',
      'recsys_mode': '0',
      's_locale': 'zh_CN',
      'splash_id': '',
      'statistics':
          '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%226.72.0%22%2C%22abtest%22%3A%22%22%7D',
      'ts': '1659143497',
      'voice_balance': '1',
    };

    ///如果已经登录，加上access_key字段
    if (isLogin == true) {
      String? accessKey =
          SharedPreferenceUtil.getString(BilibiliSharedPreference.accessToken);
      final accessKeyEntry = <String, dynamic>{'access_key': accessKey!};
      params.addEntries(accessKeyEntry.entries);
    }

    ///加上sign字段
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);
    return params;
  }

  ///刷新数据(新加入的数据)
  void refreshVideosData(List<FeedIndexItem> items) {
    state.feedIndexItemList = state.feedIndexItemList.reversed.toList();
    state.feedIndexItemList.addAll(items);
    state.feedIndexItemList = state.feedIndexItemList.reversed.toList();
    update();
  }

  void refreshRecommendItemData() async {
    HYHomeRequest.getFeedIndexData(
      fetchFeedIndexParamsWithSign(),
    ).then((value) {
      refreshVideosData(value.data.items);
      state.homeRecommendWidgets
          .insert(0, buildHYHomeRefreshItemOneVideo(value.data.items[10]));
      state.homeRecommendWidgets.insert(
          0, buildHomeRecommendVideoCards(value.data.items.sublist(1, 9)));
    });
    await Future.delayed(const Duration(seconds: 2), () {
      update();
    });
  }

  ///单视频
  Widget buildHYHomeRefreshItemOneVideo(FeedIndexItem video) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8).r,
        height: 120.w,
        width: 1.sw,
        child: FadeInImage(
          fit: BoxFit.fill,
          placeholderFit: BoxFit.fill,
          placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
          image: NetworkImage(
            video.cover!,
          ),
        ),
      ),
    );
  }

  ///视频列表
  Widget buildHomeRecommendVideoCards(List<FeedIndexItem> items) {
    return GridView.builder(
      primary: false,
      controller: state.gridViewController,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemBuilder: (ctx, index) {
        // print(data[index].aid);
        return RecommendItem(items[index]);
        // return Container();
      },
    );
  }

  ///加载数据（上拉动作）
  void loadRecommendItemData() {
    HYHomeRequest.getFeedIndexData(fetchFeedIndexParamsWithSign())
        .then((value) {
      loadMoreVideosData(value.data.items);
      state.homeRecommendWidgets
          .add(buildHYHomeRefreshItemOneVideo(value.data.items[10]));
      state.homeRecommendWidgets
          .add(buildHomeRecommendVideoCards(value.data.items.sublist(1, 9)));
      update();
    });
  }

  ///加载视频(新加入的数据)
  void loadMoreVideosData(List<FeedIndexItem> items) {
    state.feedIndexItemList.addAll(items);
    update();
  }

  ///轮播图
  Widget buildHomeRecommendCarousel(List<BannerItem> bannerItems) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8).r,
        height: 140.w, //这里的轮播图组件必须包裹在有高度的控件或者设置比例
        child: Swiper(
          controller: state.swiperController,
          scale: .7,
          viewportFraction: .7,
          itemBuilder: (ctx, index) {
            return Stack(
              children: [
                FadeInImage(
                  fit: BoxFit.cover,
                  placeholderFit: BoxFit.cover,
                  placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
                  image: NetworkImage(bannerItems[index].staticBanner!.image!),
                ),
                Positioned(
                  left: 10.r,
                  bottom: 10.r,
                  child: Text(
                    bannerItems[index].staticBanner!.title!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                )
              ],
            );
          },
          itemCount: bannerItems.length,
          indicatorLayout: PageIndicatorLayout.SCALE,
          autoplayDelay: 3000,
          pagination: SwiperPagination(
              alignment: Alignment.bottomRight,
              margin:
                  const EdgeInsets.only(left: 0, right: 8, bottom: 8, top: 0)
                      .r),
          fade: 1.0,
          autoplay: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
