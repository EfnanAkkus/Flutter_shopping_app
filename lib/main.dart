import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopappflutter/providers/orders.dart';
import 'package:shopappflutter/screens/cart_screen.dart';
import 'package:shopappflutter/screens/orders_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //dinlediğimiz child widget değiştiğinde bunu rebuilt yapıyor ChangeNotifierProvider bir class'a üye olmamızı sağlıyor ve
    // bu class child widget'ı dinlememizi sağlıyor bu class güncellendiğinde widget bunu dinliyor ve sadece bunu dinleyen widget tekrar build ediliyor
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(ctx)=> Products(),
        ),
        ChangeNotifierProvider(
        create:(ctx)=> Cart(),
        ),
        ChangeNotifierProvider(
          create:(ctx)=> Orders(),
        ),
      ],
      //if you use 4.0.0+ version of provider you should use create instead of builder
      //builder method'u built context alır ve provided class'tan (widget'tan değil) yeni bir instance(örnek) dönderir
      //bize bir instance sağlayan bir provider koyuyoruz bu product sınıfıyla aynı instance
      // create:(ctx)=> Products(),
      //MaterialApp ve onun tüm child widgetları bu class'ın(Products) instance'ı için bir listener kurabilir
      //tüm materialApp widget'ı değişmez sadece onun içindeki dinlenen child widgetlar değişir
      //bu class'ın içinde herhangi bir şeyi değiştirdiğimizde, notify listener çağırırız(provider'in içindeki notifyListeners())
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
          }),
    );
  }
}
