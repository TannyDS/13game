import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_app_flutter/random_button.dart'; // Make sure this widget exists and is implemented correctly.
import 'card_brain.dart'; // Your CardBrain class should be correctly implemented

class RandomButton extends StatelessWidget {
  final VoidCallback onTap;

  RandomButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xFFFA4032),
        child: Center(
          child: Text(
            'Draw Card',
            style: GoogleFonts.notoSerifThai(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 20.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}

class CardPage extends StatefulWidget {
  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int numberOfCard = 52; // Initial deck size
  String currentCard = ""; // Current displayed card
  String currentCardExplanation =
      "พร้อมแล้วจั่วไพ่เลย"; // Default explanation text
  // To store the explanation of the previous card
  String previousCard = ""; // To store the previous card
  String previousCardExplanation = "";

  // Instance of CardBrain to manage the card logic
  late CardBrain cardBrain;

  @override
  void initState() {
    super.initState();
    cardBrain = CardBrain(); // Initialize the CardBrain class
  }

  void _drawCard() {
    print("Button pressed!"); // Check if function is triggered
    setState(() {
      if (numberOfCard > 0) {
        // Store current card as the previous card before drawing the new one
        previousCard = currentCard;
        previousCardExplanation = currentCardExplanation;

        // Generate a random card number
        int cardNumber = cardBrain.getRandomCardNumber();
        currentCard = cardBrain.getCardName(cardNumber);
        currentCardExplanation = cardBrain.getCardExplanation(cardNumber);

        numberOfCard--;
      } else {
        currentCard = "No more cards!";
        currentCardExplanation = "You have drawn all the cards!";
        restart();
      }
    });
  }

  void restart() {
    currentCard = '';
    numberOfCard = 52;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          '13 เกมสยอง',
          style: GoogleFonts.notoSerifThai(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Display the current card count
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ไพ่ใบที่แล้ว: $previousCard',
                    style: GoogleFonts.notoSerifThai(fontSize: 15.0),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Card Count: $numberOfCard',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.notoSerifThai(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Center(
                child: Text(
                  currentCard, // Display current card name (e.g. "K", "A", etc.)
                  style: GoogleFonts.notoSerifThai(
                      fontSize: 300.0, color: Color(0xFFFAB12F)),
                ),
              ),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFFFEF3E2),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(
            height: 0.1,
          ),
          Expanded(
            child: Container(
              child: Text(
                currentCardExplanation, // Display card explanation
                style: GoogleFonts.notoSerifThai(fontSize: 19.0),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(left: 20.0, top: 0.1, right: 20.0),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          RandomButton(
            onTap: _drawCard, // Call _drawCard when the button is tapped
          ),
        ],
      ),
    );
  }
}
