import 'package:tapsell_plus/tapsell_plus.dart';

class AdHelper {
  AdHelper(this._tapsellPlus, this.isInit);
  final TapsellPlus _tapsellPlus;
  final bool isInit;

  Future<void> loadBanner() async {
    if (!isInit) return;
    final isAdLoaded = await _tapsellPlus.requestStandardBannerAd(
      '68b725777b6181780a8e3794',
      TapsellPlusBannerType.BANNER_320x50,
      onResponse: (res) {
        print(res);
      },
      onError: (e) {
        print(e);
      },
    );
    print(isAdLoaded);
  }

  Future<void> showBannerAd() async {
    //await _tapsellPlus.showStandardBannerAd(responseId, horizontalGravity, verticalGravity)
  }
}
