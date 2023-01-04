import 'package:alpha_reader/features/admob/application/bloc/ad_mob_bloc.dart';
import 'package:alpha_reader/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    _createBanner(true);
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
    _bannerAd = null;
  }

  void _createBanner(bool adFree) {
    _bannerAd?.dispose();

    if (adFree) return;

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

    return BlocProvider(
      create: (context) => sl<AdMobBloc>(),
      child: BlocConsumer<AdMobBloc, AdMobState>(
        listener: (context, state) {
          setState(() {
            _createBanner(state.adFree);
          });
        },
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    height: (_bannerAd == null)
                        ? 0
                        : _bannerAd!.size.height.toDouble(),
                    width: (_bannerAd == null)
                        ? 0
                        : _bannerAd!.size.height.toDouble(),
                    alignment: Alignment.center,
                    child: adWidget,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
