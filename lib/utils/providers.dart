import 'package:provider/provider.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/providers/brand_provider.dart';
import 'package:mcommerce_app/providers/cart_provider.dart';
import 'package:mcommerce_app/providers/category_provider.dart';
import 'package:mcommerce_app/providers/delivery_provider.dart';
import 'package:mcommerce_app/providers/order_detail_provider.dart';
import 'package:mcommerce_app/providers/order_provider.dart';
import 'package:mcommerce_app/providers/payment_provider.dart';
import 'package:mcommerce_app/providers/product_provider.dart';
import 'package:mcommerce_app/providers/rating_provider.dart';
import 'package:mcommerce_app/providers/search_provider.dart';

final List<ChangeNotifierProvider<dynamic>> appProviders = [
  ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),
  ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
  ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
  ChangeNotifierProvider<DeliveryProvider>(create: (_) => DeliveryProvider()),
  ChangeNotifierProvider<PaymentProvider>(create: (_) => PaymentProvider()),
  ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
  ChangeNotifierProvider<OrderDetailProvider>(
      create: (_) => OrderDetailProvider()),
  ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
  ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
  ChangeNotifierProvider<BrandProvider>(create: (_) => BrandProvider()),
  ChangeNotifierProvider<RatingProvider>(create: (_) => RatingProvider()),
];
