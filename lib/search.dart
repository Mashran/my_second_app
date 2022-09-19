import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> countryList = [
    "Indonesia",
    "Malaysia",
    "Singapore",
    "Thailand",
    "Kamboja",
    "China",
    "Korea",
    "Brazil",
    "Argentina",
    "Arab Saudi",
    "Palestine",
    "Laos",
    "Filipina",
    "Brunei"
  ];

  TextEditingController searchController = TextEditingController();
  bool isSearch = true;
  List<String> countryFilter = [];

  _SearchPageState() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          isSearch = true;
        });
      } else {
        setState(() {
          isSearch = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SEARCH"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.1),
                label: const Text("Search Country"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            isSearch ? createdListData() : performData()
          ],
        ),
      ),
    );
  }

  Widget createdListData() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: countryList.length,
        itemBuilder: ((context, index) {
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.blue.withOpacity(0.1),
            child: ListTile(
              title: Text(countryList[index]),
            ),
          );
        }),
      ),
    );
  }

  Widget performData() {
    countryFilter = [];
    for (int i = 0; i < countryList.length; i++) {
      var item = countryList[i];
      if (item.toLowerCase().contains(searchController.text.toLowerCase())) {
        countryFilter.add(item);
      }
    }
    return showListSearchCountry();
  }

  Widget showListSearchCountry() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: countryFilter.length,
        itemBuilder: ((context, index) {
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.blue.withOpacity(0.1),
            child: ListTile(
              title: Text(countryFilter[index]),
            ),
          );
        }),
      ),
    );
  }
}
