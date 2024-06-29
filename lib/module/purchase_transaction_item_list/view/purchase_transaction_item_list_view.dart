import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PurchaseTransactionItemListView extends StatefulWidget {
  //@DETAIL_PARENT_DECLARATION_ID
  final String? purchaseTransactionId;
  //@:DETAIL_PARENT_DECLARATION_ID
  PurchaseTransactionItemListView({
    Key? key,
    //@DETAIL_PARENT_CONSTRUCTOR_ID
    this.purchaseTransactionId,
    //@:DETAIL_PARENT_CONSTRUCTOR_ID
  }) : super(key: key);

  Widget build(context, PurchaseTransactionItemListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        //@HAS_PARENT_SCOPE
        leading: controller.isSubEditMode ? Container() : null,
        leadingWidth: controller.isSubEditMode ? 0 : null,
        //@:HAS_PARENT_SCOPE
        title: Text("Purchase Transaction Item List"),
        actions: [
          //@SEARCH
          StreamSearch(
            onFilter: () => controller.updateFilter(),
            onReset: () => controller.resetFilter(),
            onDeleteAll: () => controller.deleteAll(),
            filterMode: controller.isFilterMode,
            widgets: [
              //::FILTER_FORM
              ProductAutocompleteField(
                label: "Product",
                validator: Validator.required,
                value: controller.productId?.toString(),
                onChanged: (value, label, mapValue) {
                  controller.productId = value;
                },
              ),
              QNumberFilterField(
                label: "Qty",
                validator: Validator.required,
                value: controller.qtyOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.qtyOperatorAndValue = operatorAndValue;
                },
              ),
              QNumberFilterField(
                label: "Purchase Price",
                validator: Validator.required,
                value: controller.purchasePriceOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.purchasePriceOperatorAndValue = operatorAndValue;
                },
              ),
              QNumberFilterField(
                label: "Total",
                validator: Validator.required,
                value: controller.totalOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.totalOperatorAndValue = operatorAndValue;
                },
              ),
              QDateRangePicker(
                label: "Created At",
                validator: Validator.required,
                fromValue: controller.createdAtFrom,
                toValue: controller.createdAtTo,
                onChanged: (from, to) {
                  controller.createdAtFrom = from;
                  controller.createdAtTo = to;
                },
              ),
              QDateRangePicker(
                label: "Updated At",
                validator: Validator.required,
                fromValue: controller.updatedAtFrom,
                toValue: controller.updatedAtTo,
                onChanged: (from, to) {
                  controller.updatedAtFrom = from;
                  controller.updatedAtTo = to;
                },
              ),
            ],
          ),
          //@:SEARCH
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamList(
              key: UniqueKey(),
              future: PurchaseTransactionItemService().getAll(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                purchaseTransactionId: purchaseTransactionId,
                productId: controller.productId,
                qtyOperatorAndValue: controller.qtyOperatorAndValue,
                purchasePriceOperatorAndValue:
                    controller.purchasePriceOperatorAndValue,
                createdAtFrom: controller.createdAtFrom,
                createdAtTo: controller.createdAtTo,
                updatedAtFrom: controller.updatedAtFrom,
                updatedAtTo: controller.updatedAtTo,
                totalOperatorAndValue: controller.totalOperatorAndValue,
              ),
              padding: EdgeInsets.all(12.0),
              headers: [
                //::LIST_VIEW_HEADER
                ListRowHeaderItem(
                  label: "Id",
                ),
                ListRowHeaderItem(
                  label: "Product",
                ),
                ListRowHeaderItem(
                  label: "Qty",
                ),
                ListRowHeaderItem(
                  label: "Purchase Price",
                ),
                ListRowHeaderItem(
                  label: "Total",
                ),
              ],
              itemBuilder: (itemMap, index) {
                PurchaseTransactionItem item =
                    PurchaseTransactionItem.fromJson(itemMap);

                return ListTileRow(
                  key: Key("purchase_transaction_item_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.tor(PurchaseTransactionItemFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowItem(
                      label: "Id",
                      value: item.id,
                    ),
                    ListRowItem(
                      label: "Product",
                      value: item.product?.productName,
                    ),
                    ListRowItem(
                      label: "Qty",
                      value: item.qty,
                    ),
                    ListRowItem(
                      label: "Purchase Price",
                      value: item.purchasePrice,
                    ),
                    ListRowItem(
                      label: "Total",
                      value: item.total,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingAction(
        onPressed: () async {
          await Get.tor(PurchaseTransactionItemFormView());
          controller.refresh();

          //@AFTER_CREATE_DATA
        },
      ),
    );
  }

  @override
  State<PurchaseTransactionItemListView> createState() =>
      PurchaseTransactionItemListController();
}
