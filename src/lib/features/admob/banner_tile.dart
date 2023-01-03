import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerTile extends StatefulWidget {
  const BannerTile({super.key});

  @override
  State<BannerTile> createState() => _BannerTileState();
}

class _BannerTileState extends State<BannerTile> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _createBanner();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
    _bannerAd = null;
  }

  void _createBanner() {
    BannerAd(
      adUnitId: 'ca-app-pub-4148631727469736/9523526443',
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
        onAdClicked: (Ad ad) => print('$BannerAd onAdClicked.'),
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    final Widget adWidget =
        (_bannerAd == null) ? (Container()) : AdWidget(ad: _bannerAd!);

    return Container(
      alignment: Alignment.center,
      child: adWidget,
    );
  }
}
