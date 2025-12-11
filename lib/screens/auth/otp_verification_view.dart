import 'package:expense_app/utils/themes/text-style.dart';
import 'package:expense_app/utils/widgets/animated_loader.dart';
import 'package:expense_app/utils/widgets/common_button.dart';
import 'package:flutter/material.dart';

import 'package:expense_app/utils/extenstions/integer_extenstion.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationView extends StatefulWidget {
  final dynamic arguments;

  const OtpVerificationView({super.key, this.arguments});

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  String? mobileNumber;

  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    mobileNumber = widget.arguments != null && widget.arguments is String && (widget.arguments as String).isNotEmpty
        ? widget.arguments.toString()
        : null;
    controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (_, child) {
            return Opacity(opacity: animation.value, child: child);
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextTheme.text(
                  "Enter OTP",
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
                10.height,
                AppTextTheme.text(
                  "We have sent an OTP to $mobileNumber",
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                40.height,
                Pinput(
                  controller: otpController,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    height: 55,
                    width: 50,
                    textStyle: AppTextTheme.textStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      isBoldonse: true,
                      fontWeight: FontWeight.w900,
                    ),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2)),
                    ),
                  ),
                  inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(10)],
                  focusedPinTheme: PinTheme(
                    height: 55,
                    width: 50,
                    textStyle: AppTextTheme.textStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      isBoldonse: true,
                      fontWeight: FontWeight.w900,
                    ),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.primary, width: 3)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),

                40.height,

                // BlocBuilder<LoginBloc, LoginState>(
                //   builder: (context, state) {
                ClickablePrimaryButton(
                  label: "Verify OTP",
                  isLoader: false,
                  height: MediaQuery.sizeOf(context).height * 0.058,
                  loader: AnimatedLoginLoader(),
                  onTap: () {},
                ),
                //     ;
                //   },
                // ),
                //
                // 30.height,
                //
                // TextButton(
                //   onPressed: () {
                //     context.read<LoginBloc>().add(
                //       ResendOTPEvent(mobileNumber: widget.mobileNumber),
                //     );
                //   },
                //   child: Text(
                //     "Resend OTP",
                //     style: TextStyle(
                //       color: Theme.of(context).colorScheme.primary,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
