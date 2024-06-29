// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/util/type_extension/key_extension.dart';
import 'package:hyper_ui/shared/widget/card/card.dart';
import 'package:hyper_ui/shared/widget/list/list_tile_widget.dart';

import '../dismissible/dismissible.dart';

class ListTileRow extends StatelessWidget {
  final bool isEditMode;
  final Function? onDismiss;
  final Function? onTap;
  final List<Widget> children;
  final int index;
  const ListTileRow({
    Key? key,
    this.onDismiss,
    this.onTap,
    this.isEditMode = false,
    this.children = const [],
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tableName = key?.getTableName("_list_tile_row");
    Module? module;
    if (tableName != null) {
      module = ModuleConfig.getModule(tableName)!;
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isTablet = MediaQuery.of(context).size.width < 1100 &&
            MediaQuery.of(context).size.width >= 850;
        bool isDesktop = MediaQuery.of(context).size.width >= 1100;
        bool isMobile = MediaQuery.of(context).size.width < 850;

        bool tableMode = isDesktop || isTablet;
        Color rowColor = index % 2 == 0 ? Colors.grey[100]! : Colors.grey[200]!;
        //mobile
        return QDismissible(
          onDismiss: () {
            if (onDismiss != null) {
              onDismiss!();
            }
          },
          child: InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              onTap?.call();
            },
            child: Container(
              child: Container(
                padding: const EdgeInsets.all(0.0),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: rowColor,
                  // border: Border.all(
                  //   width: 0.0,
                  //   color: rowColor,
                  // ),
                  // border: Border.all(
                  //   width: 0.6,
                  //   color: Color(0xffdfdfdf),
                  // ),
                  border: Border(
                    left: BorderSide(
                      width: 1.0,
                      color: Colors.grey[300]!,
                    ),
                  ),
                ),
                child: tableMode
                    ? IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: List.generate(
                            children.length,
                            (colIndex) {
                              var w = children[colIndex] as dynamic;
                              if (module != null) {
                                var label = w.label
                                    .toString()
                                    .toLowerCase()
                                    .replaceAll(" ", "_");
                                if (module.subEditTableHiddenFields
                                        ?.contains(label) ==
                                    true) return Container();
                              }

                              // if (w is ListRowImageItem) return SizedBox.shrink();

                              var columns = [];
                              var values = [];

                              if (colIndex == 0) {
                                columns.add(w.label);
                              }
                              values.add(w.value);

                              var value = w.value;
                              var align = TextAlign.left;

                              if (value is int || value is double) {
                                align = TextAlign.right;
                              }

                              var label = w.label.toString().toLowerCase();

                              var (flex, width, height) =
                                  getFlexWidthHeightByLabelValue(label, value);

                              if (module != null) {
                                var columKeyName = label.toFileName();
                                if (module.listViewHiddenFields
                                        ?.contains(columKeyName) ==
                                    true) {
                                  return SizedBox.shrink();
                                }
                              }

                              return Expanded(
                                flex: flex,
                                child: Container(
                                  width: width,
                                  height: height,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey[300]!,
                                      ),
                                      right: BorderSide(
                                        width: 1.0,
                                        color: Colors.grey[300]!,
                                      ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(12.0),
                                  child: getListTileWidget(label, value, align),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    :
                    //Mobile version
                    Builder(builder: (context) {
                        List<Widget> visibleChildren = children;
                        if (module != null && module.subEditMode == true) {
                          visibleChildren.removeWhere((e) {
                            bool isHidden = false;
                            var label = (e as ListRowItem)
                                .label
                                .toString()
                                .toLowerCase()
                                .replaceAll(" ", "_");
                            isHidden = module!.subEditTableHiddenFields!
                                .contains(label);
                            isHidden =
                                module.listViewHiddenFields!.contains(label);

                            return isHidden;
                          });
                        }
                        return Column(
                          children: visibleChildren,
                        );
                      }),
              ),
            ),
          ),
        ).amMoveAndFadeIndex(index);
      },
    );
  }
}
