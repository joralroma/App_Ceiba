const bool isProduction = bool.fromEnvironment('dart.vm.product');

class Config {
  bool prod = isProduction;
  String urlBackDev   = 'https://jsonplaceholder.typicode.com/';
  String urlBackProd  = 'https://jsonplaceholder.typicode.com/';
}
