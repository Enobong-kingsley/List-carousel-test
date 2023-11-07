import 'package:flutter/material.dart';
import 'package:slider_test/dayno/size_utils.dart';
import 'package:slider_test/dayno/theme_helper.dart';

// ignore: must_be_immutable
class UsertransferItemWidget extends StatelessWidget {
  const UsertransferItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.monetization_on,
          color: Colors.blue,
          size: 40,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 11.h,
            top: 7.v,
            bottom: 7.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bank",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 3.v),
              Text(
                "Munachi Nwoko",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
