import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/models/usuario.dart';

class UsersDTS extends DataTableSource {
  List<Usuario> users;

  UsersDTS(this.users);

  @override
  DataRow getRow(int index) {
    final user = users[index];

    final image = (user.img == null)
        ? Image(
            image: AssetImage('noimage.jpg'),
            width: 35,
            height: 35,
          )
        : FadeInImage.assetNetwork(
            placeholder: 'loader.gif',
            image: user.img!,
            width: 35,
            height: 35,
          );

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(ClipOval(
          child: image,
        )),
        DataCell(Text(user.nombre)),
        DataCell(Text(user.correo)),
        DataCell(Text(user.uid)),
        DataCell(
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {
              NavigationService.replaceTo('/dashboard/users/${user.uid}');
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
