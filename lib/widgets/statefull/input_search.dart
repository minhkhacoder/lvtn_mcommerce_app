import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/providers/category_provider.dart';
import 'package:mcommerce_app/providers/search_provider.dart';
import 'package:mcommerce_app/screens/search/SearchPage.dart';
import 'package:mcommerce_app/screens/search/search_key_page.dart';
import 'package:provider/provider.dart';

class InputSearch extends StatefulWidget {
  final String hintsText;
  final FormFieldSetter<String>? onSaved;
  const InputSearch({Key? key, required this.hintsText, this.onSaved})
      : super(key: key);

  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 44,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.dark.withOpacity(0.2),
                    blurRadius: 7,
                    offset: Offset(0, 1))
              ]),
          child: TextFormField(
            controller: this._controller,
            decoration: InputDecoration(
                hintText: widget.hintsText,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.darkGray,
                ),
                prefixStyle: TextStyle(color: AppColors.darkGray)),
            cursorColor: AppColors.dark,
            onSaved: widget.onSaved,
            onTap: () async {
              showSearch(context: context, delegate: CustomSearch());
            },
          ),
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    "Cycling",
    "Golf",
    "Running",
    "Tennis",
    "Soccer",
    "Football",
    "Swimming",
    "Volleyball",
  ];
  List<String> macthQuery = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(
            Icons.clear,
            size: 18,
          )),
      IconButton(
          onPressed: () async {
            final searchProvider =
                Provider.of<SearchProvider>(context, listen: false);
            await searchProvider.searchProductByKey(query);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchKeyPage(title: "Search")),
            );
          },
          icon: Icon(
            Icons.search,
            color: AppColors.primary,
            size: 30,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.layoutPage);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
        itemCount: macthQuery.length,
        itemBuilder: (context, index) {
          var result = macthQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () async {
              final searchProvider =
                  Provider.of<SearchProvider>(context, listen: false);
              await searchProvider.searchProductByKey(result);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchKeyPage(title: result)),
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    macthQuery = [];

    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        macthQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: macthQuery.length,
        itemBuilder: (context, index) {
          var result = macthQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () async {
              final searchProvider =
                  Provider.of<SearchProvider>(context, listen: false);
              await searchProvider.searchProductByKey(result);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchKeyPage(title: result)),
              );
            },
          );
        });
  }
}
