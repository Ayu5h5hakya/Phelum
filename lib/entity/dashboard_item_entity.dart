import 'package:equatable/equatable.dart';

class DashboardItemEntity extends Equatable {
  final int itemId;
  final String title;
  final String imageUrl;
  final double rating;

  DashboardItemEntity(this.itemId, this.title, this.imageUrl, this.rating);

  Map<String, Object> toJson() {
    return {
      'itemId' : itemId,
      'title': title,
      'image_url': imageUrl,
      'rating': rating
    };
  }

  @override
  String toString() {
    return 'DashboardItemEntity {itemId : $itemId, title : $title, image_url : $imageUrl, rating : $rating}';
  }

  static DashboardItemEntity fromJson(Map<String, Object> json){
    return DashboardItemEntity(
      json['item_id'] as int,
      json['title'] as String, 
      json['image_url'] as String,  
      json['rating'] as double);
  }
}