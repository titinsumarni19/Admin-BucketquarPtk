import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class UserProfileListView extends StatefulWidget {
  UserProfileListView({
    Key? key,
  }) : super(key: key);

  Widget build(context, UserProfileListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile List"),
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
                label: "User Profile Name",
                validator: Validator.required,
                value: controller.userProfileName,
                onChanged: (value) {
                  controller.userProfileName = value;
                },
              ),
              QDropdownField(
                label: "Gender",
                validator: Validator.required,
                items: [
                  {"label": "Male", "value": "Male"},
                  {"label": "Female", "value": "Female"}
                ],
                value: controller.gender,
                onChanged: (value, label) {
                  controller.gender = value;
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
              QDropdownField(
                label: "Role",
                validator: Validator.required,
                items: [
                  {"label": "Admin", "value": "Admin"},
                  {"label": "User", "value": "User"}
                ],
                value: controller.role,
                onChanged: (value, label) {
                  controller.role = value;
                },
              ),
              QDropdownField(
                label: "Is Active",
                validator: Validator.required,
                items: [
                  {
                    "label": "Yes",
                    "value": true,
                  },
                  {
                    "label": "No",
                    "value": false,
                  }
                ],
                value: controller.isActive,
                onChanged: (value, label) {
                  controller.isActive = value;
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
              future: UserProfileService().getAll(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                imageUrl: controller.imageUrl,
                userProfileName: controller.userProfileName,
                gender: controller.gender,
                email: controller.email,
                password: controller.password,
                role: controller.role,
                isActive: controller.isActive,
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
                  label: "User Profile Name",
                ),
                ListRowHeaderItem(
                  label: "Gender",
                ),
                ListRowHeaderItem(
                  label: "Email",
                ),
                ListRowHeaderItem(
                  label: "Role",
                ),
                ListRowHeaderItem(
                  label: "Is Active",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              itemBuilder: (itemMap, index) {
                UserProfile item = UserProfile.fromJson(itemMap);

                return ListTileRow(
                  key: Key("user_profile_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.tor(UserProfileFormView(item: item));
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
                      label: "User Profile Name",
                      value: item.userProfileName,
                    ),
                    ListRowItem(
                      label: "Gender",
                      value: item.gender,
                    ),
                    ListRowItem(
                      label: "Email",
                      value: item.email,
                    ),
                    ListRowItem(
                      label: "Role",
                      value: item.role,
                    ),
                    ListRowItem(
                      label: "Is Active",
                      value: item.isActive,
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
          await Get.tor(UserProfileFormView());
          controller.refresh();

          //@AFTER_CREATE_DATA
        },
      ),
    );
  }

  @override
  State<UserProfileListView> createState() => UserProfileListController();
}
