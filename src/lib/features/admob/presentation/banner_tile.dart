import 'package:alpha_reader/features/admob/application/bloc/ad_mob_bloc.dart';
import 'package:alpha_reader/features/purchase/widgets/go_to_shop_card.dart';
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
  bool _adFree = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
    _bannerAd = null;
  }

  void _createBanner() {
    if (_adFree) {
      _bannerAd?.dispose();
      _bannerAd = null;
    } else {
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
            ad.dispose();
          },
          onAdOpened: (Ad ad) {},
          onAdClosed: (Ad ad) {},
          onAdClicked: (Ad ad) {},
        ),
      ).load();
    }
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
            _adFree = state.adFree;
            _createBanner();
          });
        },
        builder: (context, state) {
          return Column(
            children: [
              if (_bannerAd != null) const GoToShopCard(),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        height: (_bannerAd == null)
                            ? 0
                            : _bannerAd!.size.height.toDouble(),
                        width: (_bannerAd == null)
                            ? 0
                            : _bannerAd!.size.width.toDouble(),
                        alignment: Alignment.center,
                        child: adWidget,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
