import 'package:first_app/Models/quote.dart';
import 'package:flutter/material.dart';

class QuickQuotesScreen extends StatelessWidget {
  static const String routeName = "QuickQuotesScreen";
  final List<Quote> quotes = [
    Quote(
      quote: "While drawing I discover what I really want to say. ",
      author: "Dario Fo",
    ),
    Quote(
      quote:
          "If people only knew how hard I work to gain my mastery. It wouldn't seem so wonderful at all.",
      author: "Michelangelo",
    ),
    Quote(
      quote: "Art is never finished, only abandoned.",
      author: "Leonardo da Vinci",
    ),
    Quote(
      quote: "It’s not what you look at that matters, it’s what you see.",
      author: "Henry David Thoreau",
    ),
    Quote(
      quote:
          "People who are crazy enough to think they can change the world, are the ones who do.",
      author: "Rob Siltanen",
    ),
    Quote(
      quote: "Believe you can and you're halfway there.",
      author: "Jimmy Dean",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Quotes"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: index.isEven
                      ? Colors.blueGrey[400]
                      : Colors.blueGrey[200],
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                margin: EdgeInsets.only(
                  left: 5,
                  right: 5,
                  bottom: 5,
                  top: 5,
                ),
                constraints: BoxConstraints(
                  minHeight: 80,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '"${quotes[index].quote}" ',
                      style: TextStyle(
                          color: index.isEven ? Colors.grey[200] : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "- ${quotes[index].author}",
                          style: TextStyle(
                            color:
                                index.isEven ? Colors.grey[200] : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
