import 'dart:math';

class MyFunctions {

  int generateRandomCode() {
    Random _random = Random();
    int min = 10;
    int max = 100;
    int result = min + _random.nextInt(max - min);
    return result;
  }

}
