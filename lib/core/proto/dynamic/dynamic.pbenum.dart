///
//  Generated code. Do not modify.
//  source: dynamic.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AddButtonBgStyle extends $pb.ProtobufEnum {
  static const AddButtonBgStyle fill = AddButtonBgStyle._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'fill');
  static const AddButtonBgStyle stroke = AddButtonBgStyle._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'stroke');
  static const AddButtonBgStyle gray = AddButtonBgStyle._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'gray');

  static const $core.List<AddButtonBgStyle> values = <AddButtonBgStyle> [
    fill,
    stroke,
    gray,
  ];

  static final $core.Map<$core.int, AddButtonBgStyle> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AddButtonBgStyle? valueOf($core.int value) => _byValue[value];

  const AddButtonBgStyle._($core.int v, $core.String n) : super(v, n);
}

class AddButtonType extends $pb.ProtobufEnum {
  static const AddButtonType bt_none = AddButtonType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'bt_none');
  static const AddButtonType bt_jump = AddButtonType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'bt_jump');
  static const AddButtonType bt_button = AddButtonType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'bt_button');

  static const $core.List<AddButtonType> values = <AddButtonType> [
    bt_none,
    bt_jump,
    bt_button,
  ];

  static final $core.Map<$core.int, AddButtonType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AddButtonType? valueOf($core.int value) => _byValue[value];

  const AddButtonType._($core.int v, $core.String n) : super(v, n);
}

class AdditionVoteState extends $pb.ProtobufEnum {
  static const AdditionVoteState addition_vote_state_none = AdditionVoteState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'addition_vote_state_none');
  static const AdditionVoteState addition_vote_state_open = AdditionVoteState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'addition_vote_state_open');
  static const AdditionVoteState addition_vote_state_close = AdditionVoteState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'addition_vote_state_close');

  static const $core.List<AdditionVoteState> values = <AdditionVoteState> [
    addition_vote_state_none,
    addition_vote_state_open,
    addition_vote_state_close,
  ];

  static final $core.Map<$core.int, AdditionVoteState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AdditionVoteState? valueOf($core.int value) => _byValue[value];

  const AdditionVoteState._($core.int v, $core.String n) : super(v, n);
}

class AdditionVoteType extends $pb.ProtobufEnum {
  static const AdditionVoteType addition_vote_type_none = AdditionVoteType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'addition_vote_type_none');
  static const AdditionVoteType addition_vote_type_word = AdditionVoteType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'addition_vote_type_word');
  static const AdditionVoteType addition_vote_type_pic = AdditionVoteType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'addition_vote_type_pic');
  static const AdditionVoteType addition_vote_type_default = AdditionVoteType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'addition_vote_type_default');

  static const $core.List<AdditionVoteType> values = <AdditionVoteType> [
    addition_vote_type_none,
    addition_vote_type_word,
    addition_vote_type_pic,
    addition_vote_type_default,
  ];

  static final $core.Map<$core.int, AdditionVoteType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AdditionVoteType? valueOf($core.int value) => _byValue[value];

  const AdditionVoteType._($core.int v, $core.String n) : super(v, n);
}

class AdditionalButtonClickType extends $pb.ProtobufEnum {
  static const AdditionalButtonClickType click_none = AdditionalButtonClickType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'click_none');
  static const AdditionalButtonClickType click_up = AdditionalButtonClickType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'click_up');

  static const $core.List<AdditionalButtonClickType> values = <AdditionalButtonClickType> [
    click_none,
    click_up,
  ];

  static final $core.Map<$core.int, AdditionalButtonClickType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AdditionalButtonClickType? valueOf($core.int value) => _byValue[value];

  const AdditionalButtonClickType._($core.int v, $core.String n) : super(v, n);
}

class AdditionalButtonStatus extends $pb.ProtobufEnum {
  static const AdditionalButtonStatus none = AdditionalButtonStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'none');
  static const AdditionalButtonStatus uncheck = AdditionalButtonStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'uncheck');
  static const AdditionalButtonStatus check = AdditionalButtonStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'check');

  static const $core.List<AdditionalButtonStatus> values = <AdditionalButtonStatus> [
    none,
    uncheck,
    check,
  ];

  static final $core.Map<$core.int, AdditionalButtonStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AdditionalButtonStatus? valueOf($core.int value) => _byValue[value];

  const AdditionalButtonStatus._($core.int v, $core.String n) : super(v, n);
}

class AdditionalShareShowType extends $pb.ProtobufEnum {
  static const AdditionalShareShowType st_none = AdditionalShareShowType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'st_none');
  static const AdditionalShareShowType st_show = AdditionalShareShowType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'st_show');

  static const $core.List<AdditionalShareShowType> values = <AdditionalShareShowType> [
    st_none,
    st_show,
  ];

  static final $core.Map<$core.int, AdditionalShareShowType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AdditionalShareShowType? valueOf($core.int value) => _byValue[value];

  const AdditionalShareShowType._($core.int v, $core.String n) : super(v, n);
}

class AdditionalType extends $pb.ProtobufEnum {
  static const AdditionalType additional_none = AdditionalType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'additional_none');
  static const AdditionalType additional_type_pgc = AdditionalType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'additional_type_pgc');
  static const AdditionalType additional_type_goods = AdditionalType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'additional_type_goods');
  static const AdditionalType additional_type_vote = AdditionalType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'additional_type_vote');
  static const AdditionalType additional_type_common = AdditionalType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'additional_type_common');
  static const AdditionalType additional_type_esport = AdditionalType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'additional_type_esport');
  static const AdditionalType additional_type_up_rcmd = AdditionalType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'additional_type_up_rcmd');
  static const AdditionalType additional_type_ugc = AdditionalType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'additional_type_ugc');
  static const AdditionalType additional_type_up_reservation = AdditionalType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'additional_type_up_reservation');

  static const $core.List<AdditionalType> values = <AdditionalType> [
    additional_none,
    additional_type_pgc,
    additional_type_goods,
    additional_type_vote,
    additional_type_common,
    additional_type_esport,
    additional_type_up_rcmd,
    additional_type_ugc,
    additional_type_up_reservation,
  ];

  static final $core.Map<$core.int, AdditionalType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AdditionalType? valueOf($core.int value) => _byValue[value];

  const AdditionalType._($core.int v, $core.String n) : super(v, n);
}

class CampusTabType extends $pb.ProtobufEnum {
  static const CampusTabType campus_none = CampusTabType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'campus_none');
  static const CampusTabType campus_school = CampusTabType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'campus_school');
  static const CampusTabType campus_dynamic = CampusTabType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'campus_dynamic');
  static const CampusTabType campus_account = CampusTabType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'campus_account');
  static const CampusTabType campus_billboard = CampusTabType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'campus_billboard');
  static const CampusTabType campus_topic = CampusTabType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'campus_topic');

  static const $core.List<CampusTabType> values = <CampusTabType> [
    campus_none,
    campus_school,
    campus_dynamic,
    campus_account,
    campus_billboard,
    campus_topic,
  ];

  static final $core.Map<$core.int, CampusTabType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CampusTabType? valueOf($core.int value) => _byValue[value];

  const CampusTabType._($core.int v, $core.String n) : super(v, n);
}

class CoverIcon extends $pb.ProtobufEnum {
  static const CoverIcon cover_icon_none = CoverIcon._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cover_icon_none');
  static const CoverIcon cover_icon_play = CoverIcon._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cover_icon_play');

  static const $core.List<CoverIcon> values = <CoverIcon> [
    cover_icon_none,
    cover_icon_play,
  ];

  static final $core.Map<$core.int, CoverIcon> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CoverIcon? valueOf($core.int value) => _byValue[value];

  const CoverIcon._($core.int v, $core.String n) : super(v, n);
}

class DescType extends $pb.ProtobufEnum {
  static const DescType desc_type_none = DescType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_none');
  static const DescType desc_type_text = DescType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_text');
  static const DescType desc_type_aite = DescType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_aite');
  static const DescType desc_type_lottery = DescType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_lottery');
  static const DescType desc_type_vote = DescType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_vote');
  static const DescType desc_type_topic = DescType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_topic');
  static const DescType desc_type_goods = DescType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_goods');
  static const DescType desc_type_bv = DescType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_bv');
  static const DescType desc_type_av = DescType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_av');
  static const DescType desc_type_emoji = DescType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_emoji');
  static const DescType desc_type_user = DescType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_user');
  static const DescType desc_type_cv = DescType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_cv');
  static const DescType desc_type_vc = DescType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_vc');
  static const DescType desc_type_web = DescType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_web');
  static const DescType desc_type_taobao = DescType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_taobao');
  static const DescType desc_type_mail = DescType._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_mail');
  static const DescType desc_type_ogv_season = DescType._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_ogv_season');
  static const DescType desc_type_ogv_ep = DescType._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_ogv_ep');
  static const DescType desc_type_search_word = DescType._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'desc_type_search_word');

  static const $core.List<DescType> values = <DescType> [
    desc_type_none,
    desc_type_text,
    desc_type_aite,
    desc_type_lottery,
    desc_type_vote,
    desc_type_topic,
    desc_type_goods,
    desc_type_bv,
    desc_type_av,
    desc_type_emoji,
    desc_type_user,
    desc_type_cv,
    desc_type_vc,
    desc_type_web,
    desc_type_taobao,
    desc_type_mail,
    desc_type_ogv_season,
    desc_type_ogv_ep,
    desc_type_search_word,
  ];

  static final $core.Map<$core.int, DescType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DescType? valueOf($core.int value) => _byValue[value];

  const DescType._($core.int v, $core.String n) : super(v, n);
}

class DisableState extends $pb.ProtobufEnum {
  static const DisableState highlight = DisableState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'highlight');
  static const DisableState gary = DisableState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'gary');

  static const $core.List<DisableState> values = <DisableState> [
    highlight,
    gary,
  ];

  static final $core.Map<$core.int, DisableState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DisableState? valueOf($core.int value) => _byValue[value];

  const DisableState._($core.int v, $core.String n) : super(v, n);
}

class DynExtendType extends $pb.ProtobufEnum {
  static const DynExtendType dyn_ext_type_none = DynExtendType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_ext_type_none');
  static const DynExtendType dyn_ext_type_topic = DynExtendType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_ext_type_topic');
  static const DynExtendType dyn_ext_type_lbs = DynExtendType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_ext_type_lbs');
  static const DynExtendType dyn_ext_type_hot = DynExtendType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_ext_type_hot');
  static const DynExtendType dyn_ext_type_game = DynExtendType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_ext_type_game');
  static const DynExtendType dyn_ext_type_common = DynExtendType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_ext_type_common');
  static const DynExtendType dyn_ext_type_biliCut = DynExtendType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_ext_type_biliCut');
  static const DynExtendType dyn_ext_type_ogv = DynExtendType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_ext_type_ogv');
  static const DynExtendType dyn_ext_type_auto_ogv = DynExtendType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_ext_type_auto_ogv');

  static const $core.List<DynExtendType> values = <DynExtendType> [
    dyn_ext_type_none,
    dyn_ext_type_topic,
    dyn_ext_type_lbs,
    dyn_ext_type_hot,
    dyn_ext_type_game,
    dyn_ext_type_common,
    dyn_ext_type_biliCut,
    dyn_ext_type_ogv,
    dyn_ext_type_auto_ogv,
  ];

  static final $core.Map<$core.int, DynExtendType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DynExtendType? valueOf($core.int value) => _byValue[value];

  const DynExtendType._($core.int v, $core.String n) : super(v, n);
}

class DynModuleType extends $pb.ProtobufEnum {
  static const DynModuleType module_none = DynModuleType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_none');
  static const DynModuleType module_author = DynModuleType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_author');
  static const DynModuleType module_dispute = DynModuleType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_dispute');
  static const DynModuleType module_desc = DynModuleType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_desc');
  static const DynModuleType module_dynamic = DynModuleType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_dynamic');
  static const DynModuleType module_forward = DynModuleType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_forward');
  static const DynModuleType module_likeUser = DynModuleType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_likeUser');
  static const DynModuleType module_extend = DynModuleType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_extend');
  static const DynModuleType module_additional = DynModuleType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_additional');
  static const DynModuleType module_stat = DynModuleType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_stat');
  static const DynModuleType module_fold = DynModuleType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_fold');
  static const DynModuleType module_comment = DynModuleType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_comment');
  static const DynModuleType module_interaction = DynModuleType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_interaction');
  static const DynModuleType module_author_forward = DynModuleType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_author_forward');
  static const DynModuleType module_ad = DynModuleType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_ad');
  static const DynModuleType module_banner = DynModuleType._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_banner');
  static const DynModuleType module_item_null = DynModuleType._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_item_null');
  static const DynModuleType module_share_info = DynModuleType._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_share_info');
  static const DynModuleType module_recommend = DynModuleType._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_recommend');
  static const DynModuleType module_stat_forward = DynModuleType._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_stat_forward');
  static const DynModuleType module_top = DynModuleType._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_top');
  static const DynModuleType module_bottom = DynModuleType._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_bottom');
  static const DynModuleType module_story = DynModuleType._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_story');
  static const DynModuleType module_topic = DynModuleType._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_topic');
  static const DynModuleType module_topic_details_ext = DynModuleType._(24, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_topic_details_ext');
  static const DynModuleType module_top_tag = DynModuleType._(25, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_top_tag');
  static const DynModuleType module_topic_brief = DynModuleType._(26, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_topic_brief');
  static const DynModuleType module_title = DynModuleType._(27, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_title');

  static const $core.List<DynModuleType> values = <DynModuleType> [
    module_none,
    module_author,
    module_dispute,
    module_desc,
    module_dynamic,
    module_forward,
    module_likeUser,
    module_extend,
    module_additional,
    module_stat,
    module_fold,
    module_comment,
    module_interaction,
    module_author_forward,
    module_ad,
    module_banner,
    module_item_null,
    module_share_info,
    module_recommend,
    module_stat_forward,
    module_top,
    module_bottom,
    module_story,
    module_topic,
    module_topic_details_ext,
    module_top_tag,
    module_topic_brief,
    module_title,
  ];

  static final $core.Map<$core.int, DynModuleType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DynModuleType? valueOf($core.int value) => _byValue[value];

  const DynModuleType._($core.int v, $core.String n) : super(v, n);
}

class DynUriType extends $pb.ProtobufEnum {
  static const DynUriType dyn_uri_type_none = DynUriType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_uri_type_none');
  static const DynUriType dyn_uri_type_direct = DynUriType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_uri_type_direct');
  static const DynUriType dyn_uri_type_suffix = DynUriType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_uri_type_suffix');

  static const $core.List<DynUriType> values = <DynUriType> [
    dyn_uri_type_none,
    dyn_uri_type_direct,
    dyn_uri_type_suffix,
  ];

  static final $core.Map<$core.int, DynUriType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DynUriType? valueOf($core.int value) => _byValue[value];

  const DynUriType._($core.int v, $core.String n) : super(v, n);
}

class DynamicType extends $pb.ProtobufEnum {
  static const DynamicType dyn_none = DynamicType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dyn_none');
  static const DynamicType forward = DynamicType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'forward');
  static const DynamicType av = DynamicType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'av');
  static const DynamicType pgc = DynamicType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'pgc');
  static const DynamicType courses = DynamicType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'courses');
  static const DynamicType fold = DynamicType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'fold');
  static const DynamicType word = DynamicType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'word');
  static const DynamicType draw = DynamicType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'draw');
  static const DynamicType article = DynamicType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'article');
  static const DynamicType music = DynamicType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'music');
  static const DynamicType common_square = DynamicType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'common_square');
  static const DynamicType common_vertical = DynamicType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'common_vertical');
  static const DynamicType live = DynamicType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'live');
  static const DynamicType medialist = DynamicType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'medialist');
  static const DynamicType courses_season = DynamicType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'courses_season');
  static const DynamicType ad = DynamicType._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ad');
  static const DynamicType applet = DynamicType._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'applet');
  static const DynamicType subscription = DynamicType._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'subscription');
  static const DynamicType live_rcmd = DynamicType._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'live_rcmd');
  static const DynamicType banner = DynamicType._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'banner');
  static const DynamicType ugc_season = DynamicType._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ugc_season');
  static const DynamicType subscription_new = DynamicType._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'subscription_new');
  static const DynamicType story = DynamicType._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'story');
  static const DynamicType topic_rcmd = DynamicType._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'topic_rcmd');

  static const $core.List<DynamicType> values = <DynamicType> [
    dyn_none,
    forward,
    av,
    pgc,
    courses,
    fold,
    word,
    draw,
    article,
    music,
    common_square,
    common_vertical,
    live,
    medialist,
    courses_season,
    ad,
    applet,
    subscription,
    live_rcmd,
    banner,
    ugc_season,
    subscription_new,
    story,
    topic_rcmd,
  ];

  static final $core.Map<$core.int, DynamicType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DynamicType? valueOf($core.int value) => _byValue[value];

  const DynamicType._($core.int v, $core.String n) : super(v, n);
}

class EmojiType extends $pb.ProtobufEnum {
  static const EmojiType emoji_none = EmojiType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'emoji_none');
  static const EmojiType emoji_old = EmojiType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'emoji_old');
  static const EmojiType emoji_new = EmojiType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'emoji_new');
  static const EmojiType vip = EmojiType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'vip');

  static const $core.List<EmojiType> values = <EmojiType> [
    emoji_none,
    emoji_old,
    emoji_new,
    vip,
  ];

  static final $core.Map<$core.int, EmojiType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EmojiType? valueOf($core.int value) => _byValue[value];

  const EmojiType._($core.int v, $core.String n) : super(v, n);
}

class EspaceStyle extends $pb.ProtobufEnum {
  static const EspaceStyle moba = EspaceStyle._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'moba');

  static const $core.List<EspaceStyle> values = <EspaceStyle> [
    moba,
  ];

  static final $core.Map<$core.int, EspaceStyle> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EspaceStyle? valueOf($core.int value) => _byValue[value];

  const EspaceStyle._($core.int v, $core.String n) : super(v, n);
}

class FoldType extends $pb.ProtobufEnum {
  static const FoldType FoldTypeZore = FoldType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FoldTypeZore');
  static const FoldType FoldTypePublish = FoldType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FoldTypePublish');
  static const FoldType FoldTypeFrequent = FoldType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FoldTypeFrequent');
  static const FoldType FoldTypeUnite = FoldType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FoldTypeUnite');
  static const FoldType FoldTypeLimit = FoldType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FoldTypeLimit');

  static const $core.List<FoldType> values = <FoldType> [
    FoldTypeZore,
    FoldTypePublish,
    FoldTypeFrequent,
    FoldTypeUnite,
    FoldTypeLimit,
  ];

  static final $core.Map<$core.int, FoldType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FoldType? valueOf($core.int value) => _byValue[value];

  const FoldType._($core.int v, $core.String n) : super(v, n);
}

class FollowType extends $pb.ProtobufEnum {
  static const FollowType ft_not_follow = FollowType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ft_not_follow');
  static const FollowType ft_follow = FollowType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ft_follow');

  static const $core.List<FollowType> values = <FollowType> [
    ft_not_follow,
    ft_follow,
  ];

  static final $core.Map<$core.int, FollowType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FollowType? valueOf($core.int value) => _byValue[value];

  const FollowType._($core.int v, $core.String n) : super(v, n);
}

class HighlightTextStyle extends $pb.ProtobufEnum {
  static const HighlightTextStyle style_none = HighlightTextStyle._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'style_none');
  static const HighlightTextStyle style_highlight = HighlightTextStyle._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'style_highlight');

  static const $core.List<HighlightTextStyle> values = <HighlightTextStyle> [
    style_none,
    style_highlight,
  ];

  static final $core.Map<$core.int, HighlightTextStyle> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HighlightTextStyle? valueOf($core.int value) => _byValue[value];

  const HighlightTextStyle._($core.int v, $core.String n) : super(v, n);
}

class ImageStyle extends $pb.ProtobufEnum {
  static const ImageStyle add_style_vertical = ImageStyle._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'add_style_vertical');
  static const ImageStyle add_style_square = ImageStyle._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'add_style_square');

  static const $core.List<ImageStyle> values = <ImageStyle> [
    add_style_vertical,
    add_style_square,
  ];

  static final $core.Map<$core.int, ImageStyle> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ImageStyle? valueOf($core.int value) => _byValue[value];

  const ImageStyle._($core.int v, $core.String n) : super(v, n);
}

class LightFromType extends $pb.ProtobufEnum {
  static const LightFromType from_login = LightFromType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'from_login');
  static const LightFromType from_unlogin = LightFromType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'from_unlogin');

  static const $core.List<LightFromType> values = <LightFromType> [
    from_login,
    from_unlogin,
  ];

  static final $core.Map<$core.int, LightFromType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LightFromType? valueOf($core.int value) => _byValue[value];

  const LightFromType._($core.int v, $core.String n) : super(v, n);
}

class LiveState extends $pb.ProtobufEnum {
  static const LiveState live_none = LiveState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'live_none');
  static const LiveState live_live = LiveState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'live_live');
  static const LiveState live_rotation = LiveState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'live_rotation');

  static const $core.List<LiveState> values = <LiveState> [
    live_none,
    live_live,
    live_rotation,
  ];

  static final $core.Map<$core.int, LiveState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LiveState? valueOf($core.int value) => _byValue[value];

  const LiveState._($core.int v, $core.String n) : super(v, n);
}

class LocalIconType extends $pb.ProtobufEnum {
  static const LocalIconType local_icon_comment = LocalIconType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'local_icon_comment');
  static const LocalIconType local_icon_like = LocalIconType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'local_icon_like');

  static const $core.List<LocalIconType> values = <LocalIconType> [
    local_icon_comment,
    local_icon_like,
  ];

  static final $core.Map<$core.int, LocalIconType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LocalIconType? valueOf($core.int value) => _byValue[value];

  const LocalIconType._($core.int v, $core.String n) : super(v, n);
}

class MdlDynCommonType extends $pb.ProtobufEnum {
  static const MdlDynCommonType mdl_dyn_common_none = MdlDynCommonType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_common_none');
  static const MdlDynCommonType mdl_dyn_common_square = MdlDynCommonType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_common_square');
  static const MdlDynCommonType mdl_dyn_common_vertica = MdlDynCommonType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_common_vertica');

  static const $core.List<MdlDynCommonType> values = <MdlDynCommonType> [
    mdl_dyn_common_none,
    mdl_dyn_common_square,
    mdl_dyn_common_vertica,
  ];

  static final $core.Map<$core.int, MdlDynCommonType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MdlDynCommonType? valueOf($core.int value) => _byValue[value];

  const MdlDynCommonType._($core.int v, $core.String n) : super(v, n);
}

class MdlDynDrawTagType extends $pb.ProtobufEnum {
  static const MdlDynDrawTagType mdl_draw_tag_none = MdlDynDrawTagType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_draw_tag_none');
  static const MdlDynDrawTagType mdl_draw_tag_common = MdlDynDrawTagType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_draw_tag_common');
  static const MdlDynDrawTagType mdl_draw_tag_goods = MdlDynDrawTagType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_draw_tag_goods');
  static const MdlDynDrawTagType mdl_draw_tag_user = MdlDynDrawTagType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_draw_tag_user');
  static const MdlDynDrawTagType mdl_draw_tag_topic = MdlDynDrawTagType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_draw_tag_topic');
  static const MdlDynDrawTagType mdl_draw_tag_lbs = MdlDynDrawTagType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_draw_tag_lbs');

  static const $core.List<MdlDynDrawTagType> values = <MdlDynDrawTagType> [
    mdl_draw_tag_none,
    mdl_draw_tag_common,
    mdl_draw_tag_goods,
    mdl_draw_tag_user,
    mdl_draw_tag_topic,
    mdl_draw_tag_lbs,
  ];

  static final $core.Map<$core.int, MdlDynDrawTagType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MdlDynDrawTagType? valueOf($core.int value) => _byValue[value];

  const MdlDynDrawTagType._($core.int v, $core.String n) : super(v, n);
}

class MdlDynSubscriptionNewStyle extends $pb.ProtobufEnum {
  static const MdlDynSubscriptionNewStyle mdl_dyn_subscription_new_style_nont = MdlDynSubscriptionNewStyle._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_subscription_new_style_nont');
  static const MdlDynSubscriptionNewStyle mdl_dyn_subscription_new_style_live = MdlDynSubscriptionNewStyle._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_subscription_new_style_live');
  static const MdlDynSubscriptionNewStyle mdl_dyn_subscription_new_style_draw = MdlDynSubscriptionNewStyle._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_subscription_new_style_draw');

  static const $core.List<MdlDynSubscriptionNewStyle> values = <MdlDynSubscriptionNewStyle> [
    mdl_dyn_subscription_new_style_nont,
    mdl_dyn_subscription_new_style_live,
    mdl_dyn_subscription_new_style_draw,
  ];

  static final $core.Map<$core.int, MdlDynSubscriptionNewStyle> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MdlDynSubscriptionNewStyle? valueOf($core.int value) => _byValue[value];

  const MdlDynSubscriptionNewStyle._($core.int v, $core.String n) : super(v, n);
}

class MediaType extends $pb.ProtobufEnum {
  static const MediaType MediaTypeNone = MediaType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MediaTypeNone');
  static const MediaType MediaTypeUGC = MediaType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MediaTypeUGC');
  static const MediaType MediaTypePGC = MediaType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MediaTypePGC');
  static const MediaType MediaTypeLive = MediaType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MediaTypeLive');
  static const MediaType MediaTypeVCS = MediaType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MediaTypeVCS');

  static const $core.List<MediaType> values = <MediaType> [
    MediaTypeNone,
    MediaTypeUGC,
    MediaTypePGC,
    MediaTypeLive,
    MediaTypeVCS,
  ];

  static final $core.Map<$core.int, MediaType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MediaType? valueOf($core.int value) => _byValue[value];

  const MediaType._($core.int v, $core.String n) : super(v, n);
}

class ModuleAuthorBadgeType extends $pb.ProtobufEnum {
  static const ModuleAuthorBadgeType module_author_badge_type_none = ModuleAuthorBadgeType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_author_badge_type_none');
  static const ModuleAuthorBadgeType module_author_badge_type_threePoint = ModuleAuthorBadgeType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_author_badge_type_threePoint');
  static const ModuleAuthorBadgeType module_author_badge_type_button = ModuleAuthorBadgeType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_author_badge_type_button');
  static const ModuleAuthorBadgeType module_author_badge_type_weight = ModuleAuthorBadgeType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_author_badge_type_weight');

  static const $core.List<ModuleAuthorBadgeType> values = <ModuleAuthorBadgeType> [
    module_author_badge_type_none,
    module_author_badge_type_threePoint,
    module_author_badge_type_button,
    module_author_badge_type_weight,
  ];

  static final $core.Map<$core.int, ModuleAuthorBadgeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModuleAuthorBadgeType? valueOf($core.int value) => _byValue[value];

  const ModuleAuthorBadgeType._($core.int v, $core.String n) : super(v, n);
}

class ModuleBannerType extends $pb.ProtobufEnum {
  static const ModuleBannerType module_banner_type_none = ModuleBannerType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_banner_type_none');
  static const ModuleBannerType module_banner_type_user = ModuleBannerType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'module_banner_type_user');

  static const $core.List<ModuleBannerType> values = <ModuleBannerType> [
    module_banner_type_none,
    module_banner_type_user,
  ];

  static final $core.Map<$core.int, ModuleBannerType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModuleBannerType? valueOf($core.int value) => _byValue[value];

  const ModuleBannerType._($core.int v, $core.String n) : super(v, n);
}

class ModuleDynamicType extends $pb.ProtobufEnum {
  static const ModuleDynamicType mdl_dyn_archive = ModuleDynamicType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_archive');
  static const ModuleDynamicType mdl_dyn_pgc = ModuleDynamicType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_pgc');
  static const ModuleDynamicType mdl_dyn_cour_season = ModuleDynamicType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_cour_season');
  static const ModuleDynamicType mdl_dyn_cour_batch = ModuleDynamicType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_cour_batch');
  static const ModuleDynamicType mdl_dyn_forward = ModuleDynamicType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_forward');
  static const ModuleDynamicType mdl_dyn_draw = ModuleDynamicType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_draw');
  static const ModuleDynamicType mdl_dyn_article = ModuleDynamicType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_article');
  static const ModuleDynamicType mdl_dyn_music = ModuleDynamicType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_music');
  static const ModuleDynamicType mdl_dyn_common = ModuleDynamicType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_common');
  static const ModuleDynamicType mdl_dyn_live = ModuleDynamicType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_live');
  static const ModuleDynamicType mdl_dyn_medialist = ModuleDynamicType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_medialist');
  static const ModuleDynamicType mdl_dyn_applet = ModuleDynamicType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_applet');
  static const ModuleDynamicType mdl_dyn_subscription = ModuleDynamicType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_subscription');
  static const ModuleDynamicType mdl_dyn_live_rcmd = ModuleDynamicType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_live_rcmd');
  static const ModuleDynamicType mdl_dyn_ugc_season = ModuleDynamicType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_ugc_season');
  static const ModuleDynamicType mdl_dyn_subscription_new = ModuleDynamicType._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'mdl_dyn_subscription_new');

  static const $core.List<ModuleDynamicType> values = <ModuleDynamicType> [
    mdl_dyn_archive,
    mdl_dyn_pgc,
    mdl_dyn_cour_season,
    mdl_dyn_cour_batch,
    mdl_dyn_forward,
    mdl_dyn_draw,
    mdl_dyn_article,
    mdl_dyn_music,
    mdl_dyn_common,
    mdl_dyn_live,
    mdl_dyn_medialist,
    mdl_dyn_applet,
    mdl_dyn_subscription,
    mdl_dyn_live_rcmd,
    mdl_dyn_ugc_season,
    mdl_dyn_subscription_new,
  ];

  static final $core.Map<$core.int, ModuleDynamicType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModuleDynamicType? valueOf($core.int value) => _byValue[value];

  const ModuleDynamicType._($core.int v, $core.String n) : super(v, n);
}

class NetworkType extends $pb.ProtobufEnum {
  static const NetworkType NT_UNKNOWN = NetworkType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NT_UNKNOWN');
  static const NetworkType WIFI = NetworkType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WIFI');
  static const NetworkType CELLULAR = NetworkType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR');
  static const NetworkType OFFLINE = NetworkType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OFFLINE');
  static const NetworkType OTHERNET = NetworkType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OTHERNET');
  static const NetworkType ETHERNET = NetworkType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ETHERNET');

  static const $core.List<NetworkType> values = <NetworkType> [
    NT_UNKNOWN,
    WIFI,
    CELLULAR,
    OFFLINE,
    OTHERNET,
    ETHERNET,
  ];

  static final $core.Map<$core.int, NetworkType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NetworkType? valueOf($core.int value) => _byValue[value];

  const NetworkType._($core.int v, $core.String n) : super(v, n);
}

class RcmdType extends $pb.ProtobufEnum {
  static const RcmdType rcmd_archive = RcmdType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'rcmd_archive');
  static const RcmdType rcmd_dynamic = RcmdType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'rcmd_dynamic');

  static const $core.List<RcmdType> values = <RcmdType> [
    rcmd_archive,
    rcmd_dynamic,
  ];

  static final $core.Map<$core.int, RcmdType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RcmdType? valueOf($core.int value) => _byValue[value];

  const RcmdType._($core.int v, $core.String n) : super(v, n);
}

class Refresh extends $pb.ProtobufEnum {
  static const Refresh refresh_new = Refresh._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'refresh_new');
  static const Refresh refresh_history = Refresh._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'refresh_history');

  static const $core.List<Refresh> values = <Refresh> [
    refresh_new,
    refresh_history,
  ];

  static final $core.Map<$core.int, Refresh> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Refresh? valueOf($core.int value) => _byValue[value];

  const Refresh._($core.int v, $core.String n) : super(v, n);
}

class RelationStatus extends $pb.ProtobufEnum {
  static const RelationStatus relation_status_none = RelationStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'relation_status_none');
  static const RelationStatus relation_status_nofollow = RelationStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'relation_status_nofollow');
  static const RelationStatus relation_status_follow = RelationStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'relation_status_follow');
  static const RelationStatus relation_status_followed = RelationStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'relation_status_followed');
  static const RelationStatus relation_status_mutual_concern = RelationStatus._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'relation_status_mutual_concern');
  static const RelationStatus relation_status_special = RelationStatus._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'relation_status_special');

  static const $core.List<RelationStatus> values = <RelationStatus> [
    relation_status_none,
    relation_status_nofollow,
    relation_status_follow,
    relation_status_followed,
    relation_status_mutual_concern,
    relation_status_special,
  ];

  static final $core.Map<$core.int, RelationStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RelationStatus? valueOf($core.int value) => _byValue[value];

  const RelationStatus._($core.int v, $core.String n) : super(v, n);
}

class RepostType extends $pb.ProtobufEnum {
  static const RepostType repost_hot = RepostType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'repost_hot');
  static const RepostType repost_general = RepostType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'repost_general');

  static const $core.List<RepostType> values = <RepostType> [
    repost_hot,
    repost_general,
  ];

  static final $core.Map<$core.int, RepostType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RepostType? valueOf($core.int value) => _byValue[value];

  const RepostType._($core.int v, $core.String n) : super(v, n);
}

class ReserveRelationLotteryType extends $pb.ProtobufEnum {
  static const ReserveRelationLotteryType reserve_relation_lottery_type_default = ReserveRelationLotteryType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'reserve_relation_lottery_type_default');
  static const ReserveRelationLotteryType reserve_relation_lottery_type_cron = ReserveRelationLotteryType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'reserve_relation_lottery_type_cron');

  static const $core.List<ReserveRelationLotteryType> values = <ReserveRelationLotteryType> [
    reserve_relation_lottery_type_default,
    reserve_relation_lottery_type_cron,
  ];

  static final $core.Map<$core.int, ReserveRelationLotteryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReserveRelationLotteryType? valueOf($core.int value) => _byValue[value];

  const ReserveRelationLotteryType._($core.int v, $core.String n) : super(v, n);
}

class ReserveType extends $pb.ProtobufEnum {
  static const ReserveType reserve_none = ReserveType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'reserve_none');
  static const ReserveType reserve_recall = ReserveType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'reserve_recall');

  static const $core.List<ReserveType> values = <ReserveType> [
    reserve_none,
    reserve_recall,
  ];

  static final $core.Map<$core.int, ReserveType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReserveType? valueOf($core.int value) => _byValue[value];

  const ReserveType._($core.int v, $core.String n) : super(v, n);
}

class ShowType extends $pb.ProtobufEnum {
  static const ShowType show_type_none = ShowType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'show_type_none');
  static const ShowType show_type_backup = ShowType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'show_type_backup');

  static const $core.List<ShowType> values = <ShowType> [
    show_type_none,
    show_type_backup,
  ];

  static final $core.Map<$core.int, ShowType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ShowType? valueOf($core.int value) => _byValue[value];

  const ShowType._($core.int v, $core.String n) : super(v, n);
}

class StyleType extends $pb.ProtobufEnum {
  static const StyleType STYLE_TYPE_NONE = StyleType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STYLE_TYPE_NONE');
  static const StyleType STYLE_TYPE_LIVE = StyleType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STYLE_TYPE_LIVE');
  static const StyleType STYLE_TYPE_DYN_UP = StyleType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STYLE_TYPE_DYN_UP');

  static const $core.List<StyleType> values = <StyleType> [
    STYLE_TYPE_NONE,
    STYLE_TYPE_LIVE,
    STYLE_TYPE_DYN_UP,
  ];

  static final $core.Map<$core.int, StyleType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StyleType? valueOf($core.int value) => _byValue[value];

  const StyleType._($core.int v, $core.String n) : super(v, n);
}

class TFType extends $pb.ProtobufEnum {
  static const TFType U_CARD = TFType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'U_CARD');
  static const TFType U_PKG = TFType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'U_PKG');
  static const TFType C_CARD = TFType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_CARD');
  static const TFType C_PKG = TFType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C_PKG');
  static const TFType T_CARD = TFType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'T_CARD');
  static const TFType T_PKG = TFType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'T_PKG');

  static const $core.List<TFType> values = <TFType> [
    U_CARD,
    U_PKG,
    C_CARD,
    C_PKG,
    T_CARD,
    T_PKG,
  ];

  static final $core.Map<$core.int, TFType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TFType? valueOf($core.int value) => _byValue[value];

  const TFType._($core.int v, $core.String n) : super(v, n);
}

class ThreePointAttentionStatus extends $pb.ProtobufEnum {
  static const ThreePointAttentionStatus tp_not_attention = ThreePointAttentionStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'tp_not_attention');
  static const ThreePointAttentionStatus tp_attention = ThreePointAttentionStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'tp_attention');

  static const $core.List<ThreePointAttentionStatus> values = <ThreePointAttentionStatus> [
    tp_not_attention,
    tp_attention,
  ];

  static final $core.Map<$core.int, ThreePointAttentionStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ThreePointAttentionStatus? valueOf($core.int value) => _byValue[value];

  const ThreePointAttentionStatus._($core.int v, $core.String n) : super(v, n);
}

class ThreePointType extends $pb.ProtobufEnum {
  static const ThreePointType tp_none = ThreePointType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'tp_none');
  static const ThreePointType background = ThreePointType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'background');
  static const ThreePointType auto_play = ThreePointType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'auto_play');
  static const ThreePointType share = ThreePointType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'share');
  static const ThreePointType wait = ThreePointType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'wait');
  static const ThreePointType attention = ThreePointType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'attention');
  static const ThreePointType report = ThreePointType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'report');
  static const ThreePointType delete = ThreePointType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'delete');
  static const ThreePointType dislike = ThreePointType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'dislike');
  static const ThreePointType favorite = ThreePointType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'favorite');
  static const ThreePointType top = ThreePointType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'top');
  static const ThreePointType comment = ThreePointType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'comment');
  static const ThreePointType hide = ThreePointType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'hide');
  static const ThreePointType campus_delete = ThreePointType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'campus_delete');
  static const ThreePointType topic_irrelevant = ThreePointType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'topic_irrelevant');

  static const $core.List<ThreePointType> values = <ThreePointType> [
    tp_none,
    background,
    auto_play,
    share,
    wait,
    attention,
    report,
    delete,
    dislike,
    favorite,
    top,
    comment,
    hide,
    campus_delete,
    topic_irrelevant,
  ];

  static final $core.Map<$core.int, ThreePointType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ThreePointType? valueOf($core.int value) => _byValue[value];

  const ThreePointType._($core.int v, $core.String n) : super(v, n);
}

class ThumbType extends $pb.ProtobufEnum {
  static const ThumbType cancel = ThumbType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'cancel');
  static const ThumbType thumb = ThumbType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'thumb');

  static const $core.List<ThumbType> values = <ThumbType> [
    cancel,
    thumb,
  ];

  static final $core.Map<$core.int, ThumbType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ThumbType? valueOf($core.int value) => _byValue[value];

  const ThumbType._($core.int v, $core.String n) : super(v, n);
}

class TopType extends $pb.ProtobufEnum {
  static const TopType top_none = TopType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'top_none');
  static const TopType top_cancel = TopType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'top_cancel');

  static const $core.List<TopType> values = <TopType> [
    top_none,
    top_cancel,
  ];

  static final $core.Map<$core.int, TopType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TopType? valueOf($core.int value) => _byValue[value];

  const TopType._($core.int v, $core.String n) : super(v, n);
}

class UserItemType extends $pb.ProtobufEnum {
  static const UserItemType user_item_type_none = UserItemType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'user_item_type_none');
  static const UserItemType user_item_type_live = UserItemType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'user_item_type_live');
  static const UserItemType user_item_type_live_custom = UserItemType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'user_item_type_live_custom');
  static const UserItemType user_item_type_normal = UserItemType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'user_item_type_normal');
  static const UserItemType user_item_type_extend = UserItemType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'user_item_type_extend');

  static const $core.List<UserItemType> values = <UserItemType> [
    user_item_type_none,
    user_item_type_live,
    user_item_type_live_custom,
    user_item_type_normal,
    user_item_type_extend,
  ];

  static final $core.Map<$core.int, UserItemType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserItemType? valueOf($core.int value) => _byValue[value];

  const UserItemType._($core.int v, $core.String n) : super(v, n);
}

class VideoSubType extends $pb.ProtobufEnum {
  static const VideoSubType VideoSubTypeNone = VideoSubType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VideoSubTypeNone');
  static const VideoSubType VideoSubTypeBangumi = VideoSubType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VideoSubTypeBangumi');
  static const VideoSubType VideoSubTypeMovie = VideoSubType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VideoSubTypeMovie');
  static const VideoSubType VideoSubTypeDocumentary = VideoSubType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VideoSubTypeDocumentary');
  static const VideoSubType VideoSubTypeDomestic = VideoSubType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VideoSubTypeDomestic');
  static const VideoSubType VideoSubTypeTeleplay = VideoSubType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VideoSubTypeTeleplay');

  static const $core.List<VideoSubType> values = <VideoSubType> [
    VideoSubTypeNone,
    VideoSubTypeBangumi,
    VideoSubTypeMovie,
    VideoSubTypeDocumentary,
    VideoSubTypeDomestic,
    VideoSubTypeTeleplay,
  ];

  static final $core.Map<$core.int, VideoSubType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VideoSubType? valueOf($core.int value) => _byValue[value];

  const VideoSubType._($core.int v, $core.String n) : super(v, n);
}

class VideoType extends $pb.ProtobufEnum {
  static const VideoType video_type_general = VideoType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'video_type_general');
  static const VideoType video_type_dynamic = VideoType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'video_type_dynamic');
  static const VideoType video_type_playback = VideoType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'video_type_playback');
  static const VideoType video_type_story = VideoType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'video_type_story');

  static const $core.List<VideoType> values = <VideoType> [
    video_type_general,
    video_type_dynamic,
    video_type_playback,
    video_type_story,
  ];

  static final $core.Map<$core.int, VideoType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VideoType? valueOf($core.int value) => _byValue[value];

  const VideoType._($core.int v, $core.String n) : super(v, n);
}

class VoteStatus extends $pb.ProtobufEnum {
  static const VoteStatus normal = VoteStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'normal');
  static const VoteStatus anonymous = VoteStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'anonymous');

  static const $core.List<VoteStatus> values = <VoteStatus> [
    normal,
    anonymous,
  ];

  static final $core.Map<$core.int, VoteStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VoteStatus? valueOf($core.int value) => _byValue[value];

  const VoteStatus._($core.int v, $core.String n) : super(v, n);
}

class WeightType extends $pb.ProtobufEnum {
  static const WeightType weight_none = WeightType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'weight_none');
  static const WeightType weight_dislike = WeightType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'weight_dislike');
  static const WeightType weight_jump = WeightType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'weight_jump');

  static const $core.List<WeightType> values = <WeightType> [
    weight_none,
    weight_dislike,
    weight_jump,
  ];

  static final $core.Map<$core.int, WeightType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WeightType? valueOf($core.int value) => _byValue[value];

  const WeightType._($core.int v, $core.String n) : super(v, n);
}

