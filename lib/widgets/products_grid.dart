import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product_item.dart';
import '../providers/products.dart';



class ProductsGrid extends StatelessWidget {
  /*const ProductsGrid({    //bunlara artık ihtiyacımız yok çünkü constructorları provider'dan alıyor
    Key key,
    @required this.loadedProducts,
  }) : super(key: key);

  final List<Product> loadedProducts;*/

  final bool showFavs;
  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    //parent widget'a erişebilmek için provider.of 'u kullanıyoruz (main.dart'taki)
    //provider.of kullandığımız bu widget'ın build metodu rebuild edilir ne zaman? dinlediğimiz obje değiştiği zaman
    //bütün yapı rebuild edilmez her data değiştiğinde sadece dinlediğimiz widget'lar değişir örneğin product_overwiev
    // değişmez çünkü orda dinlenen bir widget yok
    //ne tarz bır data dinlemek istediğimizi <> bunun arasına yazıyoruz biz burda Products'taki değişiklikleri dinlemek istiyoruz
    //burada tüm değişiklikleri dinleyip ui'da değiştirmek istediğimiz için listen:false demedik ve default olarak listen:true geldi
    final productsData = Provider.of<Products>(context);
    //bu bize product'ların listesini veriyor
    final products= showFavs ? productsData.favoritesItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
       // builder: (c)=>products[i] ,
        value: products[i],
        child: ProductItem(//ProductItem widget'ı, products[i].id, title, imageUrl bilgilerine ihtiyacı vardır
        //products[i].id,
        //products[i].title,
        //products[i].imageUrl,//loadedProducts[i].imageUrl, buna ihtiyaç kalmadı
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing:
          10), //allows us to define how the grid generally should be structured
    );
  }
}