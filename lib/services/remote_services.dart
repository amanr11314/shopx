import 'package:faker/faker.dart';
import 'package:shopx/models/product.dart';

class RemoteService {
  static Future<List<Product>> fetchProducts() async {
    Future.delayed(Duration(seconds: 5));
    final Faker fakeProduct = Faker();

    String randomImage() => fakeProduct.image
              .image(keywords: ['beauty', 'consmetic','products']);

    List<Product> products = List<Product>.generate(
      15,
      (index) {
        return Product(
          productName: fakeProduct.lorem.words(2).toString(),
          brandName: fakeProduct.company.name(),
          rating: fakeProduct.randomGenerator.decimal(scale: 5.0, min: 3.0).toStringAsFixed(1),
          price: fakeProduct.randomGenerator.integer(100, min: 10).toDouble(),
          productImage: randomImage(),
        );
      },
    );
    return products;
  }
}
