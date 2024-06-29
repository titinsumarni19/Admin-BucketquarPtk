import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PurchaseTransactionListController
    extends State<PurchaseTransactionListView> {
  static late PurchaseTransactionListController instance;
  late PurchaseTransactionListView view;

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

  delete(PurchaseTransaction item) async {
    try {
      showLoading();
      await PurchaseTransactionService().delete(item.id!);
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
      await PurchaseTransactionService().deleteAll();
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
  String? userProfileId;
  String? supplierId;
  String? paymentMethod;
  String? orderStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? total;

  String? idOperatorAndValue;
  String? userProfileIdOperatorAndValue;
  String? supplierIdOperatorAndValue;
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
      userProfileId,
      supplierId,
      paymentMethod,
      orderStatus,
      createdAt,
      updatedAt,
      total,
      idOperatorAndValue,
      userProfileIdOperatorAndValue,
      supplierIdOperatorAndValue,
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
    userProfileId = null;
    supplierId = null;
    paymentMethod = null;
    orderStatus = null;
    createdAt = null;
    updatedAt = null;
    total = null;
    idOperatorAndValue = null;
    userProfileIdOperatorAndValue = null;
    supplierIdOperatorAndValue = null;
    createdAtFrom = null;
    createdAtTo = null;
    updatedAtFrom = null;
    updatedAtTo = null;
    totalOperatorAndValue = null;
    setState(() {});
  }
}