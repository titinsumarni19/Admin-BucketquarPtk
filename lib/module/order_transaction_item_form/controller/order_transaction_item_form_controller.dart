import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class OrderTransactionItemFormController
    extends State<OrderTransactionItemFormView> {
  static late OrderTransactionItemFormController instance;
  late OrderTransactionItemFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    devLog(this.runtimeType.toString());
    initializeData();
  }

  initializeData() async {
    loading = true;
    setState(() {});

    if (isEditMode) {
      //::CURRENT_DATA
      id = current!.id;
      orderTransactionId = current!.orderTransactionId;
      productId = current!.productId;
      qty = current!.qty;
      purchasePrice = current!.purchasePrice;
      sellingPrice = current!.sellingPrice;
      profit = current!.profit;
      createdAt = current!.createdAt;
      updatedAt = current!.updatedAt;
      total = current!.total;
    } else {
      if (isDevMode) {
        //@BEGIN_RANDOM_INITIAL_DATA
        orderTransactionId = await r.randomStringId('order_transaction');
        productId = await r.randomStringId('product');
        qty = 1;
        purchasePrice = r.randomDouble();
        sellingPrice = r.randomDouble();
        profit = r.randomDouble();
        createdAt = DateTime.now();
        updatedAt = DateTime.now();
        total = r.randomDouble();
        //@END_RANDOM_INITIAL_DATA
        var product = await ProductService().getProductById(productId!);
        sellingPrice = product!["selling_price"];
      }

      //@HAS_PARENT_SCOPE
      if (OrderTransactionItemListController.instance.isSubEditMode) {
        orderTransactionId =
            OrderTransactionItemListController.instance.view.orderTransactionId;
      }
      //@:HAS_PARENT_SCOPE
    }

    loading = false;
    setState(() {});
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;

  bool get isNotValid {
    bool isValid = formKey.currentState!.validate();
    return !isValid;
  }

  bool get isValid {
    bool isValid = formKey.currentState!.validate();
    return isValid;
  }

  OrderTransactionItem? get current => widget.item;
  bool get isEditMode => current != null;
  bool get isCreateMode => current == null;

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

  save() {
    if (isNotValid) return;
    if (isCreateMode) create();
    if (isEditMode) update();
  }

  create() async {
    try {
      showLoading();
      await OrderTransactionItemService().create(
        //@BEGIN_FORM_CREATE
        orderTransactionId: orderTransactionId,
        productId: productId,
        qty: qty,
        purchasePrice: purchasePrice,
        sellingPrice: sellingPrice,
        profit: profit,
        total: qty! * sellingPrice!,
        //@END_FORM_CREATE
      );
      hideLoading();
      Get.back();
      ss("Data created");
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
  }

  update() async {
    try {
      showLoading();
      await OrderTransactionItemService().update(
        id: id!,
        //@BEGIN_FORM_UPDATE
        orderTransactionId: orderTransactionId,
        productId: productId,
        qty: qty,
        purchasePrice: purchasePrice,
        sellingPrice: sellingPrice,
        profit: profit,
        total: qty! * sellingPrice!,
        //@END_FORM_UPDATE
      );
      hideLoading();
      Get.back();
      ss("Data updated");
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
  }

  refresh() {
    setState(() {});
  }
}
