import 'package:flutter/widgets.dart';

abstract class Media {
  const Media();

  static const _baseImage = 'assets/images';
  static const _baseLottie = 'assets/lottie';
  static const _baseCryptoIcon = 'assets/crypto_icons';

  static const female = '$_baseImage/on_boarding_female.png';
  static const male = '$_baseImage/on_boarding_male.png';

  static const loading = '$_baseLottie/coin_circling_wallet.json';
  static const searachLight = '$_baseLottie/';
  static const searching = '$_baseLottie/';
  static const error = '$_baseLottie/failed_status.json';

  static const goldIcon = '$_baseImage/gold.png';

}

class CryptoIcon extends StatelessWidget {
  const CryptoIcon({super.key, required this.cryptoCode});
  final String? cryptoCode;

  @override
  Widget build(BuildContext context) {
    const String nullCrypto = 'null';
    final uri = Media._baseCryptoIcon;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset('$uri/${cryptoCode ?? nullCrypto}'),
    );
  }
}
