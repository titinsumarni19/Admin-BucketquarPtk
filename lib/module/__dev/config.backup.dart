// import 'package:hyper_ui/module/__dev/module.dart';

// class ModuleConfig {
//   static Module? getModule(String moduleName) {
//     var index = configs.indexWhere((element) => element.name == moduleName);
//     if (index == -1) {
//       print("Module config not found $moduleName");
//       return null;
//     }
//     return configs[index];
//   }

//   static List<Module> configs = [
//     Module(
//       name: 'transaction',
//       icon: 'transaction',
//       tableColumnPriority: [
//         'id',
//         'userProfileId',
//         'customerId',
//         'totalAmount',
//         'taxPercentage',
//         'discountPercentage',
//         'taxAmount',
//         'discountAmount',
//         'totalBeforeTax',
//         'totalAfterTax',
//         'paymentMethod',
//         'createdAt',
//         'updatedAt',
//       ],
//       subEditMode: true,
//       subEditTable: 'transaction_item',
//       subEditFormHiddenFields: [
//         'transaction_id',
//         'created_at',
//         'updated_at',
//         'total_amount',
//         'discount_percentage',
//         'tax_percentage',
//         'tax_amount',
//         'discount_amount',
//         'total_before_tax',
//         'total_after_tax',
//       ],
//       subEditTableHiddenFields: [],
//       subEditTableHiddenFooters: [],
//       subEditRowTotalFieldName: 'total',
//       subEditRowCalculation: 'qty*price',
//       subEditTableTotalFieldName: 'totalAmount',
//     ),
//     Module(
//       name: 'transaction_item',
//       icon: 'transaction_item',
//       tableColumnPriority: [],
//       subEditMode: true,
//       subEditTable: 'transaction_item',
//       subEditFormHiddenFields: [],
//       subEditTableHiddenFields: [
//         'id',
//         'transaction_id',
//         'created_at',
//         'updated_at',
//       ],
//       subEditTableHiddenFooters: [],
//       subEditRowTotalFieldName: 'total',
//       subEditRowCalculation: 'qty*price',
//       subEditTableTotalFieldName: 'totalAmount',
//     ),
//   ];
// }
