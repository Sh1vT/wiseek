import 'package:flutter/material.dart';
import 'package:wiseek/services/thought_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  String thought = "Tap the button to get a thought";
  String author = "";

  Future<void> getThought() async {
    List response = await ApiService.fetchThought();
    setState(() {
      thought = response[0];
      author = response[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'wiseek',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.pink.shade100,
                ),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade800),
                    children: [
                      if (thought.isNotEmpty)
                        TextSpan(
                          text: thought[0], // First letter
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                        ),
                      TextSpan(
                        text: thought.length > 1
                            ? thought.substring(1)
                            : "", // Rest of the text
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              author.isEmpty
                  ? Container()
                  : Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromARGB(255, 246, 198, 242),
                          ),
                          child: Text(
                            author,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800),
                          )),
                    ),
              Spacer(),
              Center(
                child: Image.asset(
                    "assets/images/hearts.jpg", // Replace with your image path
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain),
              ),
              IconButton(
                color: Color.fromARGB(255, 90, 94, 141),
                highlightColor: Colors.purple.shade50,
                iconSize: 30,
                icon: Icon(Icons.refresh_rounded),
                onPressed: getThought,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
