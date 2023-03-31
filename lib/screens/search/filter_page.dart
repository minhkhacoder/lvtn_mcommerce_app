import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/screens/search/widgets/app_bar_filter_widget.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> categories = ['Category 1', 'Category 2', 'Category 3'];
  List<String> selectedCategories = [];

  Set<String> brands = {'Brand 1', 'Brand 2', 'Brand 3'};
  Set<String> selectedBrands = {};

  double selectedPrice = 0;
  double maxPrice = 1000;

  double selectedRating = 0;

  String sortBy = 'Price';

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
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Column(
              children: categories
                  .map((category) => CheckboxListTile(
                        title: Text(category),
                        value: selectedCategories.contains(category),
                        onChanged: (bool? value) {},
                      ))
                  .toList(),
            ),
            Divider(),
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
                      Text('0'),
                      Text('\$${selectedPrice.round()}'),
                      Text('\$${maxPrice.round()}'),
                    ],
                  ),
                  Slider(
                    value: selectedPrice,
                    min: 0,
                    max: maxPrice,
                    divisions: maxPrice.round(),
                    onChanged: (value) {
                      setState(() {
                        selectedPrice = value;
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
                'Brand',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Column(
              children: brands
                  .map((brand) => CheckboxListTile(
                        title: Text(brand),
                        value: selectedBrands.contains(brand),
                        onChanged: (bool? value) {},
                      ))
                  .toList(),
            ),
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
                      Text('0'),
                      Text(selectedRating.toString()),
                      Text('5'),
                    ],
                  ),
                  Slider(
                    value: selectedRating,
                    min: 0,
                    max: 5,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<String>(
                value: sortBy,
                onChanged: (String? newValue) {},
                items: <String>['Price', 'Rating', 'Brand', 'Category']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Apply Filters'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
