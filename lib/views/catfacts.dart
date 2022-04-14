import 'package:catfacts/controller/datafetcher.dart';
import 'package:flutter/material.dart';
import 'package:catfacts/models/data.dart';

class CatFactsHomeScreen extends StatefulWidget {
  const CatFactsHomeScreen({Key? key}) : super(key: key);

  @override
  State<CatFactsHomeScreen> createState() => _CatFactsHomeScreenState();
}

class _CatFactsHomeScreenState extends State<CatFactsHomeScreen> {
  CatFact catFact = CatFact(fact: "Waiting for fact");
  CatFact responseFact = CatFact(fact: "");
  final FetchData _fetchData = FetchData();

  @override
  void initState() {
    super.initState();
    fetchCatFact();
  }

  void fetchCatFact() async {
    responseFact = await _fetchData.getCatFact();
    setState(() {
      catFact = responseFact;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Center(
                child: Text(
                  "Cat Facts!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                ),
              ),
              Center(
                child: Text(
                  catFact.fact,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  fetchCatFact();
                },
                elevation: 0,
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Text(
                    "Get Another Cat Fact!!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
