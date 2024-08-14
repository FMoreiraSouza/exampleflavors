enum FlavorTypes { empresa1, empresa2 }

class Flavor {
  Flavor._instance();

  static late FlavorTypes flavorType;

  static String get flavorMessage {
    switch (flavorType) {
      case FlavorTypes.empresa1:
        return 'Empresa 1';
      case FlavorTypes.empresa2:
        return 'Empresa 2';
      default:
        return 'Empresa Desconhecida';
    }
  }

  static String get apiBaseUrl {
    switch (flavorType) {
      case FlavorTypes.empresa1:
        return 'https://api.empresa1.com';
      case FlavorTypes.empresa2:
        return 'https://api.empresa2.com';
      default:
        return 'https://api.default.com';
    }
  }

  static bool isEmpresa1() => flavorType == FlavorTypes.empresa1;
  static bool isEmpresa2() => flavorType == FlavorTypes.empresa2;
}
