///
//  Generated code. Do not modify.
//  source: dynamic.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'dynamic.pb.dart' as $0;
import 'dynamic.pbjson.dart';

export 'dynamic.pb.dart';

abstract class DynamicServiceBase extends $pb.GeneratedService {
  $async.Future<$0.DynVideoReply> dynVideo($pb.ServerContext ctx, $0.DynVideoReq request);
  $async.Future<$0.DynAllReply> dynAll($pb.ServerContext ctx, $0.DynAllReq request);
  $async.Future<$0.DynDetailsReply> dynDetails($pb.ServerContext ctx, $0.DynDetailsReq request);
  $async.Future<$0.DynVideoPersonalReply> dynVideoPersonal($pb.ServerContext ctx, $0.DynVideoPersonalReq request);
  $async.Future<$0.NoReply> dynVideoUpdOffset($pb.ServerContext ctx, $0.DynVideoUpdOffsetReq request);
  $async.Future<$0.DynAdditionCommonFollowReply> dynAdditionCommonFollow($pb.ServerContext ctx, $0.DynAdditionCommonFollowReq request);
  $async.Future<$0.NoReply> dynThumb($pb.ServerContext ctx, $0.DynThumbReq request);
  $async.Future<$0.DynFakeCardReply> dynFakeCard($pb.ServerContext ctx, $0.DynFakeCardReq request);
  $async.Future<$0.DynRcmdUpExchangeReply> dynRcmdUpExchange($pb.ServerContext ctx, $0.DynRcmdUpExchangeReq request);
  $async.Future<$0.DynAllPersonalReply> dynAllPersonal($pb.ServerContext ctx, $0.DynAllPersonalReq request);
  $async.Future<$0.NoReply> dynAllUpdOffset($pb.ServerContext ctx, $0.DynAllUpdOffsetReq request);
  $async.Future<$0.DynVoteReply> dynVote($pb.ServerContext ctx, $0.DynVoteReq request);
  $async.Future<$0.DynMixUpListViewMoreReply> dynMixUpListViewMore($pb.ServerContext ctx, $0.DynMixUpListViewMoreReq request);
  $async.Future<$0.DynLightReply> dynLight($pb.ServerContext ctx, $0.DynLightReq request);
  $async.Future<$0.DynDetailReply> dynDetail($pb.ServerContext ctx, $0.DynDetailReq request);
  $async.Future<$0.LikeListReply> likeList($pb.ServerContext ctx, $0.LikeListReq request);
  $async.Future<$0.RepostListRsp> repostList($pb.ServerContext ctx, $0.RepostListReq request);
  $async.Future<$0.DynSpaceRsp> dynSpace($pb.ServerContext ctx, $0.DynSpaceReq request);
  $async.Future<$0.DynRcmdReply> dynUnLoginRcmd($pb.ServerContext ctx, $0.DynRcmdReq request);
  $async.Future<$0.DynServerDetailsReply> dynServerDetails($pb.ServerContext ctx, $0.DynServerDetailsReq request);
  $async.Future<$0.DynSearchReply> dynSearch($pb.ServerContext ctx, $0.DynSearchReq request);
  $async.Future<$0.NoReply> setDecision($pb.ServerContext ctx, $0.SetDecisionReq request);
  $async.Future<$0.AlumniDynamicsReply> alumniDynamics($pb.ServerContext ctx, $0.AlumniDynamicsReq request);
  $async.Future<$0.CampusRcmdReply> campusRcmd($pb.ServerContext ctx, $0.CampusRcmdReq request);
  $async.Future<$0.NoReply> subscribeCampus($pb.ServerContext ctx, $0.SubscribeCampusReq request);
  $async.Future<$0.NoReply> setRecentCampus($pb.ServerContext ctx, $0.SetRecentCampusReq request);
  $async.Future<$0.DynTabReply> dynTab($pb.ServerContext ctx, $0.DynTabReq request);
  $async.Future<$0.SchoolSearchReply> schoolSearch($pb.ServerContext ctx, $0.SchoolSearchReq request);
  $async.Future<$0.SchoolRecommendReply> schoolRecommend($pb.ServerContext ctx, $0.SchoolRecommendReq request);
  $async.Future<$0.DynSpaceSearchDetailsReply> dynSpaceSearchDetails($pb.ServerContext ctx, $0.DynSpaceSearchDetailsReq request);
  $async.Future<$0.OfficialAccountsReply> officialAccounts($pb.ServerContext ctx, $0.OfficialAccountsReq request);
  $async.Future<$0.OfficialDynamicsReply> officialDynamics($pb.ServerContext ctx, $0.OfficialDynamicsReq request);
  $async.Future<$0.CampusRedDotReply> campusRedDot($pb.ServerContext ctx, $0.CampusRedDotReq request);
  $async.Future<$0.CampusRcmdFeedReply> campusRcmdFeed($pb.ServerContext ctx, $0.CampusRcmdFeedReq request);
  $async.Future<$0.TopicSquareReply> topicSquare($pb.ServerContext ctx, $0.TopicSquareReq request);
  $async.Future<$0.TopicListReply> topicList($pb.ServerContext ctx, $0.TopicListReq request);
  $async.Future<$0.CampusMateLikeListReply> campusMateLikeList($pb.ServerContext ctx, $0.CampusMateLikeListReq request);
  $async.Future<$0.CampusFeedbackReply> campusFeedback($pb.ServerContext ctx, $0.CampusFeedbackReq request);
  $async.Future<$0.CampusBillBoardReply> campusBillboard($pb.ServerContext ctx, $0.CampusBillBoardReq request);
  $async.Future<$0.CampusBillBoardReply> campusBillboardInternal($pb.ServerContext ctx, $0.CampusBillboardInternalReq request);
  $async.Future<$0.CampusTopicRcmdFeedReply> campusTopicRcmdFeed($pb.ServerContext ctx, $0.CampusTopicRcmdFeedReq request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'DynVideo': return $0.DynVideoReq();
      case 'DynAll': return $0.DynAllReq();
      case 'DynDetails': return $0.DynDetailsReq();
      case 'DynVideoPersonal': return $0.DynVideoPersonalReq();
      case 'DynVideoUpdOffset': return $0.DynVideoUpdOffsetReq();
      case 'DynAdditionCommonFollow': return $0.DynAdditionCommonFollowReq();
      case 'DynThumb': return $0.DynThumbReq();
      case 'DynFakeCard': return $0.DynFakeCardReq();
      case 'DynRcmdUpExchange': return $0.DynRcmdUpExchangeReq();
      case 'DynAllPersonal': return $0.DynAllPersonalReq();
      case 'DynAllUpdOffset': return $0.DynAllUpdOffsetReq();
      case 'DynVote': return $0.DynVoteReq();
      case 'DynMixUpListViewMore': return $0.DynMixUpListViewMoreReq();
      case 'DynLight': return $0.DynLightReq();
      case 'DynDetail': return $0.DynDetailReq();
      case 'LikeList': return $0.LikeListReq();
      case 'RepostList': return $0.RepostListReq();
      case 'DynSpace': return $0.DynSpaceReq();
      case 'DynUnLoginRcmd': return $0.DynRcmdReq();
      case 'DynServerDetails': return $0.DynServerDetailsReq();
      case 'DynSearch': return $0.DynSearchReq();
      case 'SetDecision': return $0.SetDecisionReq();
      case 'AlumniDynamics': return $0.AlumniDynamicsReq();
      case 'CampusRcmd': return $0.CampusRcmdReq();
      case 'SubscribeCampus': return $0.SubscribeCampusReq();
      case 'SetRecentCampus': return $0.SetRecentCampusReq();
      case 'DynTab': return $0.DynTabReq();
      case 'SchoolSearch': return $0.SchoolSearchReq();
      case 'SchoolRecommend': return $0.SchoolRecommendReq();
      case 'DynSpaceSearchDetails': return $0.DynSpaceSearchDetailsReq();
      case 'OfficialAccounts': return $0.OfficialAccountsReq();
      case 'OfficialDynamics': return $0.OfficialDynamicsReq();
      case 'CampusRedDot': return $0.CampusRedDotReq();
      case 'CampusRcmdFeed': return $0.CampusRcmdFeedReq();
      case 'TopicSquare': return $0.TopicSquareReq();
      case 'TopicList': return $0.TopicListReq();
      case 'CampusMateLikeList': return $0.CampusMateLikeListReq();
      case 'CampusFeedback': return $0.CampusFeedbackReq();
      case 'CampusBillboard': return $0.CampusBillBoardReq();
      case 'CampusBillboardInternal': return $0.CampusBillboardInternalReq();
      case 'CampusTopicRcmdFeed': return $0.CampusTopicRcmdFeedReq();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'DynVideo': return this.dynVideo(ctx, request as $0.DynVideoReq);
      case 'DynAll': return this.dynAll(ctx, request as $0.DynAllReq);
      case 'DynDetails': return this.dynDetails(ctx, request as $0.DynDetailsReq);
      case 'DynVideoPersonal': return this.dynVideoPersonal(ctx, request as $0.DynVideoPersonalReq);
      case 'DynVideoUpdOffset': return this.dynVideoUpdOffset(ctx, request as $0.DynVideoUpdOffsetReq);
      case 'DynAdditionCommonFollow': return this.dynAdditionCommonFollow(ctx, request as $0.DynAdditionCommonFollowReq);
      case 'DynThumb': return this.dynThumb(ctx, request as $0.DynThumbReq);
      case 'DynFakeCard': return this.dynFakeCard(ctx, request as $0.DynFakeCardReq);
      case 'DynRcmdUpExchange': return this.dynRcmdUpExchange(ctx, request as $0.DynRcmdUpExchangeReq);
      case 'DynAllPersonal': return this.dynAllPersonal(ctx, request as $0.DynAllPersonalReq);
      case 'DynAllUpdOffset': return this.dynAllUpdOffset(ctx, request as $0.DynAllUpdOffsetReq);
      case 'DynVote': return this.dynVote(ctx, request as $0.DynVoteReq);
      case 'DynMixUpListViewMore': return this.dynMixUpListViewMore(ctx, request as $0.DynMixUpListViewMoreReq);
      case 'DynLight': return this.dynLight(ctx, request as $0.DynLightReq);
      case 'DynDetail': return this.dynDetail(ctx, request as $0.DynDetailReq);
      case 'LikeList': return this.likeList(ctx, request as $0.LikeListReq);
      case 'RepostList': return this.repostList(ctx, request as $0.RepostListReq);
      case 'DynSpace': return this.dynSpace(ctx, request as $0.DynSpaceReq);
      case 'DynUnLoginRcmd': return this.dynUnLoginRcmd(ctx, request as $0.DynRcmdReq);
      case 'DynServerDetails': return this.dynServerDetails(ctx, request as $0.DynServerDetailsReq);
      case 'DynSearch': return this.dynSearch(ctx, request as $0.DynSearchReq);
      case 'SetDecision': return this.setDecision(ctx, request as $0.SetDecisionReq);
      case 'AlumniDynamics': return this.alumniDynamics(ctx, request as $0.AlumniDynamicsReq);
      case 'CampusRcmd': return this.campusRcmd(ctx, request as $0.CampusRcmdReq);
      case 'SubscribeCampus': return this.subscribeCampus(ctx, request as $0.SubscribeCampusReq);
      case 'SetRecentCampus': return this.setRecentCampus(ctx, request as $0.SetRecentCampusReq);
      case 'DynTab': return this.dynTab(ctx, request as $0.DynTabReq);
      case 'SchoolSearch': return this.schoolSearch(ctx, request as $0.SchoolSearchReq);
      case 'SchoolRecommend': return this.schoolRecommend(ctx, request as $0.SchoolRecommendReq);
      case 'DynSpaceSearchDetails': return this.dynSpaceSearchDetails(ctx, request as $0.DynSpaceSearchDetailsReq);
      case 'OfficialAccounts': return this.officialAccounts(ctx, request as $0.OfficialAccountsReq);
      case 'OfficialDynamics': return this.officialDynamics(ctx, request as $0.OfficialDynamicsReq);
      case 'CampusRedDot': return this.campusRedDot(ctx, request as $0.CampusRedDotReq);
      case 'CampusRcmdFeed': return this.campusRcmdFeed(ctx, request as $0.CampusRcmdFeedReq);
      case 'TopicSquare': return this.topicSquare(ctx, request as $0.TopicSquareReq);
      case 'TopicList': return this.topicList(ctx, request as $0.TopicListReq);
      case 'CampusMateLikeList': return this.campusMateLikeList(ctx, request as $0.CampusMateLikeListReq);
      case 'CampusFeedback': return this.campusFeedback(ctx, request as $0.CampusFeedbackReq);
      case 'CampusBillboard': return this.campusBillboard(ctx, request as $0.CampusBillBoardReq);
      case 'CampusBillboardInternal': return this.campusBillboardInternal(ctx, request as $0.CampusBillboardInternalReq);
      case 'CampusTopicRcmdFeed': return this.campusTopicRcmdFeed(ctx, request as $0.CampusTopicRcmdFeedReq);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => DynamicServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => DynamicServiceBase$messageJson;
}

