import 'package:expense_app/bloc/login/login_bloc.dart';
import 'package:expense_app/utils/constants/debug_log_function.dart';
import 'package:expense_app/utils/extenstions/integer_extenstion.dart';
import 'package:expense_app/utils/widgets/common_button.dart';
import 'package:expense_app/utils/widgets/label_text_fields.dart';
import 'package:expense_app/utils/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1), weight: 1),
    ]).animate(controller);
    controller.forward();

    controller.addStatusListener((status) {
      debugLog("status => $status");
    });
    super.initState();
  }

  @override
  void dispose() {
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
          builder: (context, widget) {
            return Opacity(opacity: animation.value, child: widget);
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            physics: ClampingScrollPhysics(),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppTextFormFieldsWithLabel(
                      controller: state.fieldsState.mobileNumberFieldState.textEditingController,
                      hintText: "Mobile Number",
                      isUnderlineTextField: true,
                      textInputType: TextInputType.phone,
                      isError: false,
                      onChanged: (String value) {},
                      onFieldSubmitted: (String value) {},
                    ),
                    30.height,
                    AppTextFormFieldsWithLabel(
                      controller: state.fieldsState.passwordFieldState.textEditingController,
                      hintText: "Password",
                      isUnderlineTextField: true,
                      textInputType: TextInputType.text,
                      isPasswordField: true,
                      isError: false,
                      onChanged: (String value) {},
                      onFieldSubmitted: (String value) {},
                    ),
                    40.height,
                    ClickablePrimaryButton(
                      label: "Login",
                      isLoader: false,
                      loader: Loader(),
                      onTap: () {
                        context.read<LoginBloc>().add(LoginThroughGoogleEvent());
                      },
                    ),
                    12.height,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
