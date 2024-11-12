import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosny_mohammed_0522022/providers/product_provider.dart';
import 'package:hosny_mohammed_0522022/screens/product_detail_screen.dart';
import 'package:hosny_mohammed_0522022/widgets/card_item.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
      ),
      body: Consumer<ProductProvider>(builder: (context, provider, Widget? child){
        
        return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),itemCount: provider.model?.data.length ,itemBuilder: (BuildContext context, int index)
        {
          var data = provider.model;
          if(data == null){
            provider.fetchData();
            return const Center(child: CircularProgressIndicator());
          }
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(img: provider.model?.data[index]['image'], title: provider.model?.data[index]['name'], description: provider.model?.data[index]['description'],)));
            },
          child: CardItem(img: provider.model?.data[index]['image'], productName: provider.model?.data[index]['name'], price: provider.model?.data[index]['price']),
          );
        });
      }),
    );
  }
}
