import 'package:connectpamodziv04/models/user_model.dart';
import 'package:meta/meta.dart';

class Post {
  final UserModel name;
  final pid;
  String caption;
  String timeAgo;
  final String imageUrl;
  int likes;
  int comments;
  int shares;
  bool isPostPinned;
  bool isAlreadyLiked;
  int isSaveAble;

  Post({
    this.isSaveAble,
    this.name,
    this.pid,
    this.caption,
    this.timeAgo,
    this.imageUrl,
    this.likes,
    this.comments,
    this.shares,
    this.isPostPinned,
    this.isAlreadyLiked,
  });
}
