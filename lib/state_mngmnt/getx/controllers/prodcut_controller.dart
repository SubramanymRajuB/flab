import 'package:flab/state_mngmnt/getx/models/product.dart';
import 'package:flab/state_mngmnt/getx/services/product_service.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  List<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductService.fetchProducts();
      if (products != null) {
        productList = products;
      }
    } finally {
      isLoading(false);
    }
  }
}