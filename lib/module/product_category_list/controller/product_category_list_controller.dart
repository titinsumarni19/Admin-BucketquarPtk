import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ProductCategoryListController extends State<ProductCategoryListView> {
  static late ProductCategoryListController instance;
  late ProductCategoryListView view;

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

  delete(ProductCategory item) async {
    try {
      showLoading();
      await ProductCategoryService().delete(item.id!);
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
      await ProductCategoryService().deleteAll();
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
  String? productCategoryName;
  DateTime? createdAt;
  DateTime? updatedAt;

  String? idOperatorAndValue;
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
      productCategoryName,
      createdAt,
      updatedAt,
      idOperatorAndValue,
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
    productCategoryName = null;
    createdAt = null;
    updatedAt = null;
    idOperatorAndValue = null;
    createdAtFrom = null;
    createdAtTo = null;
    updatedAtFrom = null;
    updatedAtTo = null;
    setState(() {});
  }
}
