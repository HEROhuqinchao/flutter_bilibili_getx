///
//  Generated code. Do not modify.
//  source: dm.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use dMAttrBitDescriptor instead')
const DMAttrBit$json = const {
  '1': 'DMAttrBit',
  '2': const [
    const {'1': 'DMAttrBitProtect', '2': 0},
    const {'1': 'DMAttrBitFromLive', '2': 1},
    const {'1': 'DMAttrHighLike', '2': 2},
  ],
};

/// Descriptor for `DMAttrBit`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List dMAttrBitDescriptor = $convert.base64Decode(
    'CglETUF0dHJCaXQSFAoQRE1BdHRyQml0UHJvdGVjdBAAEhUKEURNQXR0ckJpdEZyb21MaXZlEAESEgoORE1BdHRySGlnaExpa2UQAg==');
@$core.Deprecated('Use subtitleTypeDescriptor instead')
const SubtitleType$json = const {
  '1': 'SubtitleType',
  '2': const [
    const {'1': 'CC', '2': 0},
    const {'1': 'AI', '2': 1},
  ],
};

/// Descriptor for `SubtitleType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List subtitleTypeDescriptor =
    $convert.base64Decode('CgxTdWJ0aXRsZVR5cGUSBgoCQ0MQABIGCgJBSRAB');
@$core.Deprecated('Use buzzwordConfigDescriptor instead')
const BuzzwordConfig$json = const {
  '1': 'BuzzwordConfig',
  '2': const [
    const {
      '1': 'keywords',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.BuzzwordShowConfig',
      '10': 'keywords'
    },
  ],
};

/// Descriptor for `BuzzwordConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buzzwordConfigDescriptor = $convert.base64Decode(
    'Cg5CdXp6d29yZENvbmZpZxJQCghrZXl3b3JkcxgBIAMoCzI0LmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkJ1enp3b3JkU2hvd0NvbmZpZ1IIa2V5d29yZHM=');
@$core.Deprecated('Use buzzwordShowConfigDescriptor instead')
const BuzzwordShowConfig$json = const {
  '1': 'BuzzwordShowConfig',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'schema', '3': 2, '4': 1, '5': 9, '10': 'schema'},
    const {'1': 'source', '3': 3, '4': 1, '5': 5, '10': 'source'},
    const {'1': 'id', '3': 4, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'buzzword_id', '3': 5, '4': 1, '5': 3, '10': 'buzzwordId'},
    const {'1': 'schema_type', '3': 6, '4': 1, '5': 5, '10': 'schemaType'},
  ],
};

/// Descriptor for `BuzzwordShowConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buzzwordShowConfigDescriptor = $convert.base64Decode(
    'ChJCdXp6d29yZFNob3dDb25maWcSEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZzY2hlbWEYAiABKAlSBnNjaGVtYRIWCgZzb3VyY2UYAyABKAVSBnNvdXJjZRIOCgJpZBgEIAEoA1ICaWQSHwoLYnV6endvcmRfaWQYBSABKANSCmJ1enp3b3JkSWQSHwoLc2NoZW1hX3R5cGUYBiABKAVSCnNjaGVtYVR5cGU=');
@$core.Deprecated('Use commandDmDescriptor instead')
const CommandDm$json = const {
  '1': 'CommandDm',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'oid', '3': 2, '4': 1, '5': 3, '10': 'oid'},
    const {'1': 'mid', '3': 3, '4': 1, '5': 9, '10': 'mid'},
    const {'1': 'command', '3': 4, '4': 1, '5': 9, '10': 'command'},
    const {'1': 'content', '3': 5, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'progress', '3': 6, '4': 1, '5': 5, '10': 'progress'},
    const {'1': 'ctime', '3': 7, '4': 1, '5': 9, '10': 'ctime'},
    const {'1': 'mtime', '3': 8, '4': 1, '5': 9, '10': 'mtime'},
    const {'1': 'extra', '3': 9, '4': 1, '5': 9, '10': 'extra'},
    const {'1': 'idStr', '3': 10, '4': 1, '5': 9, '10': 'idStr'},
  ],
};

/// Descriptor for `CommandDm`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commandDmDescriptor = $convert.base64Decode(
    'CglDb21tYW5kRG0SDgoCaWQYASABKANSAmlkEhAKA29pZBgCIAEoA1IDb2lkEhAKA21pZBgDIAEoCVIDbWlkEhgKB2NvbW1hbmQYBCABKAlSB2NvbW1hbmQSGAoHY29udGVudBgFIAEoCVIHY29udGVudBIaCghwcm9ncmVzcxgGIAEoBVIIcHJvZ3Jlc3MSFAoFY3RpbWUYByABKAlSBWN0aW1lEhQKBW10aW1lGAggASgJUgVtdGltZRIUCgVleHRyYRgJIAEoCVIFZXh0cmESFAoFaWRTdHIYCiABKAlSBWlkU3Ry');
@$core.Deprecated('Use danmakuAIFlagDescriptor instead')
const DanmakuAIFlag$json = const {
  '1': 'DanmakuAIFlag',
  '2': const [
    const {
      '1': 'dm_flags',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmakuFlag',
      '10': 'dmFlags'
    },
  ],
};

/// Descriptor for `DanmakuAIFlag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmakuAIFlagDescriptor = $convert.base64Decode(
    'Cg1EYW5tYWt1QUlGbGFnEkgKCGRtX2ZsYWdzGAEgAygLMi0uYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRGFubWFrdUZsYWdSB2RtRmxhZ3M=');
@$core.Deprecated('Use danmakuElemDescriptor instead')
const DanmakuElem$json = const {
  '1': 'DanmakuElem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'progress', '3': 2, '4': 1, '5': 5, '10': 'progress'},
    const {'1': 'mode', '3': 3, '4': 1, '5': 5, '10': 'mode'},
    const {'1': 'fontsize', '3': 4, '4': 1, '5': 5, '10': 'fontsize'},
    const {'1': 'color', '3': 5, '4': 1, '5': 13, '10': 'color'},
    const {'1': 'midHash', '3': 6, '4': 1, '5': 9, '10': 'midHash'},
    const {'1': 'content', '3': 7, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'ctime', '3': 8, '4': 1, '5': 3, '10': 'ctime'},
    const {'1': 'weight', '3': 9, '4': 1, '5': 5, '10': 'weight'},
    const {'1': 'action', '3': 10, '4': 1, '5': 9, '10': 'action'},
    const {'1': 'pool', '3': 11, '4': 1, '5': 5, '10': 'pool'},
    const {'1': 'idStr', '3': 12, '4': 1, '5': 9, '10': 'idStr'},
    const {'1': 'attr', '3': 13, '4': 1, '5': 5, '10': 'attr'},
  ],
};

/// Descriptor for `DanmakuElem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmakuElemDescriptor = $convert.base64Decode(
    'CgtEYW5tYWt1RWxlbRIOCgJpZBgBIAEoA1ICaWQSGgoIcHJvZ3Jlc3MYAiABKAVSCHByb2dyZXNzEhIKBG1vZGUYAyABKAVSBG1vZGUSGgoIZm9udHNpemUYBCABKAVSCGZvbnRzaXplEhQKBWNvbG9yGAUgASgNUgVjb2xvchIYCgdtaWRIYXNoGAYgASgJUgdtaWRIYXNoEhgKB2NvbnRlbnQYByABKAlSB2NvbnRlbnQSFAoFY3RpbWUYCCABKANSBWN0aW1lEhYKBndlaWdodBgJIAEoBVIGd2VpZ2h0EhYKBmFjdGlvbhgKIAEoCVIGYWN0aW9uEhIKBHBvb2wYCyABKAVSBHBvb2wSFAoFaWRTdHIYDCABKAlSBWlkU3RyEhIKBGF0dHIYDSABKAVSBGF0dHI=');
@$core.Deprecated('Use danmakuFlagDescriptor instead')
const DanmakuFlag$json = const {
  '1': 'DanmakuFlag',
  '2': const [
    const {'1': 'dmid', '3': 1, '4': 1, '5': 3, '10': 'dmid'},
    const {'1': 'flag', '3': 2, '4': 1, '5': 13, '10': 'flag'},
  ],
};

/// Descriptor for `DanmakuFlag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmakuFlagDescriptor = $convert.base64Decode(
    'CgtEYW5tYWt1RmxhZxISCgRkbWlkGAEgASgDUgRkbWlkEhIKBGZsYWcYAiABKA1SBGZsYWc=');
@$core.Deprecated('Use danmakuFlagConfigDescriptor instead')
const DanmakuFlagConfig$json = const {
  '1': 'DanmakuFlagConfig',
  '2': const [
    const {'1': 'rec_flag', '3': 1, '4': 1, '5': 5, '10': 'recFlag'},
    const {'1': 'rec_text', '3': 2, '4': 1, '5': 9, '10': 'recText'},
    const {'1': 'rec_switch', '3': 3, '4': 1, '5': 5, '10': 'recSwitch'},
  ],
};

/// Descriptor for `DanmakuFlagConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmakuFlagConfigDescriptor = $convert.base64Decode(
    'ChFEYW5tYWt1RmxhZ0NvbmZpZxIZCghyZWNfZmxhZxgBIAEoBVIHcmVjRmxhZxIZCghyZWNfdGV4dBgCIAEoCVIHcmVjVGV4dBIdCgpyZWNfc3dpdGNoGAMgASgFUglyZWNTd2l0Y2g=');
@$core.Deprecated('Use danmuDefaultPlayerConfigDescriptor instead')
const DanmuDefaultPlayerConfig$json = const {
  '1': 'DanmuDefaultPlayerConfig',
  '2': const [
    const {
      '1': 'player_danmaku_use_default_config',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuUseDefaultConfig'
    },
    const {
      '1': 'player_danmaku_ai_recommended_switch',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuAiRecommendedSwitch'
    },
    const {
      '1': 'player_danmaku_ai_recommended_level',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'playerDanmakuAiRecommendedLevel'
    },
    const {
      '1': 'player_danmaku_blocktop',
      '3': 6,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlocktop'
    },
    const {
      '1': 'player_danmaku_blockscroll',
      '3': 7,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlockscroll'
    },
    const {
      '1': 'player_danmaku_blockbottom',
      '3': 8,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlockbottom'
    },
    const {
      '1': 'player_danmaku_blockcolorful',
      '3': 9,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlockcolorful'
    },
    const {
      '1': 'player_danmaku_blockrepeat',
      '3': 10,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlockrepeat'
    },
    const {
      '1': 'player_danmaku_blockspecial',
      '3': 11,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlockspecial'
    },
    const {
      '1': 'player_danmaku_opacity',
      '3': 12,
      '4': 1,
      '5': 2,
      '10': 'playerDanmakuOpacity'
    },
    const {
      '1': 'player_danmaku_scalingfactor',
      '3': 13,
      '4': 1,
      '5': 2,
      '10': 'playerDanmakuScalingfactor'
    },
    const {
      '1': 'player_danmaku_domain',
      '3': 14,
      '4': 1,
      '5': 2,
      '10': 'playerDanmakuDomain'
    },
    const {
      '1': 'player_danmaku_speed',
      '3': 15,
      '4': 1,
      '5': 5,
      '10': 'playerDanmakuSpeed'
    },
    const {
      '1': 'inline_player_danmaku_switch',
      '3': 16,
      '4': 1,
      '5': 8,
      '10': 'inlinePlayerDanmakuSwitch'
    },
    const {
      '1': 'player_danmaku_senior_mode_switch',
      '3': 17,
      '4': 1,
      '5': 5,
      '10': 'playerDanmakuSeniorModeSwitch'
    },
  ],
};

/// Descriptor for `DanmuDefaultPlayerConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmuDefaultPlayerConfigDescriptor =
    $convert.base64Decode(
        'ChhEYW5tdURlZmF1bHRQbGF5ZXJDb25maWcSSAohcGxheWVyX2Rhbm1ha3VfdXNlX2RlZmF1bHRfY29uZmlnGAEgASgIUh1wbGF5ZXJEYW5tYWt1VXNlRGVmYXVsdENvbmZpZxJOCiRwbGF5ZXJfZGFubWFrdV9haV9yZWNvbW1lbmRlZF9zd2l0Y2gYBCABKAhSIHBsYXllckRhbm1ha3VBaVJlY29tbWVuZGVkU3dpdGNoEkwKI3BsYXllcl9kYW5tYWt1X2FpX3JlY29tbWVuZGVkX2xldmVsGAUgASgFUh9wbGF5ZXJEYW5tYWt1QWlSZWNvbW1lbmRlZExldmVsEjYKF3BsYXllcl9kYW5tYWt1X2Jsb2NrdG9wGAYgASgIUhVwbGF5ZXJEYW5tYWt1QmxvY2t0b3ASPAoacGxheWVyX2Rhbm1ha3VfYmxvY2tzY3JvbGwYByABKAhSGHBsYXllckRhbm1ha3VCbG9ja3Njcm9sbBI8ChpwbGF5ZXJfZGFubWFrdV9ibG9ja2JvdHRvbRgIIAEoCFIYcGxheWVyRGFubWFrdUJsb2NrYm90dG9tEkAKHHBsYXllcl9kYW5tYWt1X2Jsb2NrY29sb3JmdWwYCSABKAhSGnBsYXllckRhbm1ha3VCbG9ja2NvbG9yZnVsEjwKGnBsYXllcl9kYW5tYWt1X2Jsb2NrcmVwZWF0GAogASgIUhhwbGF5ZXJEYW5tYWt1QmxvY2tyZXBlYXQSPgobcGxheWVyX2Rhbm1ha3VfYmxvY2tzcGVjaWFsGAsgASgIUhlwbGF5ZXJEYW5tYWt1QmxvY2tzcGVjaWFsEjQKFnBsYXllcl9kYW5tYWt1X29wYWNpdHkYDCABKAJSFHBsYXllckRhbm1ha3VPcGFjaXR5EkAKHHBsYXllcl9kYW5tYWt1X3NjYWxpbmdmYWN0b3IYDSABKAJSGnBsYXllckRhbm1ha3VTY2FsaW5nZmFjdG9yEjIKFXBsYXllcl9kYW5tYWt1X2RvbWFpbhgOIAEoAlITcGxheWVyRGFubWFrdURvbWFpbhIwChRwbGF5ZXJfZGFubWFrdV9zcGVlZBgPIAEoBVIScGxheWVyRGFubWFrdVNwZWVkEj8KHGlubGluZV9wbGF5ZXJfZGFubWFrdV9zd2l0Y2gYECABKAhSGWlubGluZVBsYXllckRhbm1ha3VTd2l0Y2gSSAohcGxheWVyX2Rhbm1ha3Vfc2VuaW9yX21vZGVfc3dpdGNoGBEgASgFUh1wbGF5ZXJEYW5tYWt1U2VuaW9yTW9kZVN3aXRjaA==');
@$core.Deprecated('Use danmuPlayerConfigDescriptor instead')
const DanmuPlayerConfig$json = const {
  '1': 'DanmuPlayerConfig',
  '2': const [
    const {
      '1': 'player_danmaku_switch',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuSwitch'
    },
    const {
      '1': 'player_danmaku_switch_save',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuSwitchSave'
    },
    const {
      '1': 'player_danmaku_use_default_config',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuUseDefaultConfig'
    },
    const {
      '1': 'player_danmaku_ai_recommended_switch',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuAiRecommendedSwitch'
    },
    const {
      '1': 'player_danmaku_ai_recommended_level',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'playerDanmakuAiRecommendedLevel'
    },
    const {
      '1': 'player_danmaku_blocktop',
      '3': 6,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlocktop'
    },
    const {
      '1': 'player_danmaku_blockscroll',
      '3': 7,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlockscroll'
    },
    const {
      '1': 'player_danmaku_blockbottom',
      '3': 8,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlockbottom'
    },
    const {
      '1': 'player_danmaku_blockcolorful',
      '3': 9,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlockcolorful'
    },
    const {
      '1': 'player_danmaku_blockrepeat',
      '3': 10,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlockrepeat'
    },
    const {
      '1': 'player_danmaku_blockspecial',
      '3': 11,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuBlockspecial'
    },
    const {
      '1': 'player_danmaku_opacity',
      '3': 12,
      '4': 1,
      '5': 2,
      '10': 'playerDanmakuOpacity'
    },
    const {
      '1': 'player_danmaku_scalingfactor',
      '3': 13,
      '4': 1,
      '5': 2,
      '10': 'playerDanmakuScalingfactor'
    },
    const {
      '1': 'player_danmaku_domain',
      '3': 14,
      '4': 1,
      '5': 2,
      '10': 'playerDanmakuDomain'
    },
    const {
      '1': 'player_danmaku_speed',
      '3': 15,
      '4': 1,
      '5': 5,
      '10': 'playerDanmakuSpeed'
    },
    const {
      '1': 'player_danmaku_enableblocklist',
      '3': 16,
      '4': 1,
      '5': 8,
      '10': 'playerDanmakuEnableblocklist'
    },
    const {
      '1': 'inline_player_danmaku_switch',
      '3': 17,
      '4': 1,
      '5': 8,
      '10': 'inlinePlayerDanmakuSwitch'
    },
    const {
      '1': 'inline_player_danmaku_config',
      '3': 18,
      '4': 1,
      '5': 5,
      '10': 'inlinePlayerDanmakuConfig'
    },
    const {
      '1': 'player_danmaku_ios_switch_save',
      '3': 19,
      '4': 1,
      '5': 5,
      '10': 'playerDanmakuIosSwitchSave'
    },
    const {
      '1': 'player_danmaku_senior_mode_switch',
      '3': 20,
      '4': 1,
      '5': 5,
      '10': 'playerDanmakuSeniorModeSwitch'
    },
  ],
};

/// Descriptor for `DanmuPlayerConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmuPlayerConfigDescriptor = $convert.base64Decode(
    'ChFEYW5tdVBsYXllckNvbmZpZxIyChVwbGF5ZXJfZGFubWFrdV9zd2l0Y2gYASABKAhSE3BsYXllckRhbm1ha3VTd2l0Y2gSOwoacGxheWVyX2Rhbm1ha3Vfc3dpdGNoX3NhdmUYAiABKAhSF3BsYXllckRhbm1ha3VTd2l0Y2hTYXZlEkgKIXBsYXllcl9kYW5tYWt1X3VzZV9kZWZhdWx0X2NvbmZpZxgDIAEoCFIdcGxheWVyRGFubWFrdVVzZURlZmF1bHRDb25maWcSTgokcGxheWVyX2Rhbm1ha3VfYWlfcmVjb21tZW5kZWRfc3dpdGNoGAQgASgIUiBwbGF5ZXJEYW5tYWt1QWlSZWNvbW1lbmRlZFN3aXRjaBJMCiNwbGF5ZXJfZGFubWFrdV9haV9yZWNvbW1lbmRlZF9sZXZlbBgFIAEoBVIfcGxheWVyRGFubWFrdUFpUmVjb21tZW5kZWRMZXZlbBI2ChdwbGF5ZXJfZGFubWFrdV9ibG9ja3RvcBgGIAEoCFIVcGxheWVyRGFubWFrdUJsb2NrdG9wEjwKGnBsYXllcl9kYW5tYWt1X2Jsb2Nrc2Nyb2xsGAcgASgIUhhwbGF5ZXJEYW5tYWt1QmxvY2tzY3JvbGwSPAoacGxheWVyX2Rhbm1ha3VfYmxvY2tib3R0b20YCCABKAhSGHBsYXllckRhbm1ha3VCbG9ja2JvdHRvbRJAChxwbGF5ZXJfZGFubWFrdV9ibG9ja2NvbG9yZnVsGAkgASgIUhpwbGF5ZXJEYW5tYWt1QmxvY2tjb2xvcmZ1bBI8ChpwbGF5ZXJfZGFubWFrdV9ibG9ja3JlcGVhdBgKIAEoCFIYcGxheWVyRGFubWFrdUJsb2NrcmVwZWF0Ej4KG3BsYXllcl9kYW5tYWt1X2Jsb2Nrc3BlY2lhbBgLIAEoCFIZcGxheWVyRGFubWFrdUJsb2Nrc3BlY2lhbBI0ChZwbGF5ZXJfZGFubWFrdV9vcGFjaXR5GAwgASgCUhRwbGF5ZXJEYW5tYWt1T3BhY2l0eRJAChxwbGF5ZXJfZGFubWFrdV9zY2FsaW5nZmFjdG9yGA0gASgCUhpwbGF5ZXJEYW5tYWt1U2NhbGluZ2ZhY3RvchIyChVwbGF5ZXJfZGFubWFrdV9kb21haW4YDiABKAJSE3BsYXllckRhbm1ha3VEb21haW4SMAoUcGxheWVyX2Rhbm1ha3Vfc3BlZWQYDyABKAVSEnBsYXllckRhbm1ha3VTcGVlZBJECh5wbGF5ZXJfZGFubWFrdV9lbmFibGVibG9ja2xpc3QYECABKAhSHHBsYXllckRhbm1ha3VFbmFibGVibG9ja2xpc3QSPwocaW5saW5lX3BsYXllcl9kYW5tYWt1X3N3aXRjaBgRIAEoCFIZaW5saW5lUGxheWVyRGFubWFrdVN3aXRjaBI/ChxpbmxpbmVfcGxheWVyX2Rhbm1ha3VfY29uZmlnGBIgASgFUhlpbmxpbmVQbGF5ZXJEYW5tYWt1Q29uZmlnEkIKHnBsYXllcl9kYW5tYWt1X2lvc19zd2l0Y2hfc2F2ZRgTIAEoBVIacGxheWVyRGFubWFrdUlvc1N3aXRjaFNhdmUSSAohcGxheWVyX2Rhbm1ha3Vfc2VuaW9yX21vZGVfc3dpdGNoGBQgASgFUh1wbGF5ZXJEYW5tYWt1U2VuaW9yTW9kZVN3aXRjaA==');
@$core.Deprecated('Use danmuPlayerDynamicConfigDescriptor instead')
const DanmuPlayerDynamicConfig$json = const {
  '1': 'DanmuPlayerDynamicConfig',
  '2': const [
    const {'1': 'progress', '3': 1, '4': 1, '5': 5, '10': 'progress'},
    const {
      '1': 'player_danmaku_domain',
      '3': 14,
      '4': 1,
      '5': 2,
      '10': 'playerDanmakuDomain'
    },
  ],
};

/// Descriptor for `DanmuPlayerDynamicConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmuPlayerDynamicConfigDescriptor =
    $convert.base64Decode(
        'ChhEYW5tdVBsYXllckR5bmFtaWNDb25maWcSGgoIcHJvZ3Jlc3MYASABKAVSCHByb2dyZXNzEjIKFXBsYXllcl9kYW5tYWt1X2RvbWFpbhgOIAEoAlITcGxheWVyRGFubWFrdURvbWFpbg==');
@$core.Deprecated('Use danmuPlayerViewConfigDescriptor instead')
const DanmuPlayerViewConfig$json = const {
  '1': 'DanmuPlayerViewConfig',
  '2': const [
    const {
      '1': 'danmuku_default_player_config',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmuDefaultPlayerConfig',
      '10': 'danmukuDefaultPlayerConfig'
    },
    const {
      '1': 'danmuku_player_config',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmuPlayerConfig',
      '10': 'danmukuPlayerConfig'
    },
    const {
      '1': 'danmuku_player_dynamic_config',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmuPlayerDynamicConfig',
      '10': 'danmukuPlayerDynamicConfig'
    },
  ],
};

/// Descriptor for `DanmuPlayerViewConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmuPlayerViewConfigDescriptor = $convert.base64Decode(
    'ChVEYW5tdVBsYXllclZpZXdDb25maWcSfQodZGFubXVrdV9kZWZhdWx0X3BsYXllcl9jb25maWcYASABKAsyOi5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5EYW5tdURlZmF1bHRQbGF5ZXJDb25maWdSGmRhbm11a3VEZWZhdWx0UGxheWVyQ29uZmlnEmcKFWRhbm11a3VfcGxheWVyX2NvbmZpZxgCIAEoCzIzLmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkRhbm11UGxheWVyQ29uZmlnUhNkYW5tdWt1UGxheWVyQ29uZmlnEn0KHWRhbm11a3VfcGxheWVyX2R5bmFtaWNfY29uZmlnGAMgAygLMjouYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRGFubXVQbGF5ZXJEeW5hbWljQ29uZmlnUhpkYW5tdWt1UGxheWVyRHluYW1pY0NvbmZpZw==');
@$core.Deprecated('Use danmuWebPlayerConfigDescriptor instead')
const DanmuWebPlayerConfig$json = const {
  '1': 'DanmuWebPlayerConfig',
  '2': const [
    const {'1': 'dm_switch', '3': 1, '4': 1, '5': 8, '10': 'dmSwitch'},
    const {'1': 'ai_switch', '3': 2, '4': 1, '5': 8, '10': 'aiSwitch'},
    const {'1': 'ai_level', '3': 3, '4': 1, '5': 5, '10': 'aiLevel'},
    const {'1': 'blocktop', '3': 4, '4': 1, '5': 8, '10': 'blocktop'},
    const {'1': 'blockscroll', '3': 5, '4': 1, '5': 8, '10': 'blockscroll'},
    const {'1': 'blockbottom', '3': 6, '4': 1, '5': 8, '10': 'blockbottom'},
    const {'1': 'blockcolor', '3': 7, '4': 1, '5': 8, '10': 'blockcolor'},
    const {'1': 'blockspecial', '3': 8, '4': 1, '5': 8, '10': 'blockspecial'},
    const {'1': 'preventshade', '3': 9, '4': 1, '5': 8, '10': 'preventshade'},
    const {'1': 'dmask', '3': 10, '4': 1, '5': 8, '10': 'dmask'},
    const {'1': 'opacity', '3': 11, '4': 1, '5': 2, '10': 'opacity'},
    const {'1': 'dmarea', '3': 12, '4': 1, '5': 5, '10': 'dmarea'},
    const {'1': 'speedplus', '3': 13, '4': 1, '5': 2, '10': 'speedplus'},
    const {'1': 'fontsize', '3': 14, '4': 1, '5': 2, '10': 'fontsize'},
    const {'1': 'screensync', '3': 15, '4': 1, '5': 8, '10': 'screensync'},
    const {'1': 'speedsync', '3': 16, '4': 1, '5': 8, '10': 'speedsync'},
    const {'1': 'fontfamily', '3': 17, '4': 1, '5': 9, '10': 'fontfamily'},
    const {'1': 'bold', '3': 18, '4': 1, '5': 8, '10': 'bold'},
    const {'1': 'fontborder', '3': 19, '4': 1, '5': 5, '10': 'fontborder'},
    const {'1': 'draw_type', '3': 20, '4': 1, '5': 9, '10': 'drawType'},
    const {
      '1': 'senior_mode_switch',
      '3': 21,
      '4': 1,
      '5': 5,
      '10': 'seniorModeSwitch'
    },
  ],
};

/// Descriptor for `DanmuWebPlayerConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List danmuWebPlayerConfigDescriptor = $convert.base64Decode(
    'ChREYW5tdVdlYlBsYXllckNvbmZpZxIbCglkbV9zd2l0Y2gYASABKAhSCGRtU3dpdGNoEhsKCWFpX3N3aXRjaBgCIAEoCFIIYWlTd2l0Y2gSGQoIYWlfbGV2ZWwYAyABKAVSB2FpTGV2ZWwSGgoIYmxvY2t0b3AYBCABKAhSCGJsb2NrdG9wEiAKC2Jsb2Nrc2Nyb2xsGAUgASgIUgtibG9ja3Njcm9sbBIgCgtibG9ja2JvdHRvbRgGIAEoCFILYmxvY2tib3R0b20SHgoKYmxvY2tjb2xvchgHIAEoCFIKYmxvY2tjb2xvchIiCgxibG9ja3NwZWNpYWwYCCABKAhSDGJsb2Nrc3BlY2lhbBIiCgxwcmV2ZW50c2hhZGUYCSABKAhSDHByZXZlbnRzaGFkZRIUCgVkbWFzaxgKIAEoCFIFZG1hc2sSGAoHb3BhY2l0eRgLIAEoAlIHb3BhY2l0eRIWCgZkbWFyZWEYDCABKAVSBmRtYXJlYRIcCglzcGVlZHBsdXMYDSABKAJSCXNwZWVkcGx1cxIaCghmb250c2l6ZRgOIAEoAlIIZm9udHNpemUSHgoKc2NyZWVuc3luYxgPIAEoCFIKc2NyZWVuc3luYxIcCglzcGVlZHN5bmMYECABKAhSCXNwZWVkc3luYxIeCgpmb250ZmFtaWx5GBEgASgJUgpmb250ZmFtaWx5EhIKBGJvbGQYEiABKAhSBGJvbGQSHgoKZm9udGJvcmRlchgTIAEoBVIKZm9udGJvcmRlchIbCglkcmF3X3R5cGUYFCABKAlSCGRyYXdUeXBlEiwKEnNlbmlvcl9tb2RlX3N3aXRjaBgVIAEoBVIQc2VuaW9yTW9kZVN3aXRjaA==');
@$core.Deprecated('Use dmExpoReportReqDescriptor instead')
const DmExpoReportReq$json = const {
  '1': 'DmExpoReportReq',
  '2': const [
    const {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    const {'1': 'oid', '3': 2, '4': 1, '5': 3, '10': 'oid'},
    const {'1': 'spmid', '3': 4, '4': 1, '5': 9, '10': 'spmid'},
  ],
};

/// Descriptor for `DmExpoReportReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmExpoReportReqDescriptor = $convert.base64Decode(
    'Cg9EbUV4cG9SZXBvcnRSZXESHQoKc2Vzc2lvbl9pZBgBIAEoCVIJc2Vzc2lvbklkEhAKA29pZBgCIAEoA1IDb2lkEhQKBXNwbWlkGAQgASgJUgVzcG1pZA==');
@$core.Deprecated('Use dmExpoReportResDescriptor instead')
const DmExpoReportRes$json = const {
  '1': 'DmExpoReportRes',
};

/// Descriptor for `DmExpoReportRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmExpoReportResDescriptor =
    $convert.base64Decode('Cg9EbUV4cG9SZXBvcnRSZXM=');
@$core.Deprecated('Use dmPlayerConfigReqDescriptor instead')
const DmPlayerConfigReq$json = const {
  '1': 'DmPlayerConfigReq',
  '2': const [
    const {'1': 'ts', '3': 1, '4': 1, '5': 3, '10': 'ts'},
    const {
      '1': 'switch',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuSwitch',
      '10': 'switch'
    },
    const {
      '1': 'switch_save',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuSwitchSave',
      '10': 'switchSave'
    },
    const {
      '1': 'use_default_config',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuUseDefaultConfig',
      '10': 'useDefaultConfig'
    },
    const {
      '1': 'ai_recommended_switch',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuAiRecommendedSwitch',
      '10': 'aiRecommendedSwitch'
    },
    const {
      '1': 'ai_recommended_level',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuAiRecommendedLevel',
      '10': 'aiRecommendedLevel'
    },
    const {
      '1': 'blocktop',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuBlocktop',
      '10': 'blocktop'
    },
    const {
      '1': 'blockscroll',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuBlockscroll',
      '10': 'blockscroll'
    },
    const {
      '1': 'blockbottom',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuBlockbottom',
      '10': 'blockbottom'
    },
    const {
      '1': 'blockcolorful',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuBlockcolorful',
      '10': 'blockcolorful'
    },
    const {
      '1': 'blockrepeat',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuBlockrepeat',
      '10': 'blockrepeat'
    },
    const {
      '1': 'blockspecial',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuBlockspecial',
      '10': 'blockspecial'
    },
    const {
      '1': 'opacity',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuOpacity',
      '10': 'opacity'
    },
    const {
      '1': 'scalingfactor',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuScalingfactor',
      '10': 'scalingfactor'
    },
    const {
      '1': 'domain',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuDomain',
      '10': 'domain'
    },
    const {
      '1': 'speed',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuSpeed',
      '10': 'speed'
    },
    const {
      '1': 'enableblocklist',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuEnableblocklist',
      '10': 'enableblocklist'
    },
    const {
      '1': 'inlinePlayerDanmakuSwitch',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.InlinePlayerDanmakuSwitch',
      '10': 'inlinePlayerDanmakuSwitch'
    },
    const {
      '1': 'senior_mode_switch',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.PlayerDanmakuSeniorModeSwitch',
      '10': 'seniorModeSwitch'
    },
  ],
};

/// Descriptor for `DmPlayerConfigReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmPlayerConfigReqDescriptor = $convert.base64Decode(
    'ChFEbVBsYXllckNvbmZpZ1JlcRIOCgJ0cxgBIAEoA1ICdHMSTQoGc3dpdGNoGAIgASgLMjUuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuUGxheWVyRGFubWFrdVN3aXRjaFIGc3dpdGNoEloKC3N3aXRjaF9zYXZlGAMgASgLMjkuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuUGxheWVyRGFubWFrdVN3aXRjaFNhdmVSCnN3aXRjaFNhdmUSbQoSdXNlX2RlZmF1bHRfY29uZmlnGAQgASgLMj8uYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuUGxheWVyRGFubWFrdVVzZURlZmF1bHRDb25maWdSEHVzZURlZmF1bHRDb25maWcSdgoVYWlfcmVjb21tZW5kZWRfc3dpdGNoGAUgASgLMkIuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuUGxheWVyRGFubWFrdUFpUmVjb21tZW5kZWRTd2l0Y2hSE2FpUmVjb21tZW5kZWRTd2l0Y2gScwoUYWlfcmVjb21tZW5kZWRfbGV2ZWwYBiABKAsyQS5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5QbGF5ZXJEYW5tYWt1QWlSZWNvbW1lbmRlZExldmVsUhJhaVJlY29tbWVuZGVkTGV2ZWwSUwoIYmxvY2t0b3AYByABKAsyNy5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5QbGF5ZXJEYW5tYWt1QmxvY2t0b3BSCGJsb2NrdG9wElwKC2Jsb2Nrc2Nyb2xsGAggASgLMjouYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuUGxheWVyRGFubWFrdUJsb2Nrc2Nyb2xsUgtibG9ja3Njcm9sbBJcCgtibG9ja2JvdHRvbRgJIAEoCzI6LmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLlBsYXllckRhbm1ha3VCbG9ja2JvdHRvbVILYmxvY2tib3R0b20SYgoNYmxvY2tjb2xvcmZ1bBgKIAEoCzI8LmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLlBsYXllckRhbm1ha3VCbG9ja2NvbG9yZnVsUg1ibG9ja2NvbG9yZnVsElwKC2Jsb2NrcmVwZWF0GAsgASgLMjouYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuUGxheWVyRGFubWFrdUJsb2NrcmVwZWF0UgtibG9ja3JlcGVhdBJfCgxibG9ja3NwZWNpYWwYDCABKAsyOy5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5QbGF5ZXJEYW5tYWt1QmxvY2tzcGVjaWFsUgxibG9ja3NwZWNpYWwSUAoHb3BhY2l0eRgNIAEoCzI2LmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLlBsYXllckRhbm1ha3VPcGFjaXR5UgdvcGFjaXR5EmIKDXNjYWxpbmdmYWN0b3IYDiABKAsyPC5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5QbGF5ZXJEYW5tYWt1U2NhbGluZ2ZhY3RvclINc2NhbGluZ2ZhY3RvchJNCgZkb21haW4YDyABKAsyNS5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5QbGF5ZXJEYW5tYWt1RG9tYWluUgZkb21haW4SSgoFc3BlZWQYECABKAsyNC5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5QbGF5ZXJEYW5tYWt1U3BlZWRSBXNwZWVkEmgKD2VuYWJsZWJsb2NrbGlzdBgRIAEoCzI+LmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLlBsYXllckRhbm1ha3VFbmFibGVibG9ja2xpc3RSD2VuYWJsZWJsb2NrbGlzdBJ5ChlpbmxpbmVQbGF5ZXJEYW5tYWt1U3dpdGNoGBIgASgLMjsuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuSW5saW5lUGxheWVyRGFubWFrdVN3aXRjaFIZaW5saW5lUGxheWVyRGFubWFrdVN3aXRjaBJtChJzZW5pb3JfbW9kZV9zd2l0Y2gYEyABKAsyPy5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5QbGF5ZXJEYW5tYWt1U2VuaW9yTW9kZVN3aXRjaFIQc2VuaW9yTW9kZVN3aXRjaA==');
@$core.Deprecated('Use dmSegConfigDescriptor instead')
const DmSegConfig$json = const {
  '1': 'DmSegConfig',
  '2': const [
    const {'1': 'page_size', '3': 1, '4': 1, '5': 3, '10': 'pageSize'},
    const {'1': 'total', '3': 2, '4': 1, '5': 3, '10': 'total'},
  ],
};

/// Descriptor for `DmSegConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmSegConfigDescriptor = $convert.base64Decode(
    'CgtEbVNlZ0NvbmZpZxIbCglwYWdlX3NpemUYASABKANSCHBhZ2VTaXplEhQKBXRvdGFsGAIgASgDUgV0b3RhbA==');
@$core.Deprecated('Use dmSegMobileReplyDescriptor instead')
const DmSegMobileReply$json = const {
  '1': 'DmSegMobileReply',
  '2': const [
    const {
      '1': 'elems',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmakuElem',
      '10': 'elems'
    },
    const {'1': 'state', '3': 2, '4': 1, '5': 5, '10': 'state'},
    const {
      '1': 'ai_flag',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmakuAIFlag',
      '10': 'aiFlag'
    },
  ],
};

/// Descriptor for `DmSegMobileReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmSegMobileReplyDescriptor = $convert.base64Decode(
    'ChBEbVNlZ01vYmlsZVJlcGx5EkMKBWVsZW1zGAEgAygLMi0uYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRGFubWFrdUVsZW1SBWVsZW1zEhQKBXN0YXRlGAIgASgFUgVzdGF0ZRJICgdhaV9mbGFnGAMgASgLMi8uYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRGFubWFrdUFJRmxhZ1IGYWlGbGFn');
@$core.Deprecated('Use dmSegMobileReqDescriptor instead')
const DmSegMobileReq$json = const {
  '1': 'DmSegMobileReq',
  '2': const [
    const {'1': 'pid', '3': 1, '4': 1, '5': 3, '10': 'pid'},
    const {'1': 'oid', '3': 2, '4': 1, '5': 3, '10': 'oid'},
    const {'1': 'type', '3': 3, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'segment_index', '3': 4, '4': 1, '5': 3, '10': 'segmentIndex'},
    const {
      '1': 'teenagers_mode',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'teenagersMode'
    },
  ],
};

/// Descriptor for `DmSegMobileReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmSegMobileReqDescriptor = $convert.base64Decode(
    'Cg5EbVNlZ01vYmlsZVJlcRIQCgNwaWQYASABKANSA3BpZBIQCgNvaWQYAiABKANSA29pZBISCgR0eXBlGAMgASgFUgR0eXBlEiMKDXNlZ21lbnRfaW5kZXgYBCABKANSDHNlZ21lbnRJbmRleBIlCg50ZWVuYWdlcnNfbW9kZRgFIAEoBVINdGVlbmFnZXJzTW9kZQ==');
@$core.Deprecated('Use dmSegOttReplyDescriptor instead')
const DmSegOttReply$json = const {
  '1': 'DmSegOttReply',
  '2': const [
    const {'1': 'closed', '3': 1, '4': 1, '5': 8, '10': 'closed'},
    const {
      '1': 'elems',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmakuElem',
      '10': 'elems'
    },
  ],
};

/// Descriptor for `DmSegOttReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmSegOttReplyDescriptor = $convert.base64Decode(
    'Cg1EbVNlZ090dFJlcGx5EhYKBmNsb3NlZBgBIAEoCFIGY2xvc2VkEkMKBWVsZW1zGAIgAygLMi0uYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRGFubWFrdUVsZW1SBWVsZW1z');
@$core.Deprecated('Use dmSegOttReqDescriptor instead')
const DmSegOttReq$json = const {
  '1': 'DmSegOttReq',
  '2': const [
    const {'1': 'pid', '3': 1, '4': 1, '5': 3, '10': 'pid'},
    const {'1': 'oid', '3': 2, '4': 1, '5': 3, '10': 'oid'},
    const {'1': 'type', '3': 3, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'segment_index', '3': 4, '4': 1, '5': 3, '10': 'segmentIndex'},
  ],
};

/// Descriptor for `DmSegOttReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmSegOttReqDescriptor = $convert.base64Decode(
    'CgtEbVNlZ090dFJlcRIQCgNwaWQYASABKANSA3BpZBIQCgNvaWQYAiABKANSA29pZBISCgR0eXBlGAMgASgFUgR0eXBlEiMKDXNlZ21lbnRfaW5kZXgYBCABKANSDHNlZ21lbnRJbmRleA==');
@$core.Deprecated('Use dmSegSDKReplyDescriptor instead')
const DmSegSDKReply$json = const {
  '1': 'DmSegSDKReply',
  '2': const [
    const {'1': 'closed', '3': 1, '4': 1, '5': 8, '10': 'closed'},
    const {
      '1': 'elems',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmakuElem',
      '10': 'elems'
    },
  ],
};

/// Descriptor for `DmSegSDKReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmSegSDKReplyDescriptor = $convert.base64Decode(
    'Cg1EbVNlZ1NES1JlcGx5EhYKBmNsb3NlZBgBIAEoCFIGY2xvc2VkEkMKBWVsZW1zGAIgAygLMi0uYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRGFubWFrdUVsZW1SBWVsZW1z');
@$core.Deprecated('Use dmSegSDKReqDescriptor instead')
const DmSegSDKReq$json = const {
  '1': 'DmSegSDKReq',
  '2': const [
    const {'1': 'pid', '3': 1, '4': 1, '5': 3, '10': 'pid'},
    const {'1': 'oid', '3': 2, '4': 1, '5': 3, '10': 'oid'},
    const {'1': 'type', '3': 3, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'segment_index', '3': 4, '4': 1, '5': 3, '10': 'segmentIndex'},
  ],
};

/// Descriptor for `DmSegSDKReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmSegSDKReqDescriptor = $convert.base64Decode(
    'CgtEbVNlZ1NES1JlcRIQCgNwaWQYASABKANSA3BpZBIQCgNvaWQYAiABKANSA29pZBISCgR0eXBlGAMgASgFUgR0eXBlEiMKDXNlZ21lbnRfaW5kZXgYBCABKANSDHNlZ21lbnRJbmRleA==');
@$core.Deprecated('Use dmViewReplyDescriptor instead')
const DmViewReply$json = const {
  '1': 'DmViewReply',
  '2': const [
    const {'1': 'closed', '3': 1, '4': 1, '5': 8, '10': 'closed'},
    const {
      '1': 'mask',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.VideoMask',
      '10': 'mask'
    },
    const {
      '1': 'subtitle',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.VideoSubtitle',
      '10': 'subtitle'
    },
    const {'1': 'special_dms', '3': 4, '4': 3, '5': 9, '10': 'specialDms'},
    const {
      '1': 'ai_flag',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmakuFlagConfig',
      '10': 'aiFlag'
    },
    const {
      '1': 'player_config',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmuPlayerViewConfig',
      '10': 'playerConfig'
    },
    const {'1': 'send_box_style', '3': 7, '4': 1, '5': 5, '10': 'sendBoxStyle'},
    const {'1': 'allow', '3': 8, '4': 1, '5': 8, '10': 'allow'},
    const {'1': 'check_box', '3': 9, '4': 1, '5': 9, '10': 'checkBox'},
    const {
      '1': 'check_box_show_msg',
      '3': 10,
      '4': 1,
      '5': 9,
      '10': 'checkBoxShowMsg'
    },
    const {
      '1': 'text_placeholder',
      '3': 11,
      '4': 1,
      '5': 9,
      '10': 'textPlaceholder'
    },
    const {
      '1': 'input_placeholder',
      '3': 12,
      '4': 1,
      '5': 9,
      '10': 'inputPlaceholder'
    },
    const {
      '1': 'report_filter_content',
      '3': 13,
      '4': 3,
      '5': 9,
      '10': 'reportFilterContent'
    },
    const {
      '1': 'expo_report',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.ExpoReport',
      '10': 'expoReport'
    },
    const {
      '1': 'buzzword_config',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.BuzzwordConfig',
      '10': 'buzzwordConfig'
    },
    const {
      '1': 'expressions',
      '3': 16,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.Expressions',
      '10': 'expressions'
    },
  ],
};

/// Descriptor for `DmViewReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmViewReplyDescriptor = $convert.base64Decode(
    'CgtEbVZpZXdSZXBseRIWCgZjbG9zZWQYASABKAhSBmNsb3NlZBI/CgRtYXNrGAIgASgLMisuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuVmlkZW9NYXNrUgRtYXNrEksKCHN1YnRpdGxlGAMgASgLMi8uYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuVmlkZW9TdWJ0aXRsZVIIc3VidGl0bGUSHwoLc3BlY2lhbF9kbXMYBCADKAlSCnNwZWNpYWxEbXMSTAoHYWlfZmxhZxgFIAEoCzIzLmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkRhbm1ha3VGbGFnQ29uZmlnUgZhaUZsYWcSXAoNcGxheWVyX2NvbmZpZxgGIAEoCzI3LmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkRhbm11UGxheWVyVmlld0NvbmZpZ1IMcGxheWVyQ29uZmlnEiQKDnNlbmRfYm94X3N0eWxlGAcgASgFUgxzZW5kQm94U3R5bGUSFAoFYWxsb3cYCCABKAhSBWFsbG93EhsKCWNoZWNrX2JveBgJIAEoCVIIY2hlY2tCb3gSKwoSY2hlY2tfYm94X3Nob3dfbXNnGAogASgJUg9jaGVja0JveFNob3dNc2cSKQoQdGV4dF9wbGFjZWhvbGRlchgLIAEoCVIPdGV4dFBsYWNlaG9sZGVyEisKEWlucHV0X3BsYWNlaG9sZGVyGAwgASgJUhBpbnB1dFBsYWNlaG9sZGVyEjIKFXJlcG9ydF9maWx0ZXJfY29udGVudBgNIAMoCVITcmVwb3J0RmlsdGVyQ29udGVudBJNCgtleHBvX3JlcG9ydBgOIAEoCzIsLmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkV4cG9SZXBvcnRSCmV4cG9SZXBvcnQSWQoPYnV6endvcmRfY29uZmlnGA8gASgLMjAuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuQnV6endvcmRDb25maWdSDmJ1enp3b3JkQ29uZmlnEk8KC2V4cHJlc3Npb25zGBAgAygLMi0uYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRXhwcmVzc2lvbnNSC2V4cHJlc3Npb25z');
@$core.Deprecated('Use dmViewReqDescriptor instead')
const DmViewReq$json = const {
  '1': 'DmViewReq',
  '2': const [
    const {'1': 'pid', '3': 1, '4': 1, '5': 3, '10': 'pid'},
    const {'1': 'oid', '3': 2, '4': 1, '5': 3, '10': 'oid'},
    const {'1': 'type', '3': 3, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'spmid', '3': 4, '4': 1, '5': 9, '10': 'spmid'},
    const {'1': 'is_hard_boot', '3': 5, '4': 1, '5': 5, '10': 'isHardBoot'},
  ],
};

/// Descriptor for `DmViewReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmViewReqDescriptor = $convert.base64Decode(
    'CglEbVZpZXdSZXESEAoDcGlkGAEgASgDUgNwaWQSEAoDb2lkGAIgASgDUgNvaWQSEgoEdHlwZRgDIAEoBVIEdHlwZRIUCgVzcG1pZBgEIAEoCVIFc3BtaWQSIAoMaXNfaGFyZF9ib290GAUgASgFUgppc0hhcmRCb290');
@$core.Deprecated('Use dmWebViewReplyDescriptor instead')
const DmWebViewReply$json = const {
  '1': 'DmWebViewReply',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 5, '10': 'state'},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    const {'1': 'text_side', '3': 3, '4': 1, '5': 9, '10': 'textSide'},
    const {
      '1': 'dm_sge',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DmSegConfig',
      '10': 'dmSge'
    },
    const {
      '1': 'flag',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmakuFlagConfig',
      '10': 'flag'
    },
    const {'1': 'special_dms', '3': 6, '4': 3, '5': 9, '10': 'specialDms'},
    const {'1': 'check_box', '3': 7, '4': 1, '5': 8, '10': 'checkBox'},
    const {'1': 'count', '3': 8, '4': 1, '5': 3, '10': 'count'},
    const {
      '1': 'commandDms',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.CommandDm',
      '10': 'commandDms'
    },
    const {
      '1': 'player_config',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.DanmuWebPlayerConfig',
      '10': 'playerConfig'
    },
    const {
      '1': 'report_filter_content',
      '3': 11,
      '4': 3,
      '5': 9,
      '10': 'reportFilterContent'
    },
    const {
      '1': 'expressions',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.Expressions',
      '10': 'expressions'
    },
  ],
};

/// Descriptor for `DmWebViewReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dmWebViewReplyDescriptor = $convert.base64Decode(
    'Cg5EbVdlYlZpZXdSZXBseRIUCgVzdGF0ZRgBIAEoBVIFc3RhdGUSEgoEdGV4dBgCIAEoCVIEdGV4dBIbCgl0ZXh0X3NpZGUYAyABKAlSCHRleHRTaWRlEkQKBmRtX3NnZRgEIAEoCzItLmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkRtU2VnQ29uZmlnUgVkbVNnZRJHCgRmbGFnGAUgASgLMjMuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRGFubWFrdUZsYWdDb25maWdSBGZsYWcSHwoLc3BlY2lhbF9kbXMYBiADKAlSCnNwZWNpYWxEbXMSGwoJY2hlY2tfYm94GAcgASgIUghjaGVja0JveBIUCgVjb3VudBgIIAEoA1IFY291bnQSSwoKY29tbWFuZERtcxgJIAMoCzIrLmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkNvbW1hbmREbVIKY29tbWFuZERtcxJbCg1wbGF5ZXJfY29uZmlnGAogASgLMjYuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRGFubXVXZWJQbGF5ZXJDb25maWdSDHBsYXllckNvbmZpZxIyChVyZXBvcnRfZmlsdGVyX2NvbnRlbnQYCyADKAlSE3JlcG9ydEZpbHRlckNvbnRlbnQSTwoLZXhwcmVzc2lvbnMYDCADKAsyLS5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5FeHByZXNzaW9uc1ILZXhwcmVzc2lvbnM=');
@$core.Deprecated('Use expoReportDescriptor instead')
const ExpoReport$json = const {
  '1': 'ExpoReport',
  '2': const [
    const {
      '1': 'should_report_at_end',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'shouldReportAtEnd'
    },
  ],
};

/// Descriptor for `ExpoReport`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List expoReportDescriptor = $convert.base64Decode(
    'CgpFeHBvUmVwb3J0Ei8KFHNob3VsZF9yZXBvcnRfYXRfZW5kGAEgASgIUhFzaG91bGRSZXBvcnRBdEVuZA==');
@$core.Deprecated('Use expressionDescriptor instead')
const Expression$json = const {
  '1': 'Expression',
  '2': const [
    const {'1': 'keyword', '3': 1, '4': 3, '5': 9, '10': 'keyword'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    const {
      '1': 'period',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.Period',
      '10': 'period'
    },
  ],
};

/// Descriptor for `Expression`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List expressionDescriptor = $convert.base64Decode(
    'CgpFeHByZXNzaW9uEhgKB2tleXdvcmQYASADKAlSB2tleXdvcmQSEAoDdXJsGAIgASgJUgN1cmwSQAoGcGVyaW9kGAMgAygLMiguYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuUGVyaW9kUgZwZXJpb2Q=');
@$core.Deprecated('Use expressionsDescriptor instead')
const Expressions$json = const {
  '1': 'Expressions',
  '2': const [
    const {
      '1': 'data',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.Expression',
      '10': 'data'
    },
  ],
};

/// Descriptor for `Expressions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List expressionsDescriptor = $convert.base64Decode(
    'CgtFeHByZXNzaW9ucxJACgRkYXRhGAEgAygLMiwuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRXhwcmVzc2lvblIEZGF0YQ==');
@$core.Deprecated('Use periodDescriptor instead')
const Period$json = const {
  '1': 'Period',
  '2': const [
    const {'1': 'start', '3': 1, '4': 1, '5': 3, '10': 'start'},
    const {'1': 'end', '3': 2, '4': 1, '5': 3, '10': 'end'},
  ],
};

/// Descriptor for `Period`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List periodDescriptor = $convert.base64Decode(
    'CgZQZXJpb2QSFAoFc3RhcnQYASABKANSBXN0YXJ0EhAKA2VuZBgCIAEoA1IDZW5k');
@$core.Deprecated('Use inlinePlayerDanmakuSwitchDescriptor instead')
const InlinePlayerDanmakuSwitch$json = const {
  '1': 'InlinePlayerDanmakuSwitch',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `InlinePlayerDanmakuSwitch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inlinePlayerDanmakuSwitchDescriptor =
    $convert.base64Decode(
        'ChlJbmxpbmVQbGF5ZXJEYW5tYWt1U3dpdGNoEhQKBXZhbHVlGAEgASgIUgV2YWx1ZQ==');
@$core.Deprecated('Use playerDanmakuAiRecommendedLevelDescriptor instead')
const PlayerDanmakuAiRecommendedLevel$json = const {
  '1': 'PlayerDanmakuAiRecommendedLevel',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuAiRecommendedLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuAiRecommendedLevelDescriptor =
    $convert.base64Decode(
        'Ch9QbGF5ZXJEYW5tYWt1QWlSZWNvbW1lbmRlZExldmVsEhQKBXZhbHVlGAEgASgIUgV2YWx1ZQ==');
@$core.Deprecated('Use playerDanmakuAiRecommendedSwitchDescriptor instead')
const PlayerDanmakuAiRecommendedSwitch$json = const {
  '1': 'PlayerDanmakuAiRecommendedSwitch',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuAiRecommendedSwitch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuAiRecommendedSwitchDescriptor =
    $convert.base64Decode(
        'CiBQbGF5ZXJEYW5tYWt1QWlSZWNvbW1lbmRlZFN3aXRjaBIUCgV2YWx1ZRgBIAEoCFIFdmFsdWU=');
@$core.Deprecated('Use playerDanmakuBlockbottomDescriptor instead')
const PlayerDanmakuBlockbottom$json = const {
  '1': 'PlayerDanmakuBlockbottom',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuBlockbottom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuBlockbottomDescriptor =
    $convert.base64Decode(
        'ChhQbGF5ZXJEYW5tYWt1QmxvY2tib3R0b20SFAoFdmFsdWUYASABKAhSBXZhbHVl');
@$core.Deprecated('Use playerDanmakuBlockcolorfulDescriptor instead')
const PlayerDanmakuBlockcolorful$json = const {
  '1': 'PlayerDanmakuBlockcolorful',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuBlockcolorful`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuBlockcolorfulDescriptor =
    $convert.base64Decode(
        'ChpQbGF5ZXJEYW5tYWt1QmxvY2tjb2xvcmZ1bBIUCgV2YWx1ZRgBIAEoCFIFdmFsdWU=');
@$core.Deprecated('Use playerDanmakuBlockrepeatDescriptor instead')
const PlayerDanmakuBlockrepeat$json = const {
  '1': 'PlayerDanmakuBlockrepeat',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuBlockrepeat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuBlockrepeatDescriptor =
    $convert.base64Decode(
        'ChhQbGF5ZXJEYW5tYWt1QmxvY2tyZXBlYXQSFAoFdmFsdWUYASABKAhSBXZhbHVl');
@$core.Deprecated('Use playerDanmakuBlockscrollDescriptor instead')
const PlayerDanmakuBlockscroll$json = const {
  '1': 'PlayerDanmakuBlockscroll',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuBlockscroll`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuBlockscrollDescriptor =
    $convert.base64Decode(
        'ChhQbGF5ZXJEYW5tYWt1QmxvY2tzY3JvbGwSFAoFdmFsdWUYASABKAhSBXZhbHVl');
@$core.Deprecated('Use playerDanmakuBlockspecialDescriptor instead')
const PlayerDanmakuBlockspecial$json = const {
  '1': 'PlayerDanmakuBlockspecial',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuBlockspecial`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuBlockspecialDescriptor =
    $convert.base64Decode(
        'ChlQbGF5ZXJEYW5tYWt1QmxvY2tzcGVjaWFsEhQKBXZhbHVlGAEgASgIUgV2YWx1ZQ==');
@$core.Deprecated('Use playerDanmakuBlocktopDescriptor instead')
const PlayerDanmakuBlocktop$json = const {
  '1': 'PlayerDanmakuBlocktop',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuBlocktop`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuBlocktopDescriptor =
    $convert.base64Decode(
        'ChVQbGF5ZXJEYW5tYWt1QmxvY2t0b3ASFAoFdmFsdWUYASABKAhSBXZhbHVl');
@$core.Deprecated('Use playerDanmakuDomainDescriptor instead')
const PlayerDanmakuDomain$json = const {
  '1': 'PlayerDanmakuDomain',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 2, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuDomain`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuDomainDescriptor =
    $convert.base64Decode(
        'ChNQbGF5ZXJEYW5tYWt1RG9tYWluEhQKBXZhbHVlGAEgASgCUgV2YWx1ZQ==');
@$core.Deprecated('Use playerDanmakuEnableblocklistDescriptor instead')
const PlayerDanmakuEnableblocklist$json = const {
  '1': 'PlayerDanmakuEnableblocklist',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuEnableblocklist`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuEnableblocklistDescriptor =
    $convert.base64Decode(
        'ChxQbGF5ZXJEYW5tYWt1RW5hYmxlYmxvY2tsaXN0EhQKBXZhbHVlGAEgASgIUgV2YWx1ZQ==');
@$core.Deprecated('Use playerDanmakuOpacityDescriptor instead')
const PlayerDanmakuOpacity$json = const {
  '1': 'PlayerDanmakuOpacity',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 2, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuOpacity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuOpacityDescriptor =
    $convert.base64Decode(
        'ChRQbGF5ZXJEYW5tYWt1T3BhY2l0eRIUCgV2YWx1ZRgBIAEoAlIFdmFsdWU=');
@$core.Deprecated('Use playerDanmakuScalingfactorDescriptor instead')
const PlayerDanmakuScalingfactor$json = const {
  '1': 'PlayerDanmakuScalingfactor',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 2, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuScalingfactor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuScalingfactorDescriptor =
    $convert.base64Decode(
        'ChpQbGF5ZXJEYW5tYWt1U2NhbGluZ2ZhY3RvchIUCgV2YWx1ZRgBIAEoAlIFdmFsdWU=');
@$core.Deprecated('Use playerDanmakuSeniorModeSwitchDescriptor instead')
const PlayerDanmakuSeniorModeSwitch$json = const {
  '1': 'PlayerDanmakuSeniorModeSwitch',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuSeniorModeSwitch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuSeniorModeSwitchDescriptor =
    $convert.base64Decode(
        'Ch1QbGF5ZXJEYW5tYWt1U2VuaW9yTW9kZVN3aXRjaBIUCgV2YWx1ZRgBIAEoBVIFdmFsdWU=');
@$core.Deprecated('Use playerDanmakuSpeedDescriptor instead')
const PlayerDanmakuSpeed$json = const {
  '1': 'PlayerDanmakuSpeed',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuSpeed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuSpeedDescriptor = $convert
    .base64Decode('ChJQbGF5ZXJEYW5tYWt1U3BlZWQSFAoFdmFsdWUYASABKAVSBXZhbHVl');
@$core.Deprecated('Use playerDanmakuSwitchDescriptor instead')
const PlayerDanmakuSwitch$json = const {
  '1': 'PlayerDanmakuSwitch',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
    const {'1': 'canIgnore', '3': 2, '4': 1, '5': 8, '10': 'canIgnore'},
  ],
};

/// Descriptor for `PlayerDanmakuSwitch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuSwitchDescriptor = $convert.base64Decode(
    'ChNQbGF5ZXJEYW5tYWt1U3dpdGNoEhQKBXZhbHVlGAEgASgIUgV2YWx1ZRIcCgljYW5JZ25vcmUYAiABKAhSCWNhbklnbm9yZQ==');
@$core.Deprecated('Use playerDanmakuSwitchSaveDescriptor instead')
const PlayerDanmakuSwitchSave$json = const {
  '1': 'PlayerDanmakuSwitchSave',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuSwitchSave`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuSwitchSaveDescriptor =
    $convert.base64Decode(
        'ChdQbGF5ZXJEYW5tYWt1U3dpdGNoU2F2ZRIUCgV2YWx1ZRgBIAEoCFIFdmFsdWU=');
@$core.Deprecated('Use playerDanmakuUseDefaultConfigDescriptor instead')
const PlayerDanmakuUseDefaultConfig$json = const {
  '1': 'PlayerDanmakuUseDefaultConfig',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `PlayerDanmakuUseDefaultConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List playerDanmakuUseDefaultConfigDescriptor =
    $convert.base64Decode(
        'Ch1QbGF5ZXJEYW5tYWt1VXNlRGVmYXVsdENvbmZpZxIUCgV2YWx1ZRgBIAEoCFIFdmFsdWU=');
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode(
    'CghSZXNwb25zZRISCgRjb2RlGAEgASgFUgRjb2RlEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use subtitleItemDescriptor instead')
const SubtitleItem$json = const {
  '1': 'SubtitleItem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    const {'1': 'id_str', '3': 2, '4': 1, '5': 9, '10': 'idStr'},
    const {'1': 'lan', '3': 3, '4': 1, '5': 9, '10': 'lan'},
    const {'1': 'lan_doc', '3': 4, '4': 1, '5': 9, '10': 'lanDoc'},
    const {'1': 'subtitle_url', '3': 5, '4': 1, '5': 9, '10': 'subtitleUrl'},
    const {
      '1': 'author',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.UserInfo',
      '10': 'author'
    },
    const {
      '1': 'type',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.bilibili.community.service.dm.v1.SubtitleType',
      '10': 'type'
    },
  ],
};

/// Descriptor for `SubtitleItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subtitleItemDescriptor = $convert.base64Decode(
    'CgxTdWJ0aXRsZUl0ZW0SDgoCaWQYASABKANSAmlkEhUKBmlkX3N0chgCIAEoCVIFaWRTdHISEAoDbGFuGAMgASgJUgNsYW4SFwoHbGFuX2RvYxgEIAEoCVIGbGFuRG9jEiEKDHN1YnRpdGxlX3VybBgFIAEoCVILc3VidGl0bGVVcmwSQgoGYXV0aG9yGAYgASgLMiouYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuVXNlckluZm9SBmF1dGhvchJCCgR0eXBlGAcgASgOMi4uYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuU3VidGl0bGVUeXBlUgR0eXBl');
@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = const {
  '1': 'UserInfo',
  '2': const [
    const {'1': 'mid', '3': 1, '4': 1, '5': 3, '10': 'mid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'sex', '3': 3, '4': 1, '5': 9, '10': 'sex'},
    const {'1': 'face', '3': 4, '4': 1, '5': 9, '10': 'face'},
    const {'1': 'sign', '3': 5, '4': 1, '5': 9, '10': 'sign'},
    const {'1': 'rank', '3': 6, '4': 1, '5': 5, '10': 'rank'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode(
    'CghVc2VySW5mbxIQCgNtaWQYASABKANSA21pZBISCgRuYW1lGAIgASgJUgRuYW1lEhAKA3NleBgDIAEoCVIDc2V4EhIKBGZhY2UYBCABKAlSBGZhY2USEgoEc2lnbhgFIAEoCVIEc2lnbhISCgRyYW5rGAYgASgFUgRyYW5r');
@$core.Deprecated('Use videoMaskDescriptor instead')
const VideoMask$json = const {
  '1': 'VideoMask',
  '2': const [
    const {'1': 'cid', '3': 1, '4': 1, '5': 3, '10': 'cid'},
    const {'1': 'plat', '3': 2, '4': 1, '5': 5, '10': 'plat'},
    const {'1': 'fps', '3': 3, '4': 1, '5': 5, '10': 'fps'},
    const {'1': 'time', '3': 4, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'mask_url', '3': 5, '4': 1, '5': 9, '10': 'maskUrl'},
  ],
};

/// Descriptor for `VideoMask`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoMaskDescriptor = $convert.base64Decode(
    'CglWaWRlb01hc2sSEAoDY2lkGAEgASgDUgNjaWQSEgoEcGxhdBgCIAEoBVIEcGxhdBIQCgNmcHMYAyABKAVSA2ZwcxISCgR0aW1lGAQgASgDUgR0aW1lEhkKCG1hc2tfdXJsGAUgASgJUgdtYXNrVXJs');
@$core.Deprecated('Use videoSubtitleDescriptor instead')
const VideoSubtitle$json = const {
  '1': 'VideoSubtitle',
  '2': const [
    const {'1': 'lan', '3': 1, '4': 1, '5': 9, '10': 'lan'},
    const {'1': 'lanDoc', '3': 2, '4': 1, '5': 9, '10': 'lanDoc'},
    const {
      '1': 'subtitles',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.bilibili.community.service.dm.v1.SubtitleItem',
      '10': 'subtitles'
    },
  ],
};

/// Descriptor for `VideoSubtitle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoSubtitleDescriptor = $convert.base64Decode(
    'Cg1WaWRlb1N1YnRpdGxlEhAKA2xhbhgBIAEoCVIDbGFuEhYKBmxhbkRvYxgCIAEoCVIGbGFuRG9jEkwKCXN1YnRpdGxlcxgDIAMoCzIuLmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLlN1YnRpdGxlSXRlbVIJc3VidGl0bGVz');
const $core.Map<$core.String, $core.dynamic> DMServiceBase$json = const {
  '1': 'DM',
  '2': const [
    const {
      '1': 'DmSegMobile',
      '2': '.bilibili.community.service.dm.v1.DmSegMobileReq',
      '3': '.bilibili.community.service.dm.v1.DmSegMobileReply'
    },
    const {
      '1': 'DmView',
      '2': '.bilibili.community.service.dm.v1.DmViewReq',
      '3': '.bilibili.community.service.dm.v1.DmViewReply'
    },
    const {
      '1': 'DmPlayerConfig',
      '2': '.bilibili.community.service.dm.v1.DmPlayerConfigReq',
      '3': '.bilibili.community.service.dm.v1.Response'
    },
    const {
      '1': 'DmSegOtt',
      '2': '.bilibili.community.service.dm.v1.DmSegOttReq',
      '3': '.bilibili.community.service.dm.v1.DmSegOttReply'
    },
    const {
      '1': 'DmSegSDK',
      '2': '.bilibili.community.service.dm.v1.DmSegSDKReq',
      '3': '.bilibili.community.service.dm.v1.DmSegSDKReply'
    },
    const {
      '1': 'DmExpoReport',
      '2': '.bilibili.community.service.dm.v1.DmExpoReportReq',
      '3': '.bilibili.community.service.dm.v1.DmExpoReportRes'
    },
  ],
};

@$core.Deprecated('Use dMServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    DMServiceBase$messageJson = const {
  '.bilibili.community.service.dm.v1.DmSegMobileReq': DmSegMobileReq$json,
  '.bilibili.community.service.dm.v1.DmSegMobileReply': DmSegMobileReply$json,
  '.bilibili.community.service.dm.v1.DanmakuElem': DanmakuElem$json,
  '.bilibili.community.service.dm.v1.DanmakuAIFlag': DanmakuAIFlag$json,
  '.bilibili.community.service.dm.v1.DanmakuFlag': DanmakuFlag$json,
  '.bilibili.community.service.dm.v1.DmViewReq': DmViewReq$json,
  '.bilibili.community.service.dm.v1.DmViewReply': DmViewReply$json,
  '.bilibili.community.service.dm.v1.VideoMask': VideoMask$json,
  '.bilibili.community.service.dm.v1.VideoSubtitle': VideoSubtitle$json,
  '.bilibili.community.service.dm.v1.SubtitleItem': SubtitleItem$json,
  '.bilibili.community.service.dm.v1.UserInfo': UserInfo$json,
  '.bilibili.community.service.dm.v1.DanmakuFlagConfig': DanmakuFlagConfig$json,
  '.bilibili.community.service.dm.v1.DanmuPlayerViewConfig':
      DanmuPlayerViewConfig$json,
  '.bilibili.community.service.dm.v1.DanmuDefaultPlayerConfig':
      DanmuDefaultPlayerConfig$json,
  '.bilibili.community.service.dm.v1.DanmuPlayerConfig': DanmuPlayerConfig$json,
  '.bilibili.community.service.dm.v1.DanmuPlayerDynamicConfig':
      DanmuPlayerDynamicConfig$json,
  '.bilibili.community.service.dm.v1.ExpoReport': ExpoReport$json,
  '.bilibili.community.service.dm.v1.BuzzwordConfig': BuzzwordConfig$json,
  '.bilibili.community.service.dm.v1.BuzzwordShowConfig':
      BuzzwordShowConfig$json,
  '.bilibili.community.service.dm.v1.Expressions': Expressions$json,
  '.bilibili.community.service.dm.v1.Expression': Expression$json,
  '.bilibili.community.service.dm.v1.Period': Period$json,
  '.bilibili.community.service.dm.v1.DmPlayerConfigReq': DmPlayerConfigReq$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuSwitch':
      PlayerDanmakuSwitch$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuSwitchSave':
      PlayerDanmakuSwitchSave$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuUseDefaultConfig':
      PlayerDanmakuUseDefaultConfig$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuAiRecommendedSwitch':
      PlayerDanmakuAiRecommendedSwitch$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuAiRecommendedLevel':
      PlayerDanmakuAiRecommendedLevel$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuBlocktop':
      PlayerDanmakuBlocktop$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuBlockscroll':
      PlayerDanmakuBlockscroll$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuBlockbottom':
      PlayerDanmakuBlockbottom$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuBlockcolorful':
      PlayerDanmakuBlockcolorful$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuBlockrepeat':
      PlayerDanmakuBlockrepeat$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuBlockspecial':
      PlayerDanmakuBlockspecial$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuOpacity':
      PlayerDanmakuOpacity$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuScalingfactor':
      PlayerDanmakuScalingfactor$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuDomain':
      PlayerDanmakuDomain$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuSpeed':
      PlayerDanmakuSpeed$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuEnableblocklist':
      PlayerDanmakuEnableblocklist$json,
  '.bilibili.community.service.dm.v1.InlinePlayerDanmakuSwitch':
      InlinePlayerDanmakuSwitch$json,
  '.bilibili.community.service.dm.v1.PlayerDanmakuSeniorModeSwitch':
      PlayerDanmakuSeniorModeSwitch$json,
  '.bilibili.community.service.dm.v1.Response': Response$json,
  '.bilibili.community.service.dm.v1.DmSegOttReq': DmSegOttReq$json,
  '.bilibili.community.service.dm.v1.DmSegOttReply': DmSegOttReply$json,
  '.bilibili.community.service.dm.v1.DmSegSDKReq': DmSegSDKReq$json,
  '.bilibili.community.service.dm.v1.DmSegSDKReply': DmSegSDKReply$json,
  '.bilibili.community.service.dm.v1.DmExpoReportReq': DmExpoReportReq$json,
  '.bilibili.community.service.dm.v1.DmExpoReportRes': DmExpoReportRes$json,
};

/// Descriptor for `DM`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List dMServiceDescriptor = $convert.base64Decode(
    'CgJETRJzCgtEbVNlZ01vYmlsZRIwLmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkRtU2VnTW9iaWxlUmVxGjIuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRG1TZWdNb2JpbGVSZXBseRJkCgZEbVZpZXcSKy5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5EbVZpZXdSZXEaLS5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5EbVZpZXdSZXBseRJxCg5EbVBsYXllckNvbmZpZxIzLmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkRtUGxheWVyQ29uZmlnUmVxGiouYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuUmVzcG9uc2USagoIRG1TZWdPdHQSLS5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5EbVNlZ090dFJlcRovLmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkRtU2VnT3R0UmVwbHkSagoIRG1TZWdTREsSLS5iaWxpYmlsaS5jb21tdW5pdHkuc2VydmljZS5kbS52MS5EbVNlZ1NES1JlcRovLmJpbGliaWxpLmNvbW11bml0eS5zZXJ2aWNlLmRtLnYxLkRtU2VnU0RLUmVwbHkSdAoMRG1FeHBvUmVwb3J0EjEuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRG1FeHBvUmVwb3J0UmVxGjEuYmlsaWJpbGkuY29tbXVuaXR5LnNlcnZpY2UuZG0udjEuRG1FeHBvUmVwb3J0UmVz');
