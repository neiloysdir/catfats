import 'package:catfacts/controller/datafetcher.dart';
import 'package:flutter/material.dart';
import 'package:catfacts/models/data.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart'; // Import for Clipboard

class CatFactsHomeScreen extends StatefulWidget {
  const CatFactsHomeScreen({Key? key}) : super(key: key);

  @override
  State<CatFactsHomeScreen> createState() => _CatFactsHomeScreenState();
}

class _CatFactsHomeScreenState extends State<CatFactsHomeScreen> {
  CatFact catFact = CatFact(fact: "Waiting for fact");
  CatFact responseFact = CatFact(fact: "");
  final FetchData _fetchData = FetchData();
  bool isLoading = false; // Loading indicator state
  String errorMessage = ''; // Error message state

  @override
  void initState() {
    super.initState();
    fetchCatFact();
  }

  void fetchCatFact() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });
    try {
      responseFact = await _fetchData.getCatFact();
      setState(() {
        catFact = responseFact;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to fetch cat fact. Please try again!';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: catFact.fact));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fact copied!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(flex: 2),
              RotationTransition(
                turns: const AlwaysStoppedAnimation(-8 / 360),
                child: Image.asset(
                  "assets/images/catfact.png",
                  width: 300,
                  semanticLabel: 'Cat Fact Logo',
                ),
              ),
              Lottie.asset('assets/images/14476-rainbow-cat-remix.json'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            if (errorMessage.isNotEmpty)
                              Text(
                                errorMessage,
                                style: const TextStyle(color: Colors.red),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    catFact.fact,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: IconButton(
                                    onPressed: fetchCatFact,
                                    icon: const Icon(
                                      Icons.autorenew,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: IconButton(
                                    onPressed: copyToClipboard,
                                    icon: const Icon(
                                      Icons.copy,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
