import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ProductCategoryListView extends StatefulWidget {
  ProductCategoryListView({
    Key? key,
  }) : super(key: key);

  Widget build(context, ProductCategoryListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Category List"),
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
                label: "Product Category Name",
                validator: Validator.required,
                value: controller.productCategoryName,
                onChanged: (value) {
                  controller.productCategoryName = value;
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
              future: ProductCategoryService().getAll(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                imageUrl: controller.imageUrl,
                productCategoryName: controller.productCategoryName,
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
                  label: "Product Category Name",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              itemBuilder: (itemMap, index) {
                ProductCategory item = ProductCategory.fromJson(itemMap);

                return ListTileRow(
                  key: Key("product_category_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.tor(ProductCategoryFormView(item: item));
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
                      label: "Product Category Name",
                      value: item.productCategoryName,
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
          await Get.tor(ProductCategoryFormView());
          controller.refresh();

          //@AFTER_CREATE_DATA
        },
      ),
    );
  }

  @override
  State<ProductCategoryListView> createState() =>
      ProductCategoryListController();
}
