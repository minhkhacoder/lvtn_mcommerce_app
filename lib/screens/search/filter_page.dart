// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mcommerce_app/models/category_model.dart';
import 'package:mcommerce_app/providers/search_provider.dart';
import 'package:mcommerce_app/screens/search/search_key_page.dart';
import 'package:provider/provider.dart';

import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/providers/brand_provider.dart';
import 'package:mcommerce_app/providers/category_provider.dart';
import 'package:mcommerce_app/screens/search/widgets/app_bar_filter_widget.dart';
import 'package:mcommerce_app/widgets/stateless/button_widget.dart';

class FilterPage extends StatefulWidget {
  final String? selectedCategories;
  FilterPage({
    Key? key,
    this.selectedCategories,
  }) : super(key: key);
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<Map<String, dynamic>> sortby = [
    {"id": "lth", "label": "Low to High"},
    {"id": "htl", "label": "High to Low"},
    {"id": "popularity", "label": "Popularity"},
    {"id": "new", "label": "New"},
  ];

  List<Childrens> categories = [];

  List<String> _selectedCategories = [];
  List<String> _selectedBrands = [];
  List<String> selectedSortBy = [];

  double selectedPrice = 0;
  double maxPrice = 5000;

  double selectedRating = 0;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      final searchProvider =
          Provider.of<SearchProvider>(context, listen: false);
      if (widget.selectedCategories.toString() != "null") {
        _selectedCategories = [widget.selectedCategories!];
        _selectedBrands = searchProvider.brands;
      } else {
        _selectedBrands = [];
        _selectedCategories = [];
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      final categoryProvider =
          Provider.of<CategoryProvider>(context, listen: true);
      if (categoryProvider.childrens.isNotEmpty) {
        categories = categoryProvider.childrens;
      } else {
        categories = [];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: PreferredSize(
          child: AppBarFilterWidget(), preferredSize: Size.fromHeight(88.0)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                            color: AppColors.darkGray,
                            fontFamily: AppFontFamily.fontSecondary,
                            fontSize: 14,
                            letterSpacing: -0.15),
                      ),
                      Text(
                        '\$${selectedPrice.round()}',
                        style: TextStyle(
                            color: AppColors.darkGray,
                            fontFamily: AppFontFamily.fontSecondary,
                            fontSize: 14,
                            letterSpacing: -0.15),
                      ),
                      Text(
                        '\$${maxPrice.round()}',
                        style: TextStyle(
                            color: AppColors.darkGray,
                            fontFamily: AppFontFamily.fontSecondary,
                            fontSize: 14,
                            letterSpacing: -0.15),
                      ),
                    ],
                  ),
                  Slider(
                    value: selectedPrice,
                    min: 0,
                    max: maxPrice,
                    divisions: maxPrice.round(),
                    activeColor: AppColors.primary,
                    inactiveColor: Colors.purple[100],
                    onChanged: (value) {
                      setState(() {
                        selectedPrice = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButtonFormField<String>(
                  menuMaxHeight: 400.0,
                  style: TextStyle(
                      color: AppColors.darkGray,
                      fontFamily: AppFontFamily.fontSecondary,
                      fontSize: 14,
                      letterSpacing: -0.15),
                  value: _selectedCategories.isNotEmpty
                      ? _selectedCategories[0]
                      : null,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCategories.clear();
                      _selectedCategories.add(newValue!);
                    });
                  },
                  items: categories.map<DropdownMenuItem<String>>((category) {
                    return DropdownMenuItem<String>(
                      value: category.id,
                      child: Text(category.label.toString()),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    hintText: 'Select categories',
                    hintStyle: TextStyle(
                        color: AppColors.darkGray,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 14,
                        letterSpacing: -0.15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: AppColors.grayLight),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Brand',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Consumer<BrandProvider>(builder: (context, brandProvider, child) {
              final brands = brandProvider.brands;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Text(
                                'Selected Brands (${_selectedBrands.length})',
                                style: TextStyle(
                                    color: AppColors.darkGray,
                                    fontFamily: AppFontFamily.fontSecondary,
                                    fontSize: 14,
                                    letterSpacing: -0.15),
                              ),
                            ],
                          ),
                        );
                      },
                      body: brands.length > 0
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: brands
                                    .map(
                                      (brand) => ChoiceChip(
                                        label: Text(
                                          brand.label.toString(),
                                          style: TextStyle(
                                            fontFamily:
                                                AppFontFamily.fontSecondary,
                                            fontSize: 14,
                                            letterSpacing: -0.15,
                                            color: _selectedBrands
                                                    .contains(brand.id)
                                                ? Colors.white
                                                : AppColors.primary,
                                          ),
                                        ),
                                        backgroundColor:
                                            _selectedBrands.contains(brand.id)
                                                ? AppColors.primary
                                                : Colors.purple[50],
                                        selected:
                                            _selectedBrands.contains(brand.id),
                                        onSelected: (selected) {
                                          setState(() {
                                            if (selected) {
                                              _selectedBrands
                                                  .add(brand.id.toString());
                                            } else {
                                              _selectedBrands
                                                  .remove(brand.id.toString());
                                            }
                                          });
                                        },
                                        selectedColor: AppColors.primary,
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Text("Can't found brands"),
                              ),
                            ),
                      isExpanded: _isExpanded,
                    ),
                  ],
                ),
              );
            }),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Rating',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0",
                        style: TextStyle(
                            color: AppColors.darkGray,
                            fontFamily: AppFontFamily.fontSecondary,
                            fontSize: 14,
                            letterSpacing: -0.15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 1; i <= 5; i++)
                            if (i <= selectedRating.floor())
                              Icon(
                                Icons.star,
                                color: AppColors.orange,
                              )
                            else if (i == selectedRating.ceil() &&
                                selectedRating % 1 != 0)
                              Icon(Icons.star_half)
                            else
                              Icon(
                                Icons.star,
                                color: AppColors.gray,
                              ),
                        ],
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                            color: AppColors.darkGray,
                            fontFamily: AppFontFamily.fontSecondary,
                            fontSize: 14,
                            letterSpacing: -0.15),
                      ),
                    ],
                  ),
                  Slider(
                    value: selectedRating,
                    min: 0,
                    max: 5,
                    activeColor: AppColors.primary,
                    inactiveColor: Colors.purple[100],
                    divisions: 5,
                    onChanged: (value) {
                      setState(() {
                        selectedRating = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sort by',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButtonFormField<String>(
                  style: TextStyle(
                      color: AppColors.darkGray,
                      fontFamily: AppFontFamily.fontSecondary,
                      fontSize: 14,
                      letterSpacing: -0.15),
                  value: selectedSortBy.isNotEmpty ? selectedSortBy[0] : null,
                  onChanged: (newValue) {
                    setState(() {
                      selectedSortBy.clear();
                      selectedSortBy.add(newValue!);
                    });
                  },
                  items: sortby.map<DropdownMenuItem<String>>(
                      (Map<String, dynamic> value) {
                    return DropdownMenuItem<String>(
                      value: value['id'],
                      child: Text(value['label']),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    hintText: 'Select sort by',
                    hintStyle: TextStyle(
                        color: AppColors.darkGray,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 14,
                        letterSpacing: -0.15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: AppColors.grayLight),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          StadiumBorder(side: BorderSide.none),
        ),
        notchMargin: 2.0,
        child: Container(
          height: 120,
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 16),
                  width: MediaQuery.of(context).size.width,
                  child: ButtonWidget(
                      label: "Apply Filters",
                      onPressed: () {
                        final searchProvider =
                            Provider.of<SearchProvider>(context, listen: false);
                        String? catId = "";

                        if (_selectedCategories.isNotEmpty) {
                          catId = _selectedCategories[0];
                        }

                        searchProvider.filterProducts(selectedPrice, catId,
                            _selectedBrands, selectedRating);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SearchKeyPage(
                                    title: 'Search',
                                  )),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
