class Product {
  final int id;
  final String title;
  final num price;
  final num discountPrice;
  final bool hasDiscount;
  final num discountPercent;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.discountPrice,
    required this.hasDiscount,
    required this.discountPercent,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      discountPrice: json['discountPrice'],
      hasDiscount: json['hasDiscount'],
      discountPercent: json['discountPercent'],
      image: json['image'],
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
    };
  }
}

class Slide {
  final String title;
  final String image;
  final String url;

  Slide({
    required this.title,
    required this.image,
    required this.url,
  });

  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
      title: json['title'],
      image: json['image'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'url': url,
    };
  }
}

class HomeModel {
  final List<Product> news;
  final List<Slide> slides;
  final List<Product> mostVisited;

  HomeModel({
    required this.news,
    required this.slides,
    required this.mostVisited,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      news: (json['news'] as List).map((item) => Product.fromJson(item)).toList(),
      slides: (json['slides'] as List).map((item) => Slide.fromJson(item)).toList(),
      mostVisited: (json['mostVisited'] as List).map((item) => Product.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'news': news.map((item) => item.toJson()).toList(),
      'slides': slides.map((item) => item.toJson()).toList(),
      'mostVisited': mostVisited.map((item) => item.toJson()).toList(),
    };
  }
}
