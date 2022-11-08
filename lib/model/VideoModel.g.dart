// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HYVideoModel _$HYVideoModelFromJson(Map<String, dynamic> json) => HYVideoModel(
      aid: json['aid'] as int,
      videos: json['videos'] as int,
      tid: json['tid'] as int,
      tname: json['tname'] as String,
      copyright: json['copyright'] as int,
      pic: json['pic'] as String,
      title: json['title'] as String,
      pubdate: json['pubdate'] as int,
      ctime: json['ctime'] as int,
      desc: json['desc'] as String,
      state: json['state'] as int,
      duration: json['duration'] as int,
      durationText: json['durationText'] as String,
      rights: Map<String, int>.from(json['rights'] as Map),
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
      stat: Map<String, int>.from(json['stat'] as Map),
      hyVideoModelDynamic: json['hyVideoModelDynamic'] as String,
      cid: json['cid'] as int,
      dimension: Dimension.fromJson(json['dimension'] as Map<String, dynamic>),
      seasonId: json['seasonId'] as int?,
      shortLink: json['shortLink'] as String,
      shortLinkV2: json['shortLinkV2'] as String,
      firstFrame: json['firstFrame'] as String?,
      bvid: json['bvid'] as String,
      seasonType: json['seasonType'] as int,
      isOgv: json['isOgv'] as bool,
      ogvInfo: json['ogvInfo'],
      rcmdReason: json['rcmdReason'] as String,
    );

Map<String, dynamic> _$HYVideoModelToJson(HYVideoModel instance) =>
    <String, dynamic>{
      'aid': instance.aid,
      'videos': instance.videos,
      'tid': instance.tid,
      'tname': instance.tname,
      'copyright': instance.copyright,
      'pic': instance.pic,
      'title': instance.title,
      'pubdate': instance.pubdate,
      'ctime': instance.ctime,
      'desc': instance.desc,
      'state': instance.state,
      'duration': instance.duration,
      'durationText': instance.durationText,
      'rights': instance.rights,
      'owner': instance.owner,
      'stat': instance.stat,
      'hyVideoModelDynamic': instance.hyVideoModelDynamic,
      'cid': instance.cid,
      'dimension': instance.dimension,
      'seasonId': instance.seasonId,
      'shortLink': instance.shortLink,
      'shortLinkV2': instance.shortLinkV2,
      'firstFrame': instance.firstFrame,
      'bvid': instance.bvid,
      'seasonType': instance.seasonType,
      'isOgv': instance.isOgv,
      'ogvInfo': instance.ogvInfo,
      'rcmdReason': instance.rcmdReason,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      mid: json['mid'] as int,
      name: json['name'] as String,
      face: json['face'] as String,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'mid': instance.mid,
      'name': instance.name,
      'face': instance.face,
    };

Dimension _$DimensionFromJson(Map<String, dynamic> json) => Dimension(
      width: json['width'] as int,
      height: json['height'] as int,
      rotate: json['rotate'] as int,
    );

Map<String, dynamic> _$DimensionToJson(Dimension instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'rotate': instance.rotate,
    };
