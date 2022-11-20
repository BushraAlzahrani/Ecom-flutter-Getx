import 'package:ecom_app/models/product_models.dart';
import 'package:ecom_app/services/proudct_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var isFav = false.obs;
  var favouritesList = <ProductModel>[].obs;
  var storage = GetStorage();

  var searchList = <ProductModel>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    List? storedShoppings = storage.read<List>('isFavouritesList');

    if (storedShoppings != null) {
      favouritesList =
          storedShoppings.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void addFav() {
    isFav.value = !isFav.value;
  }

  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await storage.remove("isFavouritesList");
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isFavouritesList", favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
