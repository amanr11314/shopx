import 'package:flutter/material.dart';
import 'package:shopx/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    product.productImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              product.brandName,
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18.0,
                color: Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.0),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${product.rating}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            Text(
              '\$${product.price}',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
