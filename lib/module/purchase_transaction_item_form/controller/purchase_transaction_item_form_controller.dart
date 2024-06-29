import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PurchaseTransactionItemFormController
    extends State<PurchaseTransactionItemFormView> {
  static late PurchaseTransactionItemFormController instance;
  late PurchaseTransactionItemFormView view;

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
      purchaseTransactionId = current!.purchaseTransactionId;
      productId = current!.productId;
      qty = current!.qty;
      purchasePrice = current!.purchasePrice;
      createdAt = current!.createdAt;
      updatedAt = current!.updatedAt;
      total = current!.total;
    } else {
      if (isDevMode) {
        //@BEGIN_RANDOM_INITIAL_DATA
        purchaseTransactionId = await r.randomStringId('purchase_transaction');
        productId = await r.randomStringId('product');
        qty = 1;
        purchasePrice = r.randomDouble();
        createdAt = DateTime.now();
        updatedAt = DateTime.now();
        total = r.randomDouble();
        //@END_RANDOM_INITIAL_DATA
        var product = await ProductService().getProductById(productId!);
        purchasePrice = product!["purchase_price"];
      }

      //@HAS_PARENT_SCOPE
      if (PurchaseTransactionItemListController.instance.isSubEditMode) {
        purchaseTransactionId = PurchaseTransactionItemListController
            .instance.view.purchaseTransactionId;
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

  PurchaseTransactionItem? get current => widget.item;
  bool get isEditMode => current != null;
  bool get isCreateMode => current == null;

  //::VARIABLE
  String? id;
  String? purchaseTransactionId;
  String? productId;
  int? qty;
  double? purchasePrice;
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
      await PurchaseTransactionItemService().create(
        //@BEGIN_FORM_CREATE
        purchaseTransactionId: purchaseTransactionId,
        productId: productId,
        qty: qty,
        purchasePrice: purchasePrice,
        total: qty! * purchasePrice!,
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
      await PurchaseTransactionItemService().update(
        id: id!,
        //@BEGIN_FORM_UPDATE
        purchaseTransactionId: purchaseTransactionId,
        productId: productId,
        qty: qty,
        purchasePrice: purchasePrice,
        total: qty! * purchasePrice!,
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
