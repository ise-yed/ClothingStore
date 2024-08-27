import 'package:clothingstore/components/strings.dart';
import 'package:clothingstore/screens/home/bloc/home_bloc.dart';
import 'package:clothingstore/screens/home/widgets/image_slider.dart';
import 'package:clothingstore/screens/home/widgets/product_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:clothingstore/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeLoadDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        
        child: AppBar(
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
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageSlider(
                      slides: state.homeModel.slides,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       prefs.remove('token');
                    //       isLogin.value = false;
                    //       print(isLogin.value);
                    //     },
                    //     child: Text("remove")),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       prefs.setString('token', "dsfsdfsd");
                    //       isLogin.value = true;
                    //       print(isLogin.value);
                    //     },
                    //     child: Text("fata")),
                    ProductListView(
                      products: state.homeModel.news,
                      textTheme: textTheme,
                      title: AppStrings.newestProduct,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ProductListView(
                      products: state.homeModel.mostVisited,
                      textTheme: textTheme,
                      title: AppStrings.mostSellerProduct,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
