import 'package:admin_dashboard/datatables/guide_datasource.dart';
import 'package:admin_dashboard/providers/guide_provider.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/buttons/custon_icon_buttom.dart';

import 'package:admin_dashboard/datatables/categories_datasource.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';

class GuidesView extends StatefulWidget {
  @override
  State<GuidesView> createState() => _GuidesViewState();
}

class _GuidesViewState extends State<GuidesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<GuideProvider>(context, listen: false).getAllGuides();
  }

  @override
  Widget build(BuildContext context) {
    final guides = Provider.of<GuideProvider>(context).guides;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Guide',
            style: CustomLabels.h1,
          ),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('fullname')),
              DataColumn(label: Text('description')),
              DataColumn(label: Text('actions')),
            ],
            source: GuidesDTS(
              guides: guides,
              context: context,
            ),
            header: Text(
              'Guides  ',
              maxLines: 2,
            ),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(
                      categoria: null,
                    ),
                  );
                },
                text: 'Crear',
                icon: Icons.add_outlined,
              )
            ],
          ),
        ],
      ),
    );
  }
}
