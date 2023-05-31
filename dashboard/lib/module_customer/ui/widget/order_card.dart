import 'package:flutter/material.dart';
import 'package:taboola/generated/l10n.dart';
class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10 , left: 10),
      width: 220,
     // color: Theme.of(context).cardColor,
      child: RaisedButton(
        onPressed: () {},
        //padding: const EdgeInsets.all(5),
        color: Theme.of(context).cardColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              //height: 140,
              //alignment: Alignment.centerLeft,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).orderNumber,
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    S.of(context).address,
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  // Text(
                  //  S.of(context).order,
                  //   textScaleFactor: 0.8,
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //   ),
                  // ),
                  Text(
                    S.of(context).orderPrice,
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1 ",
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Address ",
                      textScaleFactor: 0.8,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    // Text(
                    //   "OrderName",
                    //   textScaleFactor: 0.8,
                    //   style: TextStyle(
                    //     fontSize: 12,
                    //   ),
                    // ),
                    Text(
                      "2400",
                      textScaleFactor: 0.8,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
