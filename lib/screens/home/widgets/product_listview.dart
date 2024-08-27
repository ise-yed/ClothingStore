import 'package:clothingstore/components/colors.dart';
import 'package:clothingstore/components/strings.dart';
import 'package:clothingstore/data/model/home.dart';
import 'package:clothingstore/screens/product/productList.dart';
import 'package:clothingstore/screens/product/widgets/product_item.dart';
import 'package:clothingstore/utils/navigation.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;
  const ProductListView(
      {super.key,
      required this.textTheme,
      required this.title,
      required this.products});

  final TextTheme textTheme;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Column(
        children: [
          // ! newest titleand route to product list
          Row(
            children: [
              Expanded(
                  child: Text(
                title,
                style: textTheme.displayMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              )),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  navigation(
                      closeScreen: false,
                      context: context,
                      widgets: ProductListScreen(
                        productState: 0,
                        prouctStateTitle: AppStrings.newestProduct,
                      ),
                      fullScreen: false);
                },
                child: Row(
                  children: [
                    Text(
                      AppStrings.seeAll,
                      style: textTheme.displayMedium!.copyWith(
                          color: AppColors.kInfo500,
                          fontWeight: FontWeight.w700),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.kInfo500,
                      size: 22,
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          // ! list of Product
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  product: products[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
