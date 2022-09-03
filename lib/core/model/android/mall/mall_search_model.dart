// To parse this JSON data, do
//
//     final ticketProjectListV2Model = ticketProjectListV2ModelFromJson(jsonString);

import 'dart:convert';

MallSearchModel ticketProjectListV2ModelFromJson(String str) =>
    MallSearchModel.fromJson(json.decode(str));

String ticketProjectListV2ModelToJson(MallSearchModel data) =>
    json.encode(data.toJson());

class MallSearchModel {
  MallSearchModel({
    required this.code,
    required this.message,
    required this.data,
    required this.errtag,
  });

  int code;
  dynamic message;
  Data data;
  int errtag;

  factory MallSearchModel.fromJson(Map<String, dynamic> json) =>
      MallSearchModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        errtag: json["errtag"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
        "errtag": errtag,
      };
}

class Data {
  Data({
    required this.codeType,
    required this.codeMsg,
    required this.vo,
  });

  int codeType;
  String codeMsg;
  Vo vo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        codeType: json["codeType"],
        codeMsg: json["codeMsg"],
        vo: Vo.fromJson(json["vo"]),
      );

  Map<String, dynamic> toJson() => {
        "codeType": codeType,
        "codeMsg": codeMsg,
        "vo": vo.toJson(),
      };
}

class Vo {
  Vo({
    required this.isVersionV2,
    required this.feedsAbTest,
    required this.tabColumnNums,
    required this.banners,
    required this.homeBannerSkin,
    required this.tabs,
    required this.ipTabVo,
    required this.newFloor,
    required this.blockVersion,
    required this.blocks,
    required this.newBlocks,
    required this.waistBlocks,
    required this.yxsnBlockVo,
    required this.simpleBlocks,
    required this.notice,
    required this.noticeList,
    required this.feedTabs,
    required this.feeds,
    required this.entryList,
    required this.timestamp,
    required this.searchUrl,
    required this.videoVo,
    required this.mixTabs,
    required this.categoryTabs,
    required this.pageLayout,
    required this.blockPageLayout,
    required this.tabLayout,
    required this.slogan,
    required this.categoryTabVo,
    // required this.homeLayoutVo,
    required this.pageTemplate,
    required this.marketingList,
    required this.floating,
  });

  bool isVersionV2;
  int feedsAbTest;
  int tabColumnNums;
  List<Banner> banners;
  dynamic homeBannerSkin;
  List<CategoryTabVo> tabs;
  IpTabVo ipTabVo;
  dynamic newFloor;
  dynamic blockVersion;
  List<dynamic> blocks;
  List<NewBlock> newBlocks;
  dynamic waistBlocks;
  dynamic yxsnBlockVo;
  dynamic simpleBlocks;
  dynamic notice;
  List<dynamic> noticeList;
  List<FeedTab> feedTabs;
  Feeds feeds;
  List<EntryList> entryList;
  int timestamp;
  SearchUrl searchUrl;
  VideoVo videoVo;
  dynamic mixTabs;
  dynamic categoryTabs;
  int pageLayout;
  dynamic blockPageLayout;
  int tabLayout;
  String slogan;
  CategoryTabVo categoryTabVo;
  // Map<String, int> homeLayoutVo;
  dynamic pageTemplate;
  List<MarketingList> marketingList;
  dynamic floating;

  factory Vo.fromJson(Map<String, dynamic> json) => Vo(
        isVersionV2: json["isVersionV2"],
        feedsAbTest: json["feedsABTest"],
        tabColumnNums: json["tabColumnNums"],
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        homeBannerSkin: json["homeBannerSkin"],
        tabs: List<CategoryTabVo>.from(
            json["tabs"].map((x) => CategoryTabVo.fromJson(x))),
        ipTabVo: IpTabVo.fromJson(json["ipTabVO"]),
        newFloor: json["newFloor"],
        blockVersion: json["blockVersion"],
        blocks: List<dynamic>.from(json["blocks"].map((x) => x)),
        newBlocks: List<NewBlock>.from(
            json["newBlocks"].map((x) => NewBlock.fromJson(x))),
        waistBlocks: json["waistBlocks"],
        yxsnBlockVo: json["yxsnBlockVO"],
        simpleBlocks: json["simpleBlocks"],
        notice: json["notice"],
        noticeList: List<dynamic>.from(json["noticeList"].map((x) => x)),
        feedTabs: List<FeedTab>.from(
            json["feedTabs"].map((x) => FeedTab.fromJson(x))),
        feeds: Feeds.fromJson(json["feeds"]),
        entryList: List<EntryList>.from(
            json["entryList"].map((x) => EntryList.fromJson(x))),
        timestamp: json["timestamp"],
        searchUrl: SearchUrl.fromJson(json["searchUrl"]),
        videoVo: VideoVo.fromJson(json["videoVO"]),
        mixTabs: json["mixTabs"],
        categoryTabs: json["categoryTabs"],
        pageLayout: json["pageLayout"],
        blockPageLayout: json["blockPageLayout"],
        tabLayout: json["tabLayout"],
        slogan: json["slogan"],
        categoryTabVo: CategoryTabVo.fromJson(json["categoryTabVO"]),
        // homeLayoutVo: Map.from(json["homeLayoutVO"])
        //     .map((k, v) => MapEntry<String, int>(k, v == null ? null : v)),
        pageTemplate: json["pageTemplate"],
        marketingList: List<MarketingList>.from(
            json["marketingList"].map((x) => MarketingList.fromJson(x))),
        floating: json["floating"],
      );

  Map<String, dynamic> toJson() => {
        "isVersionV2": isVersionV2,
        "feedsABTest": feedsAbTest,
        "tabColumnNums": tabColumnNums,
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "homeBannerSkin": homeBannerSkin,
        "tabs": List<dynamic>.from(tabs.map((x) => x.toJson())),
        "ipTabVO": ipTabVo.toJson(),
        "newFloor": newFloor,
        "blockVersion": blockVersion,
        "blocks": List<dynamic>.from(blocks.map((x) => x)),
        "newBlocks": List<dynamic>.from(newBlocks.map((x) => x.toJson())),
        "waistBlocks": waistBlocks,
        "yxsnBlockVO": yxsnBlockVo,
        "simpleBlocks": simpleBlocks,
        "notice": notice,
        "noticeList": List<dynamic>.from(noticeList.map((x) => x)),
        "feedTabs": List<dynamic>.from(feedTabs.map((x) => x.toJson())),
        "feeds": feeds.toJson(),
        "entryList": List<dynamic>.from(entryList.map((x) => x.toJson())),
        "timestamp": timestamp,
        "searchUrl": searchUrl.toJson(),
        "videoVO": videoVo.toJson(),
        "mixTabs": mixTabs,
        "categoryTabs": categoryTabs,
        "pageLayout": pageLayout,
        "blockPageLayout": blockPageLayout,
        "tabLayout": tabLayout,
        "slogan": slogan,
        "categoryTabVO": categoryTabVo.toJson(),
        // "homeLayoutVO": Map.from(homeLayoutVo)
        //     .map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
        "pageTemplate": pageTemplate,
        "marketingList":
            List<dynamic>.from(marketingList.map((x) => x.toJson())),
        "floating": floating,
      };
}

class Banner {
  Banner({
    required this.hasWished,
    required this.activityCount,
    required this.bannerId,
    required this.name,
    required this.pic,
    required this.url,
    required this.targetUser,
    required this.reportData,
  });

  int hasWished;
  int activityCount;
  int bannerId;
  String name;
  String pic;
  String url;
  int targetUser;
  ReportData reportData;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        hasWished: json["hasWished"],
        activityCount: json["activityCount"],
        bannerId: json["bannerId"],
        name: json["name"],
        pic: json["pic"],
        url: json["url"],
        targetUser: json["targetUser"],
        reportData: ReportData.fromJson(json["reportData"]),
      );

  Map<String, dynamic> toJson() => {
        "hasWished": hasWished,
        "activityCount": activityCount,
        "bannerId": bannerId,
        "name": name,
        "pic": pic,
        "url": url,
        "targetUser": targetUser,
        "reportData": reportData.toJson(),
      };
}

class ReportData {
  ReportData({
    required this.creativeVersion,
    required this.postcore,
    required this.postsub,
    required this.creativeId,
  });

  String creativeVersion;
  int postcore;
  int postsub;
  int creativeId;

  factory ReportData.fromJson(Map<String, dynamic> json) => ReportData(
        creativeVersion: json["creativeVersion"],
        postcore: json["postcore"],
        postsub: json["postsub"],
        creativeId: json["creativeId"],
      );

  Map<String, dynamic> toJson() => {
        "creativeVersion": creativeVersion,
        "postcore": postcore,
        "postsub": postsub,
        "creativeId": creativeId,
      };
}

class CategoryTabVo {
  CategoryTabVo({
    required this.name,
    required this.jumpUrl,
    required this.jumpUrlH5,
    required this.imageUrl,
    required this.nightImageUrl,
    required this.index,
    required this.cateId,
  });

  String name;
  String jumpUrl;
  String jumpUrlH5;
  String imageUrl;
  String nightImageUrl;
  int index;
  String cateId;

  factory CategoryTabVo.fromJson(Map<String, dynamic> json) => CategoryTabVo(
        name: json["name"],
        jumpUrl: json["jumpUrl"],
        jumpUrlH5: json["jumpUrlH5"],
        imageUrl: json["imageUrl"],
        nightImageUrl: json["nightImageUrl"],
        index: json["index"],
        cateId: json["cateId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "jumpUrl": jumpUrl,
        "jumpUrlH5": jumpUrlH5,
        "imageUrl": imageUrl,
        "nightImageUrl": nightImageUrl,
        "index": index,
        "cateId": cateId,
      };
}

class EntryList {
  EntryList({
    required this.imgUrl,
    required this.nightImgUrl,
    required this.jumpUrl,
    required this.title,
    required this.tips,
    required this.tipsType,
  });

  String imgUrl;
  String nightImgUrl;
  String jumpUrl;
  String title;
  String? tips;
  int? tipsType;

  factory EntryList.fromJson(Map<String, dynamic> json) => EntryList(
        imgUrl: json["imgUrl"],
        nightImgUrl: json["nightImgUrl"],
        jumpUrl: json["jumpUrl"],
        title: json["title"],
        tips: json["tips"] == null ? null : json["tips"],
        tipsType: json["tipsType"] == null ? null : json["tipsType"],
      );

  Map<String, dynamic> toJson() => {
        "imgUrl": imgUrl,
        "nightImgUrl": nightImgUrl,
        "jumpUrl": jumpUrl,
        "title": title,
        "tips": tips == null ? null : tips,
        "tipsType": tipsType == null ? null : tipsType,
      };
}

class FeedTab {
  FeedTab({
    required this.feedType,
    required this.name,
  });

  int feedType;
  String name;

  factory FeedTab.fromJson(Map<String, dynamic> json) => FeedTab(
        feedType: json["feedType"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "feedType": feedType,
        "name": name,
      };
}

class Feeds {
  Feeds({
    required this.pageNum,
    required this.total,
    required this.count,
    required this.feedType,
    required this.list,
  });

  int pageNum;
  int? total;
  int? count;
  int feedType;
  List<ListElement> list;

  factory Feeds.fromJson(Map<String, dynamic> json) => Feeds(
        pageNum: json["pageNum"],
        total: json["total"],
        count: json["count"],
        feedType: json["feedType"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNum": pageNum,
        "total": total,
        "count": count,
        "feedType": feedType,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    required this.id,
    required this.type,
    required this.tagName,
    required this.title,
    required this.templateId,
    required this.imageUrls,
    required this.jumpUrls,
    required this.jumpUrlForNa,
    required this.price,
    required this.priceDesc,
    required this.priceSymbol,
    required this.hasWished,
    required this.logData,
    required this.activityCount,
    required this.phoneSystem,
    required this.itemsId,
    required this.itemType,
    required this.saleType,
    required this.ugcList,
    required this.tags,
    required this.ugcSize,
    required this.like,
    required this.brief,
    required this.subStatus,
    required this.ipRightId,
    required this.brandName,
    required this.brandId,
    required this.presaleDeliveryTimeStr,
    required this.itemsType,
    required this.subSkuList,
    required this.jumpLinkType,
    required this.hasWishedCount,
    required this.hasWishedDesc,
    required this.canFav,
    required this.benefitInfos,
    required this.benefitLayout,
    required this.advState,
    required this.tagPrefix,
  });

  String id;
  String? type;
  String tagName;
  String title;
  int templateId;
  List<String> imageUrls;
  List<String>? jumpUrls;
  String jumpUrlForNa;
  List<double>? price;
  List<String>? priceDesc;
  String? priceSymbol;
  int hasWished;
  String? logData;
  int activityCount;
  int phoneSystem;
  int? itemsId;
  int? itemType;
  int? saleType;
  List<dynamic>? ugcList;
  Tags? tags;
  int? ugcSize;
  int? like;
  String? brief;
  int? subStatus;
  int? ipRightId;
  String? brandName;
  int? brandId;
  String? presaleDeliveryTimeStr;
  int? itemsType;
  List<SubSkuList>? subSkuList;
  int? jumpLinkType;
  int? hasWishedCount;
  String? hasWishedDesc;
  bool? canFav;
  List<BenefitInfo>? benefitInfos;
  int? benefitLayout;
  AdvState? advState;
  List<String>? tagPrefix;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        type: json["type"],
        tagName: json["tagName"],
        title: json["title"],
        templateId: json["templateId"],
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
        jumpUrls: json["jumpUrls"] == null ? null : List<String>.from(json["jumpUrls"].map((x) => x)),
        jumpUrlForNa: json["jumpUrlForNa"],
        price: json["price"] == null ? null : List<double>.from(json["price"].map((x) => x)),
        priceDesc: json["priceDesc"] == null ? null : List<String>.from(json["priceDesc"].map((x) => x)),
        priceSymbol: json["priceSymbol"],
        hasWished: json["hasWished"],
        logData: json["logData"],
        activityCount: json["activityCount"],
        phoneSystem: json["phoneSystem"],
        itemsId: json["itemsId"],
        itemType: json["itemType"],
        saleType: json["saleType"],
        ugcList: json["ugcList"] == null ? null : List<dynamic>.from(json["ugcList"].map((x) => x)),
        tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
        ugcSize: json["ugcSize"],
        like: json["like"],
        brief: json["brief"],
        subStatus: json["subStatus"],
        ipRightId: json["ipRightId"],
        brandName: json["brandName"],
        brandId: json["brandId"],
        presaleDeliveryTimeStr: json["presaleDeliveryTimeStr"],
        itemsType: json["itemsType"],
        subSkuList: json["subSkuList"] == null ? null : List<SubSkuList>.from(
            json["subSkuList"].map((x) => SubSkuList.fromJson(x))),
        jumpLinkType: json["jumpLinkType"],
        hasWishedCount:
            json["hasWishedCount"] == null ? null : json["hasWishedCount"],
        hasWishedDesc:
            json["hasWishedDesc"] == null ? null : json["hasWishedDesc"],
        canFav: json["canFav"],
        benefitInfos: json["benefitInfos"] == null
            ? null
            : List<BenefitInfo>.from(
                json["benefitInfos"].map((x) => BenefitInfo.fromJson(x))),
        benefitLayout:
            json["benefitLayout"] == null ? null : json["benefitLayout"],
        advState: json["advState"] == null
            ? null
            : AdvState.fromJson(json["advState"]),
        tagPrefix: json["tagPrefix"] == null
            ? null
            : List<String>.from(json["tagPrefix"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "tagName": tagName,
        "title": title,
        "templateId": templateId,
        "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
        "jumpUrls": List<dynamic>.from(jumpUrls!.map((x) => x)),
        "jumpUrlForNa": jumpUrlForNa,
        "price": List<dynamic>.from(price!.map((x) => x)),
        "priceDesc": List<dynamic>.from(priceDesc!.map((x) => x)),
        "priceSymbol": priceSymbol,
        "hasWished": hasWished,
        "logData": logData,
        "activityCount": activityCount,
        "phoneSystem": phoneSystem,
        "itemsId": itemsId,
        "itemType": itemType,
        "saleType": saleType,
        "ugcList": List<dynamic>.from(ugcList!.map((x) => x)),
        "tags": tags!.toJson(),
        "ugcSize": ugcSize,
        "like": like,
        "brief": brief,
        "subStatus": subStatus,
        "ipRightId": ipRightId,
        "brandName": brandName,
        "brandId": brandId,
        "presaleDeliveryTimeStr": presaleDeliveryTimeStr,
        "itemsType": itemsType,
        "subSkuList": List<dynamic>.from(subSkuList!.map((x) => x.toJson())),
        "jumpLinkType": jumpLinkType,
        "hasWishedCount": hasWishedCount == null ? null : hasWishedCount,
        "hasWishedDesc": hasWishedDesc == null ? null : hasWishedDesc,
        "canFav": canFav,
        "benefitInfos": benefitInfos == null
            ? null
            : List<dynamic>.from(benefitInfos!.map((x) => x.toJson())),
        "benefitLayout": benefitLayout ?? null,
        "advState": advState == null ? null : advState!.toJson(),
        "tagPrefix": tagPrefix == null
            ? null
            : List<dynamic>.from(tagPrefix!.map((x) => x)),
      };
}

class AdvState {
  AdvState({
    required this.preSale,
    required this.remain,
    required this.presaleStartOrderTime,
    required this.presaleEndOrderTime,
    required this.state,
    required this.batchRecords,
    required this.depositType,
    required this.deposit,
    required this.maxDeposit,
    required this.activityDeposit,
    required this.maxActivityDeposit,
  });

  bool preSale;
  int remain;
  int presaleStartOrderTime;
  dynamic presaleEndOrderTime;
  dynamic state;
  dynamic batchRecords;
  dynamic depositType;
  String deposit;
  String maxDeposit;
  dynamic activityDeposit;
  dynamic maxActivityDeposit;

  factory AdvState.fromJson(Map<String, dynamic> json) => AdvState(
        preSale: json["preSale"],
        remain: json["remain"],
        presaleStartOrderTime: json["presaleStartOrderTime"],
        presaleEndOrderTime: json["presaleEndOrderTime"],
        state: json["state"],
        batchRecords: json["batchRecords"],
        depositType: json["depositType"],
        deposit: json["deposit"],
        maxDeposit: json["maxDeposit"],
        activityDeposit: json["activityDeposit"],
        maxActivityDeposit: json["maxActivityDeposit"],
      );

  Map<String, dynamic> toJson() => {
        "preSale": preSale,
        "remain": remain,
        "presaleStartOrderTime": presaleStartOrderTime,
        "presaleEndOrderTime": presaleEndOrderTime,
        "state": state,
        "batchRecords": batchRecords,
        "depositType": depositType,
        "deposit": deposit,
        "maxDeposit": maxDeposit,
        "activityDeposit": activityDeposit,
        "maxActivityDeposit": maxActivityDeposit,
      };
}

class BenefitInfo {
  BenefitInfo({
    required this.partOne,
    required this.partTwo,
    required this.benefitImg,
  });

  String? partOne;
  String? partTwo;
  dynamic benefitImg;

  factory BenefitInfo.fromJson(Map<String, dynamic> json) => BenefitInfo(
        partOne: json["partOne"],
        partTwo: json["partTwo"] == null ? null : json["partTwo"],
        benefitImg: json["benefitImg"],
      );

  Map<String, dynamic> toJson() => {
        "partOne": partOne,
        "partTwo": partTwo == null ? null : partTwo,
        "benefitImg": benefitImg,
      };
}

class SubSkuList {
  SubSkuList({
    required this.imageUrl,
    required this.type,
    required this.name,
    required this.subSkuId,
    required this.saleStatus,
    required this.wishedSku,
    required this.itemsType,
    required this.presaleDeliveryTimeStr,
    required this.whiteListSku,
    required this.subSkuPrice,
    required this.subSkuItemsId,
    required this.url,
  });

  String imageUrl;
  int type;
  String name;
  int subSkuId;
  dynamic saleStatus;
  bool wishedSku;
  dynamic itemsType;
  dynamic presaleDeliveryTimeStr;
  dynamic whiteListSku;
  dynamic subSkuPrice;
  dynamic subSkuItemsId;
  dynamic url;

  factory SubSkuList.fromJson(Map<String, dynamic> json) => SubSkuList(
        imageUrl: json["imageUrl"],
        type: json["type"],
        name: json["name"],
        subSkuId: json["subSkuId"],
        saleStatus: json["saleStatus"],
        wishedSku: json["wishedSku"],
        itemsType: json["itemsType"],
        presaleDeliveryTimeStr: json["presaleDeliveryTimeStr"],
        whiteListSku: json["whiteListSku"],
        subSkuPrice: json["subSkuPrice"],
        subSkuItemsId: json["subSkuItemsId"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "type": type,
        "name": name,
        "subSkuId": subSkuId,
        "saleStatus": saleStatus,
        "wishedSku": wishedSku,
        "itemsType": itemsType,
        "presaleDeliveryTimeStr": presaleDeliveryTimeStr,
        "whiteListSku": whiteListSku,
        "subSkuPrice": subSkuPrice,
        "subSkuItemsId": subSkuItemsId,
        "url": url,
      };
}

class Tags {
  Tags({
    required this.promotionTagNames,
    required this.marketingTagNames,
    required this.saleTypeTagNames,
    required this.typeAndLimitTagName,
    required this.itemTagNames,
    required this.recommendTagNames,
    required this.feedBoardTag,
    required this.blindBoxHideTypeNames,
    required this.blindBoxHasWishNames,
    required this.titleTagNames,
    required this.tagsSort,
    required this.adTagNames,
    required this.godlikeTag,
    required this.attributeTagNames,
    required this.exclusiveSalePoints,
    required this.otherSalePoints,
    required this.blindBoxEuroNames,
    required this.blindBoxCommendTags,
    required this.serviceTagNames,
    required this.drainageTags,
    required this.actionTags,
  });

  List<dynamic> promotionTagNames;
  List<String>? marketingTagNames;
  List<String>? saleTypeTagNames;
  String? typeAndLimitTagName;
  List<dynamic> itemTagNames;
  List<String>? recommendTagNames;
  dynamic feedBoardTag;
  dynamic blindBoxHideTypeNames;
  dynamic blindBoxHasWishNames;
  List<String>? titleTagNames;
  List<String> tagsSort;
  dynamic adTagNames;
  dynamic godlikeTag;
  List<String> attributeTagNames;
  List<String>? exclusiveSalePoints;
  dynamic otherSalePoints;
  dynamic blindBoxEuroNames;
  dynamic blindBoxCommendTags;
  List<String>? serviceTagNames;
  dynamic drainageTags;
  dynamic actionTags;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        promotionTagNames:
            List<dynamic>.from(json["promotionTagNames"].map((x) => x)),
        marketingTagNames:
            List<String>.from(json["marketingTagNames"].map((x) => x)),
        saleTypeTagNames: json["saleTypeTagNames"] == null
            ? null
            : List<String>.from(json["saleTypeTagNames"].map((x) => x)),
        typeAndLimitTagName: json["typeAndLimitTagName"] == null
            ? null
            : json["typeAndLimitTagName"],
        itemTagNames: List<dynamic>.from(json["itemTagNames"].map((x) => x)),
        recommendTagNames:
            List<String>.from(json["recommendTagNames"].map((x) => x)),
        feedBoardTag: json["feedBoardTag"],
        blindBoxHideTypeNames: json["blindBoxHideTypeNames"],
        blindBoxHasWishNames: json["blindBoxHasWishNames"],
        titleTagNames: json["titleTagNames"] == null
            ? null
            : List<String>.from(json["titleTagNames"].map((x) => x)),
        tagsSort: List<String>.from(json["tagsSort"].map((x) => x)),
        adTagNames: json["adTagNames"],
        godlikeTag: json["godlikeTag"],
        attributeTagNames:
            List<String>.from(json["attributeTagNames"].map((x) => x)),
        exclusiveSalePoints: json["exclusiveSalePoints"] == null
            ? null
            : List<String>.from(json["exclusiveSalePoints"].map((x) => x)),
        otherSalePoints: json["otherSalePoints"],
        blindBoxEuroNames: json["blindBoxEuroNames"],
        blindBoxCommendTags: json["blindBoxCommendTags"],
        serviceTagNames: json["serviceTagNames"] == null
            ? null
            : List<String>.from(json["serviceTagNames"].map((x) => x)),
        drainageTags: json["drainageTags"],
        actionTags: json["actionTags"],
      );

  Map<String, dynamic> toJson() => {
        "promotionTagNames":
            List<dynamic>.from(promotionTagNames.map((x) => x)),
        "marketingTagNames":
            List<dynamic>.from(marketingTagNames!.map((x) => x)),
        "saleTypeTagNames": saleTypeTagNames == null
            ? null
            : List<dynamic>.from(saleTypeTagNames!.map((x) => x)),
        "typeAndLimitTagName": typeAndLimitTagName,
        "itemTagNames": List<dynamic>.from(itemTagNames.map((x) => x)),
        "recommendTagNames":
            List<dynamic>.from(recommendTagNames!.map((x) => x)),
        "feedBoardTag": feedBoardTag,
        "blindBoxHideTypeNames": blindBoxHideTypeNames,
        "blindBoxHasWishNames": blindBoxHasWishNames,
        "titleTagNames": titleTagNames == null
            ? null
            : List<dynamic>.from(titleTagNames!.map((x) => x)),
        "tagsSort": List<String>.from(tagsSort.map((x) => x)),
        "adTagNames": adTagNames,
        "godlikeTag": godlikeTag,
        "attributeTagNames":
            List<dynamic>.from(attributeTagNames.map((x) => x)),
        "exclusiveSalePoints": exclusiveSalePoints == null
            ? null
            : List<dynamic>.from(exclusiveSalePoints!.map((x) => x)),
        "otherSalePoints": otherSalePoints,
        "blindBoxEuroNames": blindBoxEuroNames,
        "blindBoxCommendTags": blindBoxCommendTags,
        "serviceTagNames": serviceTagNames == null
            ? null
            : List<dynamic>.from(serviceTagNames!.map((x) => x)),
        "drainageTags": drainageTags,
        "actionTags": actionTags,
      };
}

class IpTabVo {
  IpTabVo({
    required this.ipTabs,
    required this.subIpTabs,
  });

  List<IpTab> ipTabs;
  List<SubIpTab> subIpTabs;

  factory IpTabVo.fromJson(Map<String, dynamic> json) => IpTabVo(
        ipTabs: List<IpTab>.from(json["ipTabs"].map((x) => IpTab.fromJson(x))),
        subIpTabs: List<SubIpTab>.from(
            json["subIpTabs"].map((x) => SubIpTab.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ipTabs": List<dynamic>.from(ipTabs.map((x) => x.toJson())),
        "subIpTabs": List<dynamic>.from(subIpTabs.map((x) => x.toJson())),
      };
}

class IpTab {
  IpTab({
    required this.name,
    required this.jumpUrl,
    required this.jumpUrlH5,
    required this.imageUrl,
    required this.nightImageUrl,
    required this.index,
    required this.type,
    required this.logo,
    required this.imgTag,
    required this.tagList,
    required this.itemImage,
    required this.bgImage,
    required this.itemId,
    required this.ipName,
  });

  String name;
  String jumpUrl;
  String jumpUrlH5;
  String imageUrl;
  String nightImageUrl;
  int index;
  int type;
  String logo;
  String imgTag;
  List<String> tagList;
  String itemImage;
  String bgImage;
  int itemId;
  String ipName;

  factory IpTab.fromJson(Map<String, dynamic> json) => IpTab(
        name: json["name"],
        jumpUrl: json["jumpUrl"],
        jumpUrlH5: json["jumpUrlH5"],
        imageUrl: json["imageUrl"],
        nightImageUrl: json["nightImageUrl"],
        index: json["index"],
        type: json["type"],
        logo: json["logo"],
        imgTag: json["imgTag"],
        tagList: List<String>.from(json["tagList"].map((x) => x)),
        itemImage: json["itemImage"],
        bgImage: json["bgImage"],
        itemId: json["itemId"],
        ipName: json["ipName"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "jumpUrl": jumpUrl,
        "jumpUrlH5": jumpUrlH5,
        "imageUrl": imageUrl,
        "nightImageUrl": nightImageUrl,
        "index": index,
        "type": type,
        "logo": logo,
        "imgTag": imgTag,
        "tagList": List<dynamic>.from(tagList.map((x) => x)),
        "itemImage": itemImage,
        "bgImage": bgImage,
        "itemId": itemId,
        "ipName": ipName,
      };
}

class SubIpTab {
  SubIpTab({
    required this.name,
    required this.jumpUrl,
    required this.jumpUrlH5,
    required this.imageUrl,
    required this.nightImageUrl,
    required this.index,
    required this.type,
    required this.logo,
    required this.imgTag,
  });

  String name;
  String jumpUrl;
  String? jumpUrlH5;
  String imageUrl;
  String? nightImageUrl;
  int index;
  int type;
  String logo;
  String? imgTag;

  factory SubIpTab.fromJson(Map<String, dynamic> json) => SubIpTab(
        name: json["name"],
        jumpUrl: json["jumpUrl"],
        jumpUrlH5: json["jumpUrlH5"] == null ? null : json["jumpUrlH5"],
        imageUrl: json["imageUrl"],
        nightImageUrl:
            json["nightImageUrl"] == null ? null : json["nightImageUrl"],
        index: json["index"],
        type: json["type"],
        logo: json["logo"],
        imgTag: json["imgTag"] == null ? null : json["imgTag"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "jumpUrl": jumpUrl,
        "jumpUrlH5": jumpUrlH5 == null ? null : jumpUrlH5,
        "imageUrl": imageUrl,
        "nightImageUrl": nightImageUrl == null ? null : nightImageUrl,
        "index": index,
        "type": type,
        "logo": logo,
        "imgTag": imgTag == null ? null : imgTag,
      };
}

class MarketingList {
  MarketingList({
    required this.id,
    required this.contentType,
    required this.modPoolName,
    required this.modName,
    required this.fileName,
    required this.name,
    required this.imageUrl,
    required this.jumpUrl,
    required this.interval,
    required this.targetUser,
    required this.type,
    required this.linkId,
    required this.linkIdList,
    required this.relatedType,
    required this.blockType,
    required this.reportData,
    required this.extraData,
  });

  int id;
  int contentType;
  String modPoolName;
  String modName;
  String fileName;
  String name;
  String imageUrl;
  String jumpUrl;
  int interval;
  int targetUser;
  int type;
  int linkId;
  List<int> linkIdList;
  int relatedType;
  dynamic blockType;
  ReportData reportData;
  dynamic extraData;

  factory MarketingList.fromJson(Map<String, dynamic> json) => MarketingList(
        id: json["id"],
        contentType: json["contentType"],
        modPoolName: json["modPoolName"],
        modName: json["modName"],
        fileName: json["fileName"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        jumpUrl: json["jumpUrl"],
        interval: json["interval"],
        targetUser: json["targetUser"],
        type: json["type"],
        linkId: json["linkId"],
        linkIdList: List<int>.from(json["linkIdList"].map((x) => x)),
        relatedType: json["relatedType"],
        blockType: json["blockType"],
        reportData: ReportData.fromJson(json["reportData"]),
        extraData: json["extraData"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contentType": contentType,
        "modPoolName": modPoolName,
        "modName": modName,
        "fileName": fileName,
        "name": name,
        "imageUrl": imageUrl,
        "jumpUrl": jumpUrl,
        "interval": interval,
        "targetUser": targetUser,
        "type": type,
        "linkId": linkId,
        "linkIdList": List<dynamic>.from(linkIdList.map((x) => x)),
        "relatedType": relatedType,
        "blockType": blockType,
        "reportData": reportData.toJson(),
        "extraData": extraData,
      };
}

class NewBlock {
  NewBlock({
    required this.title,
    required this.jumpUrl,
    required this.index,
    required this.type,
    required this.position,
    required this.tagImg,
    required this.tags,
    required this.blockItemVOs,
    required this.icon,
    required this.activityEndTimestamp,
    required this.activityEndText,
    required this.inActivity,
    required this.newImgUrl,
    required this.bubbleImgUrl,
    required this.backgroundImgUrl,
    required this.activityBgImgUrl,
    required this.activityNightBgImgUrl,
    required this.iconImgUrl,
    required this.defaultText,
  });

  String title;
  String jumpUrl;
  int index;
  String type;
  int position;
  String? tagImg;
  List<String>? tags;
  List<BlockItemVo> blockItemVOs;
  String? icon;
  dynamic activityEndTimestamp;
  dynamic activityEndText;
  bool inActivity;
  dynamic newImgUrl;
  dynamic bubbleImgUrl;
  dynamic backgroundImgUrl;
  dynamic activityBgImgUrl;
  dynamic activityNightBgImgUrl;
  dynamic iconImgUrl;
  dynamic defaultText;

  factory NewBlock.fromJson(Map<String, dynamic> json) => NewBlock(
        title: json["title"],
        jumpUrl: json["jumpUrl"],
        index: json["index"],
        type: json["type"],
        position: json["position"],
        tagImg: json["tagImg"] ?? null,
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        blockItemVOs: List<BlockItemVo>.from(
            json["blockItemVOs"].map((x) => BlockItemVo.fromJson(x))),
        icon: json["icon"] == null ? null : json["icon"],
        activityEndTimestamp: json["activityEndTimestamp"],
        activityEndText: json["activityEndText"],
        inActivity: json["inActivity"],
        newImgUrl: json["newImgUrl"],
        bubbleImgUrl: json["bubbleImgUrl"],
        backgroundImgUrl: json["backgroundImgUrl"],
        activityBgImgUrl: json["activityBgImgUrl"],
        activityNightBgImgUrl: json["activityNightBgImgUrl"],
        iconImgUrl: json["iconImgUrl"],
        defaultText: json["defaultText"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "jumpUrl": jumpUrl,
        "index": index,
        "type": type,
        "position": position,
        "tagImg": tagImg == null ? null : tagImg,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "blockItemVOs": List<dynamic>.from(blockItemVOs.map((x) => x.toJson())),
        "icon": icon == null ? null : icon,
        "activityEndTimestamp": activityEndTimestamp,
        "activityEndText": activityEndText,
        "inActivity": inActivity,
        "newImgUrl": newImgUrl,
        "bubbleImgUrl": bubbleImgUrl,
        "backgroundImgUrl": backgroundImgUrl,
        "activityBgImgUrl": activityBgImgUrl,
        "activityNightBgImgUrl": activityNightBgImgUrl,
        "iconImgUrl": iconImgUrl,
        "defaultText": defaultText,
      };
}

class BlockItemVo {
  BlockItemVo({
    required this.itemId,
    required this.itemName,
    required this.imageUrl,
    required this.tag,
    required this.jumpUrl,
    required this.isShowPrice,
    required this.priceSymbol,
    required this.priceDesc,
    required this.priceSymbolImg,
    required this.benefitInfo,
    required this.benefitInfos,
    required this.linePriceDesc,
  });

  int? itemId;
  String itemName;
  String imageUrl;
  String tag;
  String jumpUrl;
  bool isShowPrice;
  String? priceSymbol;
  List<String>? priceDesc;
  dynamic priceSymbolImg;
  BenefitInfo? benefitInfo;
  List<BenefitInfo>? benefitInfos;
  String? linePriceDesc;

  factory BlockItemVo.fromJson(Map<String, dynamic> json) => BlockItemVo(
        itemId: json["itemId"] == null ? null : json["itemId"],
        itemName: json["itemName"],
        imageUrl: json["imageUrl"],
        tag: json["tag"],
        jumpUrl: json["jumpUrl"],
        isShowPrice: json["isShowPrice"],
        priceSymbol: json["priceSymbol"],
        priceDesc: json["priceDesc"] == null
            ? null
            : List<String>.from(json["priceDesc"].map((x) => x)),
        priceSymbolImg: json["priceSymbolImg"],
        benefitInfo: json["benefitInfo"] == null
            ? null
            : BenefitInfo.fromJson(json["benefitInfo"]),
        benefitInfos: json["benefitInfos"] == null
            ? null
            : List<BenefitInfo>.from(
                json["benefitInfos"].map((x) => BenefitInfo.fromJson(x))),
        linePriceDesc: json["linePriceDesc"],
      );

  Map<String, dynamic> toJson() => {
        "itemId": itemId == null ? null : itemId,
        "itemName": itemName,
        "imageUrl": imageUrl,
        "tag": tag,
        "jumpUrl": jumpUrl,
        "isShowPrice": isShowPrice,
        "priceSymbol": priceSymbol,
        "priceDesc": priceDesc == null
            ? null
            : List<dynamic>.from(priceDesc!.map((x) => x)),
        "priceSymbolImg": priceSymbolImg,
        "benefitInfo": benefitInfo == null ? null : benefitInfo!.toJson(),
        "benefitInfos": benefitInfos == null
            ? null
            : List<dynamic>.from(benefitInfos!.map((x) => x.toJson())),
        "linePriceDesc": linePriceDesc,
      };
}

class SearchUrl {
  SearchUrl({
    required this.title,
    required this.titleList,
    required this.titleVoList,
    required this.urlTicketSearch,
    required this.urlMallSearch,
    required this.urlMallAndTicketSearch,
    required this.isSearchV2,
    required this.timestamp,
  });

  String title;
  List<String> titleList;
  List<TitleVoList> titleVoList;
  String urlTicketSearch;
  String urlMallSearch;
  String urlMallAndTicketSearch;
  int isSearchV2;
  dynamic timestamp;

  factory SearchUrl.fromJson(Map<String, dynamic> json) => SearchUrl(
        title: json["title"],
        titleList: List<String>.from(json["titleList"].map((x) => x)),
        titleVoList: List<TitleVoList>.from(
            json["titleVoList"].map((x) => TitleVoList.fromJson(x))),
        urlTicketSearch: json["urlTicketSearch"],
        urlMallSearch: json["urlMallSearch"],
        urlMallAndTicketSearch: json["urlMallAndTicketSearch"],
        isSearchV2: json["isSearchV2"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "titleList": List<dynamic>.from(titleList.map((x) => x)),
        "titleVoList": List<dynamic>.from(titleVoList.map((x) => x.toJson())),
        "urlTicketSearch": urlTicketSearch,
        "urlMallSearch": urlMallSearch,
        "urlMallAndTicketSearch": urlMallAndTicketSearch,
        "isSearchV2": isSearchV2,
        "timestamp": timestamp,
      };
}

class TitleVoList {
  TitleVoList({
    required this.title,
    required this.postId,
  });

  String title;
  String postId;

  factory TitleVoList.fromJson(Map<String, dynamic> json) => TitleVoList(
        title: json["title"],
        postId: json["postId"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "postId": postId,
      };
}

class VideoVo {
  VideoVo({
    required this.videoName,
    required this.videoTime,
    required this.jumpUrl,
    required this.intervalTime,
    required this.configId,
    required this.modName,
    required this.departmentName,
    required this.videoWidth,
    required this.videoHeight,
    required this.startTime,
    required this.endTime,
    required this.suffix,
    required this.imgUrl,
  });

  dynamic videoName;
  dynamic videoTime;
  dynamic jumpUrl;
  dynamic intervalTime;
  dynamic configId;
  dynamic modName;
  dynamic departmentName;
  dynamic videoWidth;
  dynamic videoHeight;
  dynamic startTime;
  dynamic endTime;
  dynamic suffix;
  dynamic imgUrl;

  factory VideoVo.fromJson(Map<String, dynamic> json) => VideoVo(
        videoName: json["videoName"],
        videoTime: json["videoTime"],
        jumpUrl: json["jumpUrl"],
        intervalTime: json["intervalTime"],
        configId: json["configId"],
        modName: json["modName"],
        departmentName: json["departmentName"],
        videoWidth: json["videoWidth"],
        videoHeight: json["videoHeight"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        suffix: json["suffix"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "videoName": videoName,
        "videoTime": videoTime,
        "jumpUrl": jumpUrl,
        "intervalTime": intervalTime,
        "configId": configId,
        "modName": modName,
        "departmentName": departmentName,
        "videoWidth": videoWidth,
        "videoHeight": videoHeight,
        "startTime": startTime,
        "endTime": endTime,
        "suffix": suffix,
        "imgUrl": imgUrl,
      };
}
