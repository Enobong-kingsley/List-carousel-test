import 'package:flutter/material.dart';
import 'package:slider_test/dayno/app_decoration.dart';
import 'package:slider_test/dayno/custom_app_bar.dart';
import 'package:slider_test/dayno/custom_text_form_field.dart';
import 'package:slider_test/dayno/custom_text_style.dart';
import 'package:slider_test/dayno/size_utils.dart';
import 'package:slider_test/dayno/theme_helper.dart';

// ignore_for_file: must_be_immutable
class TransferToBankScreen extends StatelessWidget {
  TransferToBankScreen({Key? key}) : super(key: key);

  TextEditingController accountNumberInstructionsController =
      TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Recipient Account",
                              style: theme.textTheme.titleMedium),
                          SizedBox(height: 10.v),
                          Text("Account Number",
                              style: theme.textTheme.bodyMedium),
                          SizedBox(height: 7.v),
                          CustomTextFormField(
                              controller: accountNumberInstructionsController,
                              hintText: "Enter 10 digits Account Number",
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.number),
                          SizedBox(height: 16.v),
                          Text("Bank", style: theme.textTheme.bodyMedium),
                          SizedBox(height: 7.v),
                          _buildNewSection(context),
                          SizedBox(height: 63.v),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(400, 50),
                              backgroundColor: theme.colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.h),
                              ),
                            ),
                            child: Text("Next"),
                          )
                        ])))));
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
          "Transfer To Bank",
          style: TextStyle(color: Colors.black54),
        ));
  }

  /// Section Widget
  Widget _buildNewSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.v),
        decoration: AppDecoration.outlineBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Text("Select a Bank",
                  style: CustomTextStyles.bodyMediumSecondaryContainer)),
        ]));
  }
}
