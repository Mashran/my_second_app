import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  TextEditingController searchController = TextEditingController();
  bool isSearch = true;
  List movieFilter = [];

  _MoviePageState() {
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

  List<Map<String, dynamic>> movieList = [
    {
      "title": "Upin Upin",
      "poster":
      "https://imgs.search.brave.com/aUj5_nOzu-2i1pVVkUIgXC_iGvFO1jsysPcZbTdDREE/rs:fit:1000:1200:1/g:ce/aHR0cHM6Ly93d3cu/bGF5YXIuaWQvd3At/Y29udGVudC91cGxv/YWRzLzIwMTkvMDUv/MS1wb3N0ZXItMS5q/cGc",
      "price": 20
    },
    {
      "title": "Spider-Man",
      "poster":
      "https://imgs.search.brave.com/Urhf3AS6CCFIbuwr9vr6eBHmeKYEL79Qyj7q25-7Dcw/rs:fit:1200:1200:1/g:ce/aHR0cDovL2Nkbi5j/b2xsaWRlci5jb20v/d3AtY29udGVudC91/cGxvYWRzL2FtYXpp/bmctc3BpZGVyLW1h/bi1tb3ZpZS1wb3N0/ZXIuanBn",
      "price": 30
    },
    {
      "title": "Boboiboy",
      "poster":
      "https://imgs.search.brave.com/gPryUMsW5EBchfzbrzsxQB9nz5gsSHVq4qQ7AP2Oip4/rs:fit:680:1000:1/g:ce/aHR0cHM6Ly9pbWFn/ZS50bWRiLm9yZy90/L3Avb3JpZ2luYWwv/ZWZDeHA4bGhjUU5q/Mnl6a3p1S3k0Ymxp/dlpVLmpwZw",
      "price": 15
    },
    {
      "title": "Marvel Endgame",
      "poster":
      "https://imgs.search.brave.com/M_B6RedU6SvrAYh9ab4q223o5yl1wPKpcFsxKm7PDk4/rs:fit:864:1200:1/g:ce/aHR0cDovL3d3dy5t/b3ZpZW5ld3ouY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDE5/LzAzL2F2ZW5nZXJz/LWVuZGdhbWUtbW92/aWUtcG9zdGVyLTIu/anBn",
      "price": 24
    },
    {
      "title": "Batman",
      "poster":
      "https://imgs.search.brave.com/EeCkUX5KKl8tDWArJqHXu3wcjcgVcs-e4O-CFaIZ-Dg/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9taXIt/czMtY2RuLWNmLmJl/aGFuY2UubmV0L3By/b2plY3RfbW9kdWxl/cy9mcy8wZjBjMjI4/MTcxOTYyNS41ZDA4/NDI2NzliMjdmLmpw/Zw",
      "price": 34
    },
    {
      "title": "JOKER",
      "poster":
      "https://imgs.search.brave.com/lZmOFhgNMgiEBUcPsbl155vIDCcRlqFQmNyursvo_Iw/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzBlLzM5/L2Q1LzBlMzlkNTk1/NmU1MzcwZGNkN2Zj/YTg0ZGNiNjQxYTU4/LmpwZw",
      "price": 50
    },
    {
      "title": "The Conjuring",
      "poster":
      "https://imgs.search.brave.com/vR4ezLc97BQBs7XHQtyg4NqOb5PlJq-kEVCjsN2ytMQ/rs:fit:1084:1200:1/g:ce/aHR0cDovLzMuYnAu/YmxvZ3Nwb3QuY29t/Ly1kVVpmNGc0SVRp/ay9VZlpteFZCajh1/SS9BQUFBQUFBQUhK/QS9LaVhNZ3JfYUlf/MC9zMTYwMC9UaGUr/Q29uanVyaW5nK21v/dmllK3Bvc3Rlcits/YXJnZSttYWxheXNp/YS5qcGc",
      "price": 100
    },
    {
      "title": "Chucky",
      "poster":
      "https://imgs.search.brave.com/uG93Ldt99d_HS4GlaexjypKc_I2H2GC1RH4jiidITqE/rs:fit:200:300:1/g:ce/aHR0cHM6Ly9pbWFn/ZXMtbmEuc3NsLWlt/YWdlcy1hbWF6b24u/Y29tL2ltYWdlcy9J/LzUxdzVSUExoU2xM/Ll9fQUNfU1kzMDBf/UUw3MF9NTDJfLmpw/Zw",
      "price": 12
    },
    {
      "title": "Titanic",
      "poster":
      "https://imgs.search.brave.com/T_3SKAsPCb6sqa-PMiVVuhYRdx2hvPxyUX552k3xfns/rs:fit:1000:1200:1/g:ce/aHR0cHM6Ly9waWNm/aWxlcy5hbHBoYWNv/ZGVycy5jb20vMTQw/L3RodW1iLTE5MjAt/MTQwMDI0LmpwZw",
      "price": 28
    },
    {
      "title": "Boruto",
      "poster":
      "https://imgs.search.brave.com/H1J-CXpJu0clUeO19Sgpx8MkiFJt10UwY8ayp_c8XqM/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly93d3cu/dGhlbW92aWVkYi5v/cmcvdC9wL29yaWdp/bmFsL3NEaXEyWTh3/UU5DNUhzSUFBYW1r/MjdreFFpdi5qcGc",
      "price": 80
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MOVIE"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
              label: const Text("Search Movie"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        isSearch ? createdListMovie() : performData()
      ]),
    );
  }

  Widget createdListMovie() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal, // scroll horizontal
        itemCount: movieList.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridTile(
              footer: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          movieList[index]["title"],
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "${movieList[index]["price"].toString()}RM",
                          style: const TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
              child: Image.network(movieList[index]["poster"]),
            ),
          );
        },
      ),
    );
  }

  Widget performData() {
    movieFilter = [];
    for (int i = 0; i < movieList.length; i++) {
      var item = movieList[i];
      if (item['title']
          .toLowerCase()
          .contains(searchController.text.toLowerCase())) {
        movieFilter.add(item);
      }
    }
    return showListSearchMovie();
  }

  Widget showListSearchMovie() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal, // scroll horizontal
        itemCount: movieFilter.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridTile(
              footer: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          movieFilter[index]["title"],
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "${movieFilter[index]["price"].toString()}RM",
                          style: const TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
              child: Image.network(movieFilter[index]["poster"]),
            ),
          );
        },
      ),
    );
  }
}
