import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mcommerce_app/config/routes/routers.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/screens/home/home_page.dart';
import 'package:mcommerce_app/utils/providers.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...appProviders,
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
