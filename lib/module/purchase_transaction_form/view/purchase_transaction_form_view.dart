import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class PurchaseTransactionFormView extends StatefulWidget {
  final PurchaseTransaction? item;
  const PurchaseTransactionFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, PurchaseTransactionFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Transaction Form"),
        actions: const [],
      ),
      body: FormColumn(
        key: Key("purchase_transaction_form"),
        isEditMode: controller.isEditMode,
        formKey: controller.formKey,
        children: [
          //::FORM
          SupplierAutocompleteField(
            label: "Supplier",
            validator: Validator.required,
            value: controller.supplierId?.toString(),
            onChanged: (value, label, mapValue) {
              controller.supplierId = value;
            },
          ),
          QDropdownField(
            label: "Payment Method",
            validator: Validator.required,
            items: [
              {"label": "Cash", "value": "Cash"},
              {"label": "Bank Transfer", "value": "Bank Transfer"},
              {"label": "Emoney", "value": "Emoney"}
            ],
            value: controller.paymentMethod,
            onChanged: (value, label) {
              controller.paymentMethod = value;
            },
          ),
          QDropdownField(
            label: "Order Status",
            validator: Validator.required,
            items: [
              {"label": "Order created", "value": "Order created"},
              {"label": "Order packed", "value": "Order packed"},
              {
                "label": "Handed over to driver",
                "value": "Handed over to driver"
              },
              {"label": "In transit", "value": "In transit"},
              {"label": "Received", "value": "Received"},
              {"label": "Completed", "value": "Completed"}
            ],
            value: controller.orderStatus,
            onChanged: (value, label) {
              controller.orderStatus = value;
            },
          ),
        ],
        //@DETAIL_LIST_VIEW
        itemDetailListView: [
          if (controller.isEditMode) ...[
            Expanded(
              child: PurchaseTransactionItemListView(
                purchaseTransactionId: controller.id,
              ),
            ),
          ],
        ],
        //@:DETAIL_LIST_VIEW
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () => controller.save(),
      ),
    );
  }

  @override
  State<PurchaseTransactionFormView> createState() =>
      PurchaseTransactionFormController();
}
