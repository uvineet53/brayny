class Constants {
  final String _apiKey =
      "288c29ff411c0075daef1dd894db0eab2e956eca572e1d8b807a3e2338fdd0dc/stage";
  String get apiKey => _apiKey;
  final int _timerDuration = 15;
  int get timerDuration => _timerDuration;
  String get about => _about;
  final String _about = "...";

  static final oppositesData = [
    {'question': 'What is the opposite of big?', 'result': 'Small'},
    {'question': 'What is the opposite of light?', 'result': 'Dark'},
    {'question': 'What is the opposite of tall?', 'result': 'Short'},
    {'question': 'What is the opposite of thick?', 'result': 'Thin'},
    {'question': 'What is the opposite of bottom?', 'result': 'Top'},
  ];
  static final articleData = [
    {'question': 'I am dash university student.', 'result': 'a'},
    {'question': 'She returned after dash hour.', 'result': 'an'},
    {'question': 'I met dash boy in the store.', 'result': 'a'},
    {'question': 'I want dash apple from that basket.', 'result': 'an'},
    {'question': 'dash ink in my pen is red', 'result': 'An'},
  ];

  static final vowelData = [
    {
      'question': 'How many vowels are there in English alphabets?',
      'result': '5'
    },
    {'question': 'The consonants in the word “undo” are', 'result': 'u and n'},
    {'question': 'Find the odd one out: a, w, i, u, e', 'result': 'w'},
    {'question': 'What is the vowel in the word "busy"?', 'result': 'u'},
    {
      'question': 'How many consonants are there in the English alphabet?',
      'result': '21'
    },
  ];
  static final rhymingData = [
    {'question': 'I had some sand in my ?', 'result': 'hand'},
    {'question': 'The man cooked beans in the ?', 'result': 'pan'},
    {'question': 'The mouse ran in the ?', 'result': 'house'},
    {'question': 'The frog jumped on the ?', 'result': 'log'},
    {'question': 'The cat chased the ?', 'result': 'rat'},
  ];
}
