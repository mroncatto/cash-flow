// ignore_for_file: no_leading_underscores_for_local_identifiers

class ArticleModel {
  ArticleModel({
    required this.data,
    required this.status,
  });
  late final List<ArticleData> data;
  late final ArticleStatus status;
  
  ArticleModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>ArticleData.fromJson(e)).toList();
    status = ArticleStatus.fromJson(json['status']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['status'] = status.toJson();
    return _data;
  }
}

class ArticleData {
  ArticleData({
    required this.cover,
    required this.assets,
    required this.createdAt,
    required this.meta,
    required this.type,
  });
  late final String cover;
  late final List<Assets> assets;
  late final String createdAt;
  late final Meta meta;
  late final String type;
  
  ArticleData.fromJson(Map<String, dynamic> json){
    cover = json['cover'];
    assets = List.from(json['assets']).map((e)=>Assets.fromJson(e)).toList();
    createdAt = json['createdAt'];
    meta = Meta.fromJson(json['meta']);
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cover'] = cover;
    _data['assets'] = assets.map((e)=>e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['meta'] = meta.toJson();
    _data['type'] = type;
    return _data;
  }
}

class Assets {
  Assets({
    required this.name,
    required this.coinId,
    required this.slug,
    required this.symbol,
  });
  late final String name;
  late final int coinId;
  late final String slug;
  late final String symbol;
  
  Assets.fromJson(Map<String, dynamic> json){
    name = json['name'];
    coinId = json['coinId'];
    slug = json['slug'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['coinId'] = coinId;
    _data['slug'] = slug;
    _data['symbol'] = symbol;
    return _data;
  }
}

class Meta {
  Meta({
    required this.title,
    required this.subtitle,
    required this.sourceName,
    required this.sourceUrl,
    required this.id,
    required this.slug,
    required this.likes,
    required this.shares,
    required this.announcement,
    required this.views,
    required this.category,
    required this.total,
    required this.releasedAt,
    required this.project,
  });
  late final String title;
  late final String subtitle;
  late final String sourceName;
  late final String sourceUrl;
  late final String id;
  late final String slug;
  late final int likes;
  late final int shares;
  late final bool announcement;
  late final int views;
  late final String category;
  late final int total;
  late final String releasedAt;
  late final Project project;
  
  Meta.fromJson(Map<String, dynamic> json){
    title = json['title'];
    subtitle = json['subtitle'];
    sourceName = json['sourceName'];
    sourceUrl = json['sourceUrl'];
    id = json['id'];
    slug = json['slug'];
    likes = json['likes'];
    shares = json['shares'];
    announcement = json['announcement'];
    views = json['views'];
    category = json['category'];
    total = json['total'];
    releasedAt = json['releasedAt'];
    project = Project.fromJson(json['project']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['subtitle'] = subtitle;
    _data['sourceName'] = sourceName;
    _data['sourceUrl'] = sourceUrl;
    _data['id'] = id;
    _data['slug'] = slug;
    _data['likes'] = likes;
    _data['shares'] = shares;
    _data['announcement'] = announcement;
    _data['views'] = views;
    _data['category'] = category;
    _data['total'] = total;
    _data['releasedAt'] = releasedAt;
    _data['project'] = project.toJson();
    return _data;
  }
}

class Project {
  Project({
    required this.nickname,
    required this.avatarId,
    required this.username,
    required this.guid,
  });
  late final String nickname;
  late final String avatarId;
  late final String username;
  late final String guid;
  
  Project.fromJson(Map<String, dynamic> json){
    nickname = json['nickname'];
    avatarId = json['avatarId'];
    username = json['username'];
    guid = json['guid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nickname'] = nickname;
    _data['avatarId'] = avatarId;
    _data['username'] = username;
    _data['guid'] = guid;
    return _data;
  }
}

class ArticleStatus {
  ArticleStatus({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
  });
  late final String timestamp;
  late final String errorCode;
  late final String errorMessage;
  late final String elapsed;
  late final int creditCount;
  
  ArticleStatus.fromJson(Map<String, dynamic> json){
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['timestamp'] = timestamp;
    _data['error_code'] = errorCode;
    _data['error_message'] = errorMessage;
    _data['elapsed'] = elapsed;
    _data['credit_count'] = creditCount;
    return _data;
  }
}