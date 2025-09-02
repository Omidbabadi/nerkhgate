class Ads {
  Ads._internal();

  static final Ads instance = Ads._internal();

  bool? isAdLoaded;

  void loadAd() {
    isAdLoaded = true;
  }
}
