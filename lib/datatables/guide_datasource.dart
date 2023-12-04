import 'package:admin_dashboard/models/guide.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:provider/provider.dart';

class GuidesDTS extends DataTableSource {
  final List<Guide> guides;
  final BuildContext context;

  GuidesDTS({
    required this.guides,
    required this.context,
  });

  @override
  DataRow getRow(int index) {
    final guide = this.guides[index];

    print(guides);
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(guide.fullname!)),
        DataCell(Text(guide.description!)),
        DataCell(
          Row(
            children: [
              // IconButton(
              //   icon: Icon(Icons.edit_outlined),
              //   onPressed: () {
              //     showModalBottomSheet(
              //       backgroundColor: Colors.transparent,
              //       context: context,
              //       builder: (_) => CategoryModal(
              //         guide: guide,
              //       ),
              //     );
              //   },
              // ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red.withOpacity(0.8),
                ),
                onPressed: () {
                  final dialog = AlertDialog(
                    title: Text('¿Desea borrar esta categoría?'),
                    content: Text('¿Borrar definitivamente ${guide.fullname}?'),
                    actions: [
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Si, borrar'),
                        onPressed: () {
                          Provider.of<CategoriesProvider>(context,
                                  listen: false)
                              .deleteCategory(guide.id as String);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );

                  showDialog(context: context, builder: (_) => dialog);
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => guides.length;

  @override
  int get selectedRowCount => 0;
}
