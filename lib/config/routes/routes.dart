
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/components.dart';
import '../../features/cart/presentation/pages/cart_screen.dart';
import '../../features/home/domain/entities/ProductEntity.dart';
import '../../features/home/presentation/pages/home.dart';
import '../../features/login/data/data_sources/data_sources.dart';
import '../../features/login/presentation/manager/cubit.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/product_details/presentation/pages/product_details.dart';
import '../../features/sign_up/presentation/pages/sign_up.dart';

class Routes {
  static const String login = "/";
  static const String signUp = "signUp";
  static const String home = "homeScreen";
  static const String productDetails = "productDetails";
  static const String cart = "cart";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => LoginCubit(RemoteDto()),
              child: const LoginScreen()),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case Routes.home:
      // LoginEntity loginEntity = routeSettings.arguments as LoginEntity;
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case Routes.productDetails:
        ProductDataEntity productEntity =
        routeSettings.arguments as ProductDataEntity;
        return MaterialPageRoute(
          builder: (context) => ProductDetails(productEntity),
        );
      case Routes.cart:
        return MaterialPageRoute(
          builder: (context) => CartScreen(),
        );

      default:
        return MaterialPageRoute(builder: (context) => unDefineRoute());
    }
  }
}