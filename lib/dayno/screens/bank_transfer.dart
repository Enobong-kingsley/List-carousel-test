import 'package:slider_test/dayno/custom_app_bar.dart';
import 'package:slider_test/dayno/custom_text_style.dart';
import 'package:slider_test/dayno/size_utils.dart';

import 'package:flutter/material.dart';
import 'package:slider_test/dayno/screens/transfer_to_bank.dart';
import 'package:slider_test/dayno/usertransfer_item_widget.dart';

class AddMoneyBankTransferScreen extends StatelessWidget {
  const AddMoneyBankTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 19.v),
                child: Column(children: [
                  SizedBox(
                      width: 339.h,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TransferToBankScreen()));
                        },
                        child: Text(
                            "After making the transfer, ensure to refresh your wallet, your Dayno wallet should reflect immidiately",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMediumPrimary),
                      )),
                  SizedBox(height: 20.v),
                  _buildUserTransfer(context)
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
          "Bank Transfer",
          style: TextStyle(color: Colors.black54),
        ));
  }

  /// Section Widget
  Widget _buildUserTransfer(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 40.v);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return UsertransferItemWidget();
            }));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
