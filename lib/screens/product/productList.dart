import 'package:clothingstore/components/strings.dart';
import 'package:clothingstore/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ProductListScreen extends StatelessWidget {
  final int productState;
  String prouctStateTitle = AppStrings.newestProduct;
// AppStrings.newestProduct
  ProductListScreen(
      {super.key, required this.productState, required this.prouctStateTitle});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Assets.images.logo,
                width: 24,
                height: 24,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                AppStrings.homeAppbar,
                style: textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 0, right: 16, bottom: 0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    prouctStateTitle,
                    style: textTheme.displayMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 15,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.6,
                  mainAxisExtent: 250,
                ),
                itemBuilder: (context, index) {
                  // return const ProductItem(product: ,);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
