import 'package:flutter/widgets.dart';
import 'package:phelum/entity/dashboard_item_entity.dart';

@immutable
class DashboardItem {
  final int itemId;
  final String title;
  final String imageUrl;
  final double rating;

  DashboardItem(this.itemId, this.title, this.imageUrl, this.rating);

  DashboardItem copyWith({int itemId, String title, String imageUrl, int rating}) {
    return DashboardItem(
      itemId ?? this.itemId,
      title ?? this.title,
      imageUrl ?? this.imageUrl,
      rating ?? this.rating
    );
  }

  @override
  String toString() {
    return 'DashboardItem {itemId : $itemId, title : $title, image_url : $imageUrl, rating : $rating}';
  }

  DashboardItemEntity toEntity() {
    return DashboardItemEntity(itemId, title, imageUrl, rating);
  }

  static DashboardItem fromEntity(DashboardItemEntity entity) {
    return DashboardItem(
      entity.itemId,
      entity.title,
      entity.imageUrl,
      entity.rating
    );
  }
}