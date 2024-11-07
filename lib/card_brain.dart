import 'dart:math';

class CardBrain {
  List<String> _cardNames = [
    'A',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'J',
    'Q',
    'K'
  ];
  List<String> _cardExplanations = [
    'ไพ่ A  \nให้ใครก็ได้ 1 คนกินครึ่งแก้ว', //1
    'ไพ่หมายเลข 2  \nให้ใครก็ได้ 2 คนกินครึ่งแก้ว', //2
    'ไพ่หมายเลข 3  \nให้ใครก็ได้ 2 คนและตัวเอง กินครึ่งแก้ว', //3
    'ไพ่หมายเลข 4  \nให้ใครก็ได้ 1 คนกินหมดแก้ว', //4
    'ไพ่หมายเลข 5  \nให้ใครก็ได้ 2 คนกินหมดแก้ว', //5
    'ไพ่หมายเลข 6  \nใครก็ได้ 2 คนและตัวเอง กินหมดแก้ว', //6
    'ไพ่หมายเลข 7  \nเล่นเกมสูตรคูณ', //7
    'ไพ่หมายเลข 8  \nเล่นเกม ห้ะ อะไรนะ', //8
    'ไพ่หมายเลข 9 \nคนทางซ้ายของผู้หยิบไพ่กินหมดแก้ว', //9
    'ไพ่หมายเลข 10 \nคนทางขวาของผู้หยิบไพ่กินหมดแก้ว', //10
    'ไพ่ J  \nผู้หยิบไพ่กินเองหมดแก้ว', //11
    'ไพ่ Q  \nห้ามผู้เล่นทุกคนตอบคนที่ได้ Q ใครตอบกินหมดแก้ว (มีผลจนกว่าจะมีคนได้ Q ใบต่อไป)', //12
    'ไพ่ K  \nทั้งวงกินหมดแก้ว และผู้ที่ได้ K สามารถสั่งให้ใครก็ได้กินเพิ่มอีก 1 แก้ว', //13
  ];

  // Generate a random card number between 1 and 13
  int getRandomCardNumber() {
    return Random().nextInt(13) + 1;
  }

  // Get the card name based on card number
  String getCardName(int cardNumber) {
    return _cardNames[cardNumber - 1]; // cardNumber is 1-based, so subtract 1
  }

  // Get the explanation based on card number
  String getCardExplanation(int cardNumber) {
    return _cardExplanations[cardNumber - 1]; // cardNumber is 1-based
  }
}
