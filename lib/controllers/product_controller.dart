import 'package:get/state_manager.dart';
import 'package:shopx/models/product.dart';
import 'package:shopx/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = List<Product>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
