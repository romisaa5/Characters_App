import 'package:characters_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key, required this.onSearch});

  final Function(String) onSearch;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  bool isSearch = false;
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimaryColor,
      leading: isSearch
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: kScondryColor),
              onPressed: _stopSearching,
            )
          : null,
      title: isSearch ? buildAppbarSearch() : buildAppbarTitle(),
      actions: buildAppBarActions(),
    );
  }

  List<Widget> buildAppBarActions() {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            _searchTextController.clear();
            widget.onSearch('');
          },
          icon: Icon(Icons.clear, color: kScondryColor),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearching,
          icon: Icon(Icons.search, color: kScondryColor),
        ),
      ];
    }
  }

  void startSearching() {
    setState(() {
      isSearch = true;
    });
  }

  void _stopSearching() {
    setState(() {
      isSearch = false;
      _searchTextController.clear();
      widget.onSearch(''); // يعيد عرض جميع الشخصيات
    });
  }

  Widget buildAppbarTitle() {
    return Text(
      'Characters',
      style: TextStyle(
        color: kScondryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildAppbarSearch() {
    return TextField(
      controller: _searchTextController,
      cursorColor: kBackground,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: kScondryColor, fontSize: 18),
      ),
      style: TextStyle(color: kScondryColor, fontSize: 18),
      onChanged: (query) {
        widget.onSearch(query); // البحث يتم في `HomeScreen`
      },
    );
  }
}
