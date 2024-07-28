import 'package:flutter/material.dart';

class Offerspage extends StatelessWidget {
  const Offerspage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offer(
            offer: "this is the offer i am giving.",
            description: "buy one get one free"),
        Offer(
            offer: "this is the offer i am giving.",
            description: "buy one get one free"),
        Offer(
            offer: "this is the offer i am giving.",
            description: "buy one get one free"),
        Offer(
            offer: "this is the offer i am giving.",
            description: "buy one get one free"),
        Offer(
            offer: "this is the offer i am giving.",
            description: "buy one get one free"),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  final String offer;
  final String description;

  const Offer({super.key, required this.offer, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        elevation: 7,
        color: Colors.amber.shade50,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.png"),
          )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Container(
                  color: Colors.amber.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      offer,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Container(
                  color: Colors.amber.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
