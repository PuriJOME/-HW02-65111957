import 'package:flutter/material.dart';
import '/product.dart';
import '/api_service.dart';
import 'product_detail_page.dart';

void main() {
  runApp(ProductApp());    
}

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(),  
    );
  }
}

class ProductListPage extends StatefulWidget {   
  @override
  _ProductListPageState createState() => _ProductListPageState();
}


class _ProductListPageState extends State<ProductListPage> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ), 
      body: FutureBuilder<List<Product>>(  
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {  
            List<Product> products = snapshot.data!;   
            return ListView.builder(      
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(      
                  leading: Image.network(products[index].image),
                  title: Text(products[index].title),
                  subtitle: Text('\$${products[index].price.toString()}'),
                  onTap: () {
                    Navigator.push(    
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(product: products[index]),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {   
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
