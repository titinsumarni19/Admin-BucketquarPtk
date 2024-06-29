import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ProductListController extends State<ProductListView> {
  static late ProductListController instance;
  late ProductListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    devLog(this.runtimeType.toString());
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  delete(Product item) async {
    try {
      showLoading();
      await ProductService().delete(item.id!);
      hideLoading();
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
    setState(() {});
  }

  deleteAll() async {
    try {
      showLoading();
      await ProductService().deleteAll();
      hideLoading();
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
    setState(() {});
  }

  //@SEARCH
  updateFilter() {
    setState(() {});
  }
  //@:SEARCH

  refresh() {
    setState(() {});
  }

  //::FILTER_VARIABLES
  //@FILTER_VARIABLES
  //::VARIABLE
  String? id;
  String? imageUrl;
  String? productName;
  String? productCategoryId;
  String? description;
  String? sku;
  String? qrcode;
  double? purchasePrice;
  double? sellingPrice;
  int? stock;
  DateTime? createdAt;
  DateTime? updatedAt;

  String? idOperatorAndValue;
  String? productCategoryIdOperatorAndValue;
  String? purchasePriceOperatorAndValue;
  String? sellingPriceOperatorAndValue;
  String? stockOperatorAndValue;
  DateTime? createdAtFrom;
  DateTime? createdAtTo;
  DateTime? updatedAtFrom;
  DateTime? updatedAtTo;
  //@:FILTER_VARIABLES

  //@CHECK_FILTER_MODE
  bool get isFilterMode {
    List values = [
      //::COMMA_VARIABLE
      id,
      imageUrl,
      productName,
      productCategoryId,
      description,
      sku,
      qrcode,
      purchasePrice,
      sellingPrice,
      stock,
      createdAt,
      updatedAt,
      idOperatorAndValue,
      productCategoryIdOperatorAndValue,
      purchasePriceOperatorAndValue,
      sellingPriceOperatorAndValue,
      stockOperatorAndValue,
      createdAtFrom,
      createdAtTo,
      updatedAtFrom,
      updatedAtTo,
    ];
    return values.indexWhere((i) =>
            (i != null && i != "") ||
            (i != null && i is String && i.isNotEmpty)) >
        -1;
  }
  //@:CHECK_FILTER_MODE

  resetFilter() {
    //@::ULL_VARIABLE
    id = null;
    imageUrl = null;
    productName = null;
    productCategoryId = null;
    description = null;
    sku = null;
    qrcode = null;
    purchasePrice = null;
    sellingPrice = null;
    stock = null;
    createdAt = null;
    updatedAt = null;
    idOperatorAndValue = null;
    productCategoryIdOperatorAndValue = null;
    purchasePriceOperatorAndValue = null;
    sellingPriceOperatorAndValue = null;
    stockOperatorAndValue = null;
    createdAtFrom = null;
    createdAtTo = null;
    updatedAtFrom = null;
    updatedAtTo = null;
    setState(() {});
  }
}
