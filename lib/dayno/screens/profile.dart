import 'package:flutter/material.dart';
import 'package:slider_test/dayno/screens/add_money_screen.dart';
import 'package:slider_test/dayno/app_decoration.dart';
import 'package:slider_test/dayno/screens/bank_transfer.dart';
import 'package:slider_test/dayno/custom_app_bar.dart';
import 'package:slider_test/dayno/custom_text_style.dart';
import 'package:slider_test/dayno/size_utils.dart';
import 'package:slider_test/dayno/theme_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.v),
                child: Column(children: [
                  SizedBox(height: 30.v),
                  _buildTransactionHistory(context),
                  SizedBox(height: 64.v),
                  _buildNewSection(context,
                      myActivities: "Personal Information"),
                  SizedBox(height: 10.v),
                  Divider(),
                  SizedBox(height: 10.v),
                  _buildNewSection(context, myActivities: "My Activities"),
                  SizedBox(height: 10.v),
                  Divider(),
                  SizedBox(height: 10.v),
                  _buildNewSection(context, myActivities: "Payment Method"),
                  SizedBox(height: 10.v),
                  Divider(),
                  SizedBox(height: 10.v),
                  _buildNewSection(context, myActivities: "Address Management"),
                  SizedBox(height: 10.v),
                  Divider(),
                  SizedBox(height: 16.v),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6.0),
                          child: Icon(
                            Icons.logout,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(left: 11, top: 15, bottom: 12),
                            child: Text("Log Out",
                                style: TextStyle(
                                  color: Colors.red,
                                )))
                      ])),
                  SizedBox(height: 5.v)
                ]))));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 62.h,
        leading: const Icon(
          Icons.person_2,
          color: Colors.black54,
        ),
        title: const Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Versil egbue",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.settings,
              color: Colors.black54,
            ),
          ),
        ]);
  }

  Widget _buildTransactionHistory(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 7.h),
                  child: Row(children: [
                    Text("Total Balance",
                        style: CustomTextStyles.bodySmallOnPrimaryContainer12),
                    Spacer(),
                    Text("Transaction history >",
                        style: CustomTextStyles.bodySmallOnPrimaryContainer12),
                  ])),
              SizedBox(height: 10.v),
              Text("\$40.00", style: theme.textTheme.headlineLarge),
              SizedBox(height: 21.v),
              Padding(
                  padding: EdgeInsets.only(right: 82.h),
                  child: Row(children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddMoneyScreen()));
                        },
                        child: Column(children: [
                          const Icon(
                            Icons.monetization_on,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text("Add Money",
                              style:
                                  CustomTextStyles.bodySmallOnPrimaryContainer)
                        ])),
                    Spacer(flex: 50),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddMoneyBankTransferScreen()));
                        },
                        child: Column(children: [
                          const Icon(
                            Icons.transform_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                          Text("Transfer",
                              style:
                                  CustomTextStyles.bodySmallOnPrimaryContainer)
                        ])),
                    const Spacer(flex: 50),
                    Column(children: [
                      const Icon(
                        Icons.width_full,
                        color: Colors.white,
                        size: 40,
                      ),
                      Text("Withdraw",
                          style: CustomTextStyles.bodySmallOnPrimaryContainer)
                    ])
                  ])),
              SizedBox(height: 16.v)
            ]));
  }

  /// Common widget
  Widget _buildNewSection(
    BuildContext context, {
    required String myActivities,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Icon(
        Icons.add_a_photo_outlined,
        color: Colors.black45,
        size: 30,
      ),
      Padding(
          padding: EdgeInsets.only(left: 11.h, top: 15.v, bottom: 12.v),
          child: Text(myActivities,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: appTheme.black900))),
      Spacer(),
      const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black45,
        size: 20,
      ),
    ]);
  }
}
