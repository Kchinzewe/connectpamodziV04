import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String creator;
  final String name;
  final String text;
  final Timestamp timestamp;

  // PostModel(this.id, this.creator, this.text, this.timestamp,);

  PostModel({
    this.id,
    this.text,
    this.creator,
    this.name,
    this.timestamp,
  });
}