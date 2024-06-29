import 'package:hyper_ui/module/__dev/module.dart';

/*
user_profile
product_category
product
customer
supplier
purchase_transaction
purchase_transaction_item
order_transaction
order_transaction_item
*/

class ModuleConfig {
  static Module? getModule(String moduleName) {
    var index = configs.indexWhere((element) => element.name == moduleName);
    if (index == -1) {
      print("Module config not found $moduleName");
      return null;
    }
    return configs[index];
  }

  static List<Module> configs = [
    Module(
      name: 'user_profile',
      icon: 'user_profile',
      tableColumnPriority: [
        'id',
        'image_url',
        'user_profile_name',
        'gender',
        'email',
        'password',
        'role',
        'is_active',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'product_category',
      icon: 'product_category',
      tableColumnPriority: [
        'id',
        'image_url',
        'product_category_name',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'product',
      icon: 'product',
      tableColumnPriority: [
        'id',
        'image_url',
        'product_name',
        'product_category_id',
        'description',
        'sku',
        'qrcode',
        'purchase_price',
        'selling_price',
        'stock',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'customer',
      icon: 'customer',
      tableColumnPriority: [
        'id',
        'image_url',
        'customer_name',
        'email',
        'phone',
        'address',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'supplier',
      icon: 'supplier',
      tableColumnPriority: [
        'id',
        'image_url',
        'supplier_name',
        'email',
        'phone',
        'address',
        'created_at',
        'updated_at'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'purchase_transaction',
      icon: 'purchase_transaction',
      tableColumnPriority: [
        'id',
        'user_profile_id',
        'supplier_id',
        'payment_method',
        'order_status',
        'created_at',
        'updated_at',
        'total'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
      subEditMode: true,
      subEditTable: 'transaction_item',
      subEditFormHiddenFields: [],
      subEditTableHiddenFields: [],
      subEditTableHiddenFooters: [],
      subEditRowTotalFieldName: 'total',
      subEditRowCalculation: 'qty*price',
      subEditTableTotalFieldName: 'totalAmount',
    ),
    Module(
      name: 'purchase_transaction_item',
      icon: 'purchase_transaction_item',
      tableColumnPriority: [
        'id',
        'purchase_transaction_id',
        'product_id',
        'qty',
        'purchase_price',
        'created_at',
        'updated_at',
        'total'
      ],
      listViewHiddenFields: [
        "created_at",
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
    Module(
      name: 'order_transaction',
      icon: 'order_transaction',
      tableColumnPriority: [
        'id',
        'user_profile_id',
        'customer_id',
        'payment_method',
        'order_status',
        'created_at',
        'updated_at',
        'total'
      ],
      listViewHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
      subEditMode: true,
      subEditTable: 'transaction_item',
      subEditFormHiddenFields: [],
      subEditTableHiddenFields: [],
      subEditTableHiddenFooters: [],
      subEditRowTotalFieldName: 'total',
      subEditRowCalculation: 'qty*price',
      subEditTableTotalFieldName: 'totalAmount',
    ),
    Module(
      name: 'order_transaction_item',
      icon: 'order_transaction_item',
      tableColumnPriority: [
        'id',
        'order_transaction_id',
        'product_id',
        'qty',
        'purchase_price',
        'selling_price',
        'profit',
        'created_at',
        'updated_at',
        'total'
      ],
      listViewHiddenFields: [
        "created_at",
        "updated_at",
        "deleted_at",
      ],
      createFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      editFormHiddenFields: [
        "updated_at",
        "deleted_at",
      ],
      createFormDisabledFields: [],
      editFormDisabledFields: [],
      generatedModules: [],
    ),
  ];
}
