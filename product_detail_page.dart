import 'package:flutter/material.dart';
import 'product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailPage extends StatelessWidget {  
  final Product product;  


  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Text(product.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),  
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(  
                product.image,
                height: 200,
              ),
            ),
            SizedBox(height: 16.0),
            Text( 
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text( 
              '\$${product.price}',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 8.0),
            RatingBar.builder( 
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) { 
                print(rating);
              },
            ),
            SizedBox(height: 16.0),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
