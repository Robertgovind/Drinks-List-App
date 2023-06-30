import 'dart:convert';

import 'package:drinks/drinkDetails.dart';
import 'package:drinks/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = Uri.parse(
      "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail");
  var res;
  var drinks;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(api);
    drinks = jsonDecode(res.body)['drinks'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            bgColor,
            Color.fromARGB(255, 51, 178, 220),
            Color.fromARGB(255, 69, 202, 28)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.transparent,
          title: const Center(
            child: Text('Drinks List (Cocktails)'),
          ),
        ),
        body: Center(
          child: res == null
              ? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) {
                    var drink = drinks[index];
                    return ListTile(
                      leading: Hero(
                        tag: drink['idDrink'],
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            drink["strDrinkThumb"],
                          ),
                        ),
                      ),
                      title: Text(
                        "${drink['strDrink']}",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      subtitle: Text(
                        "${drink["idDrink"]}",
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DrinkDetails(
                                    drink: drink,
                                  ),
                              fullscreenDialog: true),
                        );
                      },
                    );
                  },
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
