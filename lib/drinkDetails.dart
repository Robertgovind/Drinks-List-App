import 'package:drinks/main.dart';
import 'package:flutter/material.dart';

class DrinkDetails extends StatefulWidget {
  final drink;
  const DrinkDetails({super.key, @required this.drink});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
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
          backgroundColor: Colors.transparent,
          elevation: 0.1,
          title: Text(
            "${widget.drink['strDrink']}",
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.drink['idDrink'],
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    widget.drink["strDrinkThumb"],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Drinks ID: ${widget.drink["idDrink"]}",
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Drink's Name: ${widget.drink['strDrink']}",
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
