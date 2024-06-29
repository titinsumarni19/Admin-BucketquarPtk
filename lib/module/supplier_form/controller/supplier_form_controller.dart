import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class SupplierFormController extends State<SupplierFormView> {
  static late SupplierFormController instance;
  late SupplierFormView view;

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
      imageUrl = current!.imageUrl;
      supplierName = current!.supplierName;
      email = current!.email;
      phone = current!.phone;
      address = current!.address;
      createdAt = current!.createdAt;
      updatedAt = current!.updatedAt;
    } else {
      if (isDevMode) {
        //@BEGIN_RANDOM_INITIAL_DATA
        imageUrl = r.randomImageUrl();
        supplierName = r.randomName();
        email = r.randomEmail();
        phone = r.randomPhone();
        address = r.randomAddress();
        createdAt = DateTime.now();
        updatedAt = DateTime.now();
        //@END_RANDOM_INITIAL_DATA
      }
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

  Supplier? get current => widget.item;
  bool get isEditMode => current != null;
  bool get isCreateMode => current == null;

  //::VARIABLE
  String? id;
  String? imageUrl;
  String? supplierName;
  String? email;
  String? phone;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;

  save() {
    if (isNotValid) return;
    if (isCreateMode) create();
    if (isEditMode) update();
  }

  create() async {
    try {
      showLoading();
      await SupplierService().create(
        //@BEGIN_FORM_CREATE
        imageUrl: imageUrl,
        supplierName: supplierName,
        email: email,
        phone: phone,
        address: address,
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
      await SupplierService().update(
        id: id!,
        //@BEGIN_FORM_UPDATE
        imageUrl: imageUrl,
        supplierName: supplierName,
        email: email,
        phone: phone,
        address: address,
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
