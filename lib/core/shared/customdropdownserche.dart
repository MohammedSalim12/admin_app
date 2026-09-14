import 'package:admen_app/core/constant/appcolor.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CustomDropDownSerche extends StatefulWidget {
  final String title;
  final List<SelectedListItem<NameIdItem>> listdata;
  final TextEditingController dropdownselectedName;
  final TextEditingController dropdownselectedId;

  CustomDropDownSerche({
    Key? key,
    required this.title,
    required this.listdata,
    required this.dropdownselectedName,
    required this.dropdownselectedId,
  }) : super(key: key);

  @override
  _CustomdropdownsercheState createState() => _CustomdropdownsercheState();
}

class _CustomdropdownsercheState extends State<CustomDropDownSerche> {
  void showDropdownSerach() async {
    await DropDownState(
      dropDown: DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        submitButtonText: 'Save',
        clearButtonText: 'Clear',
        data: widget.listdata,

        onSelected: (selectedItems) {
          SelectedListItem selectedListItem = selectedItems.first;
          widget.dropdownselectedName.text = selectedListItem.data.name;
          widget.dropdownselectedId.text = selectedListItem.data.id!;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.dropdownselectedName,
      cursorColor: Colors.black,
      onTap: () {
        FocusScope.of(context).unfocus();
        showDropdownSerach();
      },
      decoration: InputDecoration(
        hintText: widget.dropdownselectedName.text == ""
            ? widget.title
            : widget.dropdownselectedName.text,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Text(widget.dropdownselectedName.text == ""
            ? widget.title
            : widget.dropdownselectedName.text,),
          suffixIcon: InkWell(
            onTap: () {},
            child: Icon(Icons.arrow_drop_down, size: 20, color: Appcolor.grey),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      // decoration: InputDecoration(
      //   filled: true,
      //   fillColor: Colors.black12,
      //   contentPadding: const EdgeInsets.only(
      //     left: 8,
      //     bottom: 0,
      //     top: 0,
      //     right: 15,
      //   ),
      //   hintText: widget.dropdownselectedName.text == ""
      //       ? widget.title
      //       : widget.dropdownselectedName.text,
      //   border: const OutlineInputBorder(
      //     borderSide: BorderSide(width: 0, style: BorderStyle.none),
      //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
      //   ),
      // ),
    );
  }
}

class NameIdItem {
  final String name;
  final String id;
  NameIdItem({required this.name, required this.id});

  @override
  String toString() => name; // عشان يترسم بشكل صحيح بالـ dropdown
}
