import 'package:clothingstore/components/colors.dart';
import 'package:clothingstore/components/strings.dart';
import 'package:clothingstore/screens/basket/widgets/bnb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            AppStrings.buttonNavigationBasketLabel,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return SizedBox(
                width: 328,
                height: 100,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        color: Colors.red,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                      height: 78,
                      width: 212,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ! delete and name
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 30,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      AppStrings.productTitleTest,
                                      style: textTheme.bodyMedium!.copyWith(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
                                  color: AppColors.kGray900,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // ! prices
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Visibility(
                                    child: Text(
                                      "${"300000".seRagham()} تومان",
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
                                  Visibility(
                                      child: Text(
                                    "${"300000".seRagham()} تومان",
                                    style: textTheme.bodyMedium!.copyWith(
                                      fontSize: 12,
                                    ),
                                  ))
                                ],
                              ),
                              // ! add or remove
                              Row(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                      style: ButtonStyle(
                                          shape: const MaterialStatePropertyAll(
                                              CircleBorder()),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          )),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text("1 عدد"),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove),
                                      style: ButtonStyle(
                                          shape: const MaterialStatePropertyAll(
                                              CircleBorder()),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          foregroundColor:
                                              MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          )),
                                      // radius: 15,
                                      // backgroundColor:
                                      //     Theme.of(context).colorScheme.primary,
                                      // foregroundColor:
                                      //     Theme.of(context).colorScheme.onPrimary,
                                      // child: ,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: AppColors.kGray400,
              );
            },
            itemCount: 10),
      ),
      // ! complete Shop
      bottomNavigationBar: backetBNB(context, textTheme, isExpanded, () {
        setState(() {
          isExpanded = !isExpanded;
        });
      }),
    );
  }
}
