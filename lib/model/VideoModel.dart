/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-11-08 17:41:29
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-11-08 17:51:39
 * @FilePath: /flutter_clone_bilibili/lib/model/video.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:json_annotation/json_annotation.dart';

part 'VideoModel.g.dart';

@JsonSerializable()
class HYVideoModel {
  HYVideoModel({
    required this.aid,
    required this.videos,
    required this.tid,
    required this.tname,
    required this.copyright,
    required this.pic,
    required this.title,
    required this.pubdate,
    required this.ctime,
    required this.desc,
    required this.state,
    required this.duration, //时间
    required this.durationText, //时间文本格式
    required this.rights,
    required this.owner,
    required this.stat,
    required this.hyVideoModelDynamic,
    required this.cid,
    required this.dimension,
    required this.seasonId,
    required this.shortLink,
    required this.shortLinkV2,
    required this.firstFrame,
    required this.bvid,
    required this.seasonType,
    required this.isOgv,
    required this.ogvInfo,
    required this.rcmdReason,
  });

  int aid;
  int videos;
  int tid;
  String tname;
  int copyright;
  String pic;
  String title;
  int pubdate;
  int ctime;
  String desc;
  int state;
  int duration;
  String durationText; //新增时间文本
  Map<String, int> rights;
  Owner owner;
  Map<String, int> stat;
  String hyVideoModelDynamic;
  int cid;
  Dimension dimension;
  int? seasonId;
  String shortLink;
  String shortLinkV2;

  String? firstFrame;
  String bvid;
  int seasonType;
  bool isOgv;
  dynamic ogvInfo;
  String rcmdReason;

  factory HYVideoModel.fromJson(Map<String, dynamic> json) =>
      _$HYVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$HYVideoModelToJson(this);
}

@JsonSerializable()
class Owner {
  Owner({
    required this.mid,
    required this.name,
    required this.face,
  });

  int mid;
  String name;
  String face;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}

@JsonSerializable()
class Dimension {
  Dimension({
    required this.width,
    required this.height,
    required this.rotate,
  });

  int width;
  int height;
  int rotate;

  factory Dimension.fromJson(Map<String, dynamic> json) =>
      _$DimensionFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionToJson(this);
}
