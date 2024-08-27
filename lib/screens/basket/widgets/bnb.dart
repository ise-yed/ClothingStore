import 'package:clothingstore/components/colors.dart';
import 'package:clothingstore/components/strings.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

AnimatedSize backetBNB(BuildContext context, TextTheme textTheme,
    bool isExpanded, Function() changeExpandedValue) {
  return AnimatedSize(
    duration: const Duration(milliseconds: 300),
    curve: Curves.ease,
    child: Container(
      padding: const EdgeInsets.all(16),
      height: isExpanded ? 192 : 104,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // ! final price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: changeExpandedValue,
                child: Row(
                  children: [
                    isExpanded
                        ? const Icon(
                            Icons.keyboard_arrow_up_sharp,
                          )
                        : const Icon(
                            Icons.keyboard_arrow_down_sharp,
                          ),
                    isExpanded != true
                        ? Text(
                            AppStrings.seeAll,
                            style: textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700),
                          )
                        : Text(AppStrings.closeFactor,
                            style: textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w700))
                  ],
                ),
              ),
              Visibility(
                  child: Text(
                "${"300000".seRagham()} تومان",
                style:
                    textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
              ))
            ],
          ),
          // ! expanded Item
          Visibility(
            visible: isExpanded,
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.finalPrice,
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      "${"300000".seRagham()} تومان",
                      style: textTheme.bodyMedium!.copyWith(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.discountFinal,
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      "${"300000".seRagham()} تومان",
                      style: textTheme.bodyMedium!.copyWith(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.finalPrice,
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      "${"300000".seRagham()} تومان",
                      style: textTheme.bodyMedium!.copyWith(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),

          // ! complete button
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColors.kPrimary500),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                  ),
                  fixedSize: MaterialStatePropertyAll(
                    Size(double.infinity, 40),
                  ),
                ),
                onPressed: () {},
                child: Text(AppStrings.completePay,
                    style: textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onPrimary))),
          )
        ],
      ),
    ),
  );
}
