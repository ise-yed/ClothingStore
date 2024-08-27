import 'package:cached_network_image/cached_network_image.dart';
import 'package:clothingstore/components/colors.dart';
import 'package:clothingstore/data/model/home.dart';
import 'package:clothingstore/main.dart';
import 'package:clothingstore/screens/product/product_detail.dart';
import 'package:clothingstore/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        navigation(
            context: context,
            fullScreen: true,
            closeScreen: false,
            widgets: ProductDetailScreen(
              productId: product.id,
            ));
      },
      child: Container(
        height: 237,
        width: 156,
        margin: const EdgeInsets.only(left: 16),
        child: Stack(
          children: [
            // ! Image
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: "https://flutter.vesam24.com/${product.image}",
                    fit: BoxFit.cover,
                    height: 156,
                    width: 156,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  product.title,
                  style: textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                // ! Prices
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            replacement: Text(
                              "",
                              style: textTheme.bodyMedium!.copyWith(
                                color: AppColors.kGray400,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            visible: product.hasDiscount,
                            child: Text(
                              "${product.discountPrice.toStringAsFixed(0).seRagham()} تومان",
                              style: textTheme.bodyMedium!.copyWith(
                                color: AppColors.kGray400,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${product.price.toStringAsFixed(0).seRagham()} تومان",
                            style: textTheme.displayMedium!.copyWith(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    // ! Add Len Product Item
                    ValueListenableBuilder(
                      valueListenable: isLogin,
                      builder: (context, value, child) {
                        return value == true
                            ? const CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.kPrimary500,
                                foregroundColor: AppColors.kWhite,
                                child: Icon(Icons.add),
                              )
                            : SizedBox();
                      },
                    )
                  ],
                )
              ],
            ),
            // ! Favorite button
            const Positioned(
              right: 10,
              top: 10,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.kWhite,
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Center(
                      child: Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 20,
                  )),
                ),
                // foregroundColor: AppColors.kWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
