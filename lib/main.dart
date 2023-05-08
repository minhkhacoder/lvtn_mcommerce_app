import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mcommerce_app/config/routes/routers.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
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
import 'package:mcommerce_app/screens/home/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => DeliveryProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => OrderDetailProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => BrandProvider()),
        ChangeNotifierProvider(create: (_) => RatingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'M-Commerce App',
        initialRoute: Routes.getStartedPage,
        onGenerateRoute: Routers.generateRoute,
        home: HomePage(),
      ),
    );
  }
}
