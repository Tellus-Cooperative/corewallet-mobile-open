import 'package:corewallet/constants/colors.dart';
import 'package:corewallet/models/api.graphql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../providers/main_provider.dart';
import '../../utils/filters.dart';
import '../../utils/form_input.dart';

Container tokenPartial(BuildContext context, MainProvider mainProvider,
    Function searchInputChange, TextEditingController searchController) {
  List<Assets$Query$Assets$Results?> tokens = mainProvider.assets;

  return Container(
    color: mainBlack5,
    padding: const EdgeInsets.fromLTRB(32, 40, 32, 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Tokens",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            )),
        const SizedBox(
          height: 56,
        ),
        Container(
          margin: const EdgeInsets.all(0),
          child: inputSearch(searchController, 'Buscar', searchInputChange, mainProvider),
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: mainProvider.currentTokenConversion == 'USD'
                      ? mainPrimary90
                      : otherWhite,
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  minimumSize: Size.zero,
                ),
                onPressed: () {
                  mainProvider.setCurrentUsdConversion('USD');
                },
                child: Text(
                  'USD',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: mainProvider.currentTokenConversion == 'USD'
                          ? otherWhite
                          : mainPrimary90),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: mainProvider.currentTokenConversion == 'CLP'
                      ? mainPrimary90
                      : otherWhite,
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  minimumSize: Size.zero,
                ),
                onPressed: () {
                  mainProvider.setCurrentUsdConversion('CLP');
                },
                child: Text(
                  'CLP',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: mainProvider.currentTokenConversion == 'CLP'
                          ? otherWhite
                          : mainPrimary90),
                ),
              ),
            ]),
            // Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            //   TextButton(
            //     style: TextButton.styleFrom(
            //       backgroundColor: mainPrimary90,
            //       padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            //       minimumSize: Size.zero,
            //     ),
            //     onPressed: null,
            //     child: const Text(
            //       '24H',
            //       style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.white),
            //     ),
            //   ),
            //   TextButton(
            //     style: TextButton.styleFrom(
            //       backgroundColor: mainPrimary90,
            //       padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            //       minimumSize: Size.zero,
            //     ),
            //     onPressed: null,
            //     child: const Text(
            //       'Filtrar',
            //       style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.white),
            //     ),
            //   ),
            // ])
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: tokens.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: tokens[index]!.image!.isEmpty
                          ? SvgPicture.asset(
                              'assets/images/tickers/Stellar.svg',
                            )
                          : Image.network('${tokens[index]!.image}'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            tokens[index]!.symbol!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '\$${usdToOtherCurrency(tokens[index]!.price24h!, mainProvider.factorUsdConversion)}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                'assets/images/tokens/${tokens[index]!.pricePercent24h!.contains('-') ? 'Down' : 'Up'}.svg'),
                            Text(
                                "${usdToOtherCurrency(tokens[index]!.pricePercent24h!, 1).replaceAll('-', '')}%",
                                style: const TextStyle(
                                  color: mainBlack60,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        )
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: mainBlack60,
                  indent: 50,
                );
              }),
        ),
      ],
    ),
  );
}
