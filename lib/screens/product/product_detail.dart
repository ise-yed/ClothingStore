import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothingstore/components/colors.dart';
import 'package:clothingstore/components/strings.dart';
import 'package:clothingstore/screens/product/bloc/product_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productId});
  final int productId;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final carouselSliderController = CarouselSliderController();
  int posterState = 0;
  bool isExpanded = false;

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context)
        .add(ProductDetailLoadDataEvent(widget.productId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.productDetailAppbar,
                    style: textTheme.displayMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 24,
                  )
                ],
              ),
            )),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductDetailSuccessState) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 32),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CarouselSlider(
                                    carouselController:
                                        carouselSliderController,
                                    items: state.productModel.images.map((e) {
                                      return CachedNetworkImage(
                                        imageUrl:
                                            "https://flutter.vesam24.com/$e",
                                        fit: BoxFit.cover,
                                      );
                                      // return Container(
                                      //   color:
                                      //       const Color.fromARGB(255, 187, 56, 33),
                                      //   width: double.infinity,
                                      //   height: double.infinity,
                                      // );
                                    }).toList(),
                                    options: CarouselOptions(
                                      viewportFraction: 1,
                                      autoPlay: true,
                                      height: 180,
                                      scrollDirection: Axis.horizontal,
                                      initialPage: 0,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          posterState = index;
                                        });
                                      },
                                    )),
                                Positioned(
                                  bottom: 10,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: AnimatedSmoothIndicator(
                                      duration:
                                          const Duration(milliseconds: 100),
                                      activeIndex: posterState,
                                      count: state.productModel.images.length,
                                      effect: const ExpandingDotsEffect(
                                          radius: 15,
                                          spacing: 5,
                                          expansionFactor: 2,
                                          dotHeight: 10,
                                          dotWidth: 10,
                                          dotColor: AppColors.kGray100,
                                          activeDotColor:
                                              AppColors.kPrimary500),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 1,
                                  left: 1,
                                  bottom: 1,
                                  top: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              carouselSliderController
                                                  .nextPage();
                                              print("next");
                                            });
                                          },
                                          child: const CircleAvatar(
                                            radius: 16,
                                            backgroundColor: AppColors.kWhite,
                                            child: Padding(
                                              padding: EdgeInsets.all(1),
                                              child: Center(
                                                  child: Icon(
                                                Icons
                                                    .keyboard_double_arrow_right_rounded,
                                                color: Colors.red,
                                                size: 20,
                                              )),
                                            ),
                                            // foregroundColor: AppColors.kWhite,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              carouselSliderController
                                                  .previousPage();
                                            });
                                          },
                                          child: const CircleAvatar(
                                            radius: 16,
                                            backgroundColor: AppColors.kWhite,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: Center(
                                                  child: Icon(
                                                Icons
                                                    .keyboard_double_arrow_left_rounded,
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
                                ),
                              ],
                            ),
                          ),

                          // ! title
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            state.productModel.title,
                            style: textTheme.displayMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(
                            color: AppColors.kGray400,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          // ! description
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                            child: SizedBox(
                              height: isExpanded ? null : 90,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.ltr,
                                      "توضیحات محصول",
                                      style: textTheme.displayMedium!.copyWith(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    textAlign: TextAlign.justify,
                                    maxLines: isExpanded ? null : 2,
                                    state.productModel.description,
                                    overflow: isExpanded
                                        ? null
                                        : TextOverflow.ellipsis,
                                    style: textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      setState(() {
                                        isExpanded = !isExpanded;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppStrings.seeAll,
                                          style: textTheme.displayMedium!
                                              .copyWith(
                                                  color: AppColors.kInfo500,
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        isExpanded
                                            ? const Icon(
                                                Icons.keyboard_arrow_up_sharp,
                                                color: AppColors.kInfo500,
                                                size: 22,
                                              )
                                            : const Icon(
                                                Icons.keyboard_arrow_down_sharp,
                                                color: AppColors.kInfo500,
                                                size: 22,
                                              )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          const Divider(
                            color: AppColors.kGray400,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          // ! Add comment
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.ltr,
                                "نظرات کاربران",
                                style: textTheme.displayMedium!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                              Visibility(
                                child: InkWell(
                                  onTap: () {},
                                  child: Text(
                                    AppStrings.commenting,
                                    style: textTheme.displayMedium!.copyWith(
                                        color: AppColors.kInfo500,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // ! Comment listview
                          SizedBox(
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: state.productModel.comments.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                state
                                                    .productModel
                                                    .comments[index]
                                                    .userFullName,
                                                style: textTheme.bodyMedium,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                                state.productModel
                                                    .comments[index].userEmail,
                                                style: textTheme.bodyMedium,
                                                overflow: TextOverflow.ellipsis)
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            textAlign: TextAlign.justify,
                                            state.productModel.comments[index]
                                                .text,
                                            style: textTheme.bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    color: AppColors.kGray400,
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 64,
                      width: double.infinity,
                      color: AppColors.kWhite,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  AppStrings.addToBasket,
                                  style: textTheme.displayMedium!
                                      .copyWith(fontWeight: FontWeight.w700)
                                      .copyWith(color: AppColors.kWhite),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Visibility(
                                  replacement: Text(
                                    "",
                                    style: textTheme.bodyMedium!.copyWith(
                                      color: AppColors.kGray400,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  visible: state.productModel.hasDiscount,
                                  child: Text(
                                    "${state.productModel.discountPrice.toStringAsFixed(0).seRagham()} تومان",
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
                                  "${state.productModel.price.toStringAsFixed(0).seRagham()} تومان",
                                  style: textTheme.bodyMedium!.copyWith(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
