class WeatherModel {
  final int conditionId;

  WeatherModel({
    required this.conditionId,
  });

  String get conditionName {
    switch (conditionId ~/ 100) {
      case 2:
        return 'assets/1';
      case 3:
        return 'assets/2';
      case 5:
        return 'assets/3';
      case 6:
        return 'assets/4';
      case 7:
        return 'assets/5';
      case 8:
        return conditionId == 800 ? 'assets/6' : 'assets/7';
      default:
        return 'assets/8';
    }
  }

  String get assetPath {
    return '$conditionName.png';
  }
}
