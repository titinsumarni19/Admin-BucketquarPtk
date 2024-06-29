import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class CustomerListView extends StatefulWidget {
  CustomerListView({
    Key? key,
  }) : super(key: key);

  Widget build(context, CustomerListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Customer List"),
        actions: [
          //@SEARCH
          StreamSearch(
            onFilter: () => controller.updateFilter(),
            onReset: () => controller.resetFilter(),
            onDeleteAll: () => controller.deleteAll(),
            filterMode: controller.isFilterMode,
            widgets: [
              //::FILTER_FORM
              QTextField(
                label: "Customer Name",
                validator: Validator.required,
                value: controller.customerName,
                onChanged: (value) {
                  controller.customerName = value;
                },
              ),
              QTextField(
                label: "Email",
                validator: Validator.email,
                value: controller.email,
                onChanged: (value) {
                  controller.email = value;
                },
              ),
              QTextField(
                label: "Phone",
                validator: Validator.required,
                value: controller.phone,
                onChanged: (value) {
                  controller.phone = value;
                },
              ),
              QTextField(
                label: "Address",
                validator: Validator.required,
                value: controller.address,
                onChanged: (value) {
                  controller.address = value;
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
              future: CustomerService().getAll(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                imageUrl: controller.imageUrl,
                customerName: controller.customerName,
                email: controller.email,
                phone: controller.phone,
                address: controller.address,
                createdAtFrom: controller.createdAtFrom,
                createdAtTo: controller.createdAtTo,
                updatedAtFrom: controller.updatedAtFrom,
                updatedAtTo: controller.updatedAtTo,
              ),
              padding: EdgeInsets.all(12.0),
              headers: [
                //::LIST_VIEW_HEADER
                ListRowHeaderItem(
                  label: "Id",
                ),
                ListRowHeaderItem(
                  label: "Image Url",
                ),
                ListRowHeaderItem(
                  label: "Customer Name",
                ),
                ListRowHeaderItem(
                  label: "Email",
                ),
                ListRowHeaderItem(
                  label: "Phone",
                ),
                ListRowHeaderItem(
                  label: "Address",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              itemBuilder: (itemMap, index) {
                Customer item = Customer.fromJson(itemMap);

                return ListTileRow(
                  key: Key("customer_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.tor(CustomerFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowItem(
                      label: "Id",
                      value: item.id,
                    ),
                    ListRowImageItem(
                      label: "Image Url",
                      value: item.imageUrl,
                    ),
                    ListRowItem(
                      label: "Customer Name",
                      value: item.customerName,
                    ),
                    ListRowItem(
                      label: "Email",
                      value: item.email,
                    ),
                    ListRowItem(
                      label: "Phone",
                      value: item.phone,
                    ),
                    ListRowItem(
                      label: "Address",
                      value: item.address,
                    ),
                    ListRowItem(
                      label: "Created At",
                      value: item.createdAt,
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
          await Get.tor(CustomerFormView());
          controller.refresh();

          //@AFTER_CREATE_DATA
        },
      ),
    );
  }

  @override
  State<CustomerListView> createState() => CustomerListController();
}
