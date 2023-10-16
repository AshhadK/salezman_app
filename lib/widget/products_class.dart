import 'package:flutter/material.dart';

class ProductModel {
  String productName, productSKU;
  double productPrice;
  bool isSelected;
  int productCode;
  ProductModel(this.productName, this.productPrice, this.productCode,
      this.productSKU, this.isSelected);
}
