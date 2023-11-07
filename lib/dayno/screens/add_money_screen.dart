import 'package:flutter/material.dart';
import 'package:slider_test/dayno/custom_app_bar.dart';
import 'package:slider_test/dayno/theme_helper.dart';

import '../size_utils.dart';

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 28.v),
                child: Column(children: [
                  _buildNewSection(context),
                  SizedBox(height: 23.v),
                  _buildNewSection1(context),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black45,
            size: 20,
          ),
          onTap: () {},
        ),
        centerTitle: true,
        title: Text(
          "Add Money",
          style: TextStyle(color: Colors.black54),
        ));
  }

  /// Section Widget
  Widget _buildNewSection(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.monetization_on,
            color: Colors.blue,
            size: 40,
          ),
          Padding(
              padding: EdgeInsets.only(left: 11.h, top: 7.v, bottom: 5.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bank Transfer", style: theme.textTheme.bodyMedium),
                    SizedBox(height: 4.v),
                    Text("Add money via mobile banking",
                        style: theme.textTheme.bodySmall)
                  ])),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black45,
            size: 20,
          ),
        ]));
  }

  /// Section Widget
  Widget _buildNewSection1(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Icon(
        Icons.monetization_on,
        color: Colors.blue,
        size: 40,
      ),
      Padding(
          padding: EdgeInsets.only(left: 11.h, top: 9.v, bottom: 5.v),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Request money from others",
                style: theme.textTheme.bodyMedium),
            SizedBox(height: 3.v),
            Text("Send a request to any Dayno user",
                style: theme.textTheme.bodySmall)
          ])),
      Spacer(),
      const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black45,
        size: 20,
      ),
    ]);
  }
}
