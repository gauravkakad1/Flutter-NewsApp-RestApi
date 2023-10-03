import 'package:flutter/material.dart';
import 'package:news_app/Utils/constants/reusable_category_page.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}
enum Category { business , entertainment,general,health,science,sports,technology}
class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: Category.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Category"),
          bottom : TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                child: Text(Category.general.name),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                child: Text(Category.business.name),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                child: Text(Category.entertainment.name),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                child: Text(Category.health.name),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                child: Text(Category.science.name),
              ),Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                child: Text(Category.sports.name),
              ),Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                child: Text(Category.technology.name),
              ),
            ],
          ),
        ),
        body: TabBarView(
            children: <Widget>[
              ReusableCategoryPage(name: Category.general.name),
              ReusableCategoryPage(name: Category.business.name),
              ReusableCategoryPage(name: Category.entertainment.name),
              ReusableCategoryPage(name: Category.health.name),
              ReusableCategoryPage(name: Category.science.name),
              ReusableCategoryPage(name: Category.sports.name),
              ReusableCategoryPage(name: Category.technology.name),

            ]
        ),
      ),
    );
  }
}

