class ProductModel {
  final int id;
  final String title;
  final num price;
  final num discountPrice;
  final bool hasDiscount;
  final num discountPercent;
  final String image;
  final String description;
  final String keyword;
  final String advantages;
  final String disAdvantages;
  final int visitedStatistics;
  final List<String> images;
  final List<Comment> comments;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.discountPrice,
    required this.hasDiscount,
    required this.discountPercent,
    required this.image,
    required this.description,
    required this.keyword,
    required this.advantages,
    required this.disAdvantages,
    required this.visitedStatistics,
    required this.images,
    required this.comments,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {

    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      hasDiscount: json['hasDiscount'],
      discountPercent: json['discountPercent'],
      image: json['image'],
      description: json['description'],
      keyword: json['keyword'],
      advantages: json['advantages'],
      disAdvantages: json['disAdvanteges'],
      visitedStatistics: json['visitedStatistics'],
      images: List<String>.from(json['images']),
      comments:
          List<Comment>.from(json['comments'].map((c) => Comment.fromJson(c))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'discountPrice': discountPrice,
      'hasDiscount': hasDiscount,
      'discountPercent': discountPercent,
      'image': image,
      'description': description,
      'keyword': keyword,
      'advantages': advantages,
      'disAdvanteges': disAdvantages,
      'visitedStatistics': visitedStatistics,
      'images': images,
      'comments': comments.map((c) => c.toJson()).toList(),
    };
  }
}

class Comment {
  final int id;
  final String subject;
  final String text;
  final String userFullName;
  final String userEmail;
  final int productId;
  final DateTime createDate;

  Comment({
    required this.id,
    required this.subject,
    required this.text,
    required this.userFullName,
    required this.userEmail,
    required this.productId,
    required this.createDate,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      subject: json['subject'],
      text: json['text'],
      userFullName: json['userFullName'],
      userEmail: json['userEmail'],
      productId: json['productId'],
      createDate: DateTime.parse(json['createDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subject': subject,
      'text': text,
      'userFullName': userFullName,
      'userEmail': userEmail,
      'productId': productId,
      'createDate': createDate.toIso8601String(),
    };
  }
}
