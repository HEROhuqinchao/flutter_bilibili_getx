///
//  Generated code. Do not modify.
//  source: dm.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class DMAttrBit extends $pb.ProtobufEnum {
  static const DMAttrBit DMAttrBitProtect = DMAttrBit._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DMAttrBitProtect');
  static const DMAttrBit DMAttrBitFromLive = DMAttrBit._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DMAttrBitFromLive');
  static const DMAttrBit DMAttrHighLike = DMAttrBit._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DMAttrHighLike');

  static const $core.List<DMAttrBit> values = <DMAttrBit>[
    DMAttrBitProtect,
    DMAttrBitFromLive,
    DMAttrHighLike,
  ];

  static final $core.Map<$core.int, DMAttrBit> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static DMAttrBit? valueOf($core.int value) => _byValue[value];

  const DMAttrBit._($core.int v, $core.String n) : super(v, n);
}

class SubtitleType extends $pb.ProtobufEnum {
  static const SubtitleType CC = SubtitleType._(0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CC');
  static const SubtitleType AI = SubtitleType._(1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI');

  static const $core.List<SubtitleType> values = <SubtitleType>[
    CC,
    AI,
  ];

  static final $core.Map<$core.int, SubtitleType> _byValue =
      $pb.ProtobufEnum.initByValue(values);

  static SubtitleType? valueOf($core.int value) => _byValue[value];

  const SubtitleType._($core.int v, $core.String n) : super(v, n);
}
