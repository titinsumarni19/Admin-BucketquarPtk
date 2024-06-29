import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class OrderTransactionItemListController
    extends State<OrderTransactionItemListView> {
  static late OrderTransactionItemListController instance;
  late OrderTransactionItemListView view;

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

  delete(OrderTransactionItem item) async {
    try {
      showLoading();
      await OrderTransactionItemService().delete(item.id!);
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
      await OrderTransactionItemService().deleteAll();
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
  String? orderTransactionId;
  String? productId;
  int? qty;
  double? purchasePrice;
  double? sellingPrice;
  double? profit;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? total;

  String? idOperatorAndValue;
  String? orderTransactionIdOperatorAndValue;
  String? productIdOperatorAndValue;
  String? qtyOperatorAndValue;
  String? purchasePriceOperatorAndValue;
  String? sellingPriceOperatorAndValue;
  String? profitOperatorAndValue;
  DateTime? createdAtFrom;
  DateTime? createdAtTo;
  DateTime? updatedAtFrom;
  DateTime? updatedAtTo;
  String? totalOperatorAndValue;
  //@:FILTER_VARIABLES

  //@CHECK_FILTER_MODE
  bool get isFilterMode {
    List values = [
      //::COMMA_VARIABLE
      id,
      orderTransactionId,
      productId,
      qty,
      purchasePrice,
      sellingPrice,
      profit,
      createdAt,
      updatedAt,
      total,
      idOperatorAndValue,
      orderTransactionIdOperatorAndValue,
      productIdOperatorAndValue,
      qtyOperatorAndValue,
      purchasePriceOperatorAndValue,
      sellingPriceOperatorAndValue,
      profitOperatorAndValue,
      createdAtFrom,
      createdAtTo,
      updatedAtFrom,
      updatedAtTo,
      totalOperatorAndValue,
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
    orderTransactionId = null;
    productId = null;
    qty = null;
    purchasePrice = null;
    sellingPrice = null;
    profit = null;
    createdAt = null;
    updatedAt = null;
    total = null;
    idOperatorAndValue = null;
    orderTransactionIdOperatorAndValue = null;
    productIdOperatorAndValue = null;
    qtyOperatorAndValue = null;
    purchasePriceOperatorAndValue = null;
    sellingPriceOperatorAndValue = null;
    profitOperatorAndValue = null;
    createdAtFrom = null;
    createdAtTo = null;
    updatedAtFrom = null;
    updatedAtTo = null;
    totalOperatorAndValue = null;
    setState(() {});
  }

  //@HAS_PARENT_SCOPE
  bool get isSubEditMode => view.orderTransactionId != null;
  //@:HAS_PARENT_SCOPE
}
