import 'package:expense_app/bloc/home/home_bloc.dart';
import 'package:expense_app/utils/constants/assets_paths.dart';
import 'package:expense_app/utils/constants/debug_log_function.dart';
import 'package:expense_app/utils/themes/text-style.dart';
import 'package:expense_app/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: commonAppBar(title: "Welcome!", context: context),
        body: Center(
          child: AppTextTheme.text("Home", color: colorScheme.onSurface, fontSize: 18, fontWeight: FontWeight.w900),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: state.currentIndex,
          backgroundColor: colorScheme.onPrimaryFixed,
          onTap: (index) {
            context.read<HomeBloc>().add(ChangeTab(currentIndex: index));
          },
          selectedItemColor: colorScheme.onSurface,
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home, size: 24, color: colorScheme.onSurface),
              title: AppTextTheme.text(
                "Home",
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w900,
                fontSize: 10,
                isBoldonse: true,
              ),
            ),
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                SvgPaths.icContribution,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
              ),
              title: AppTextTheme.text(
                "Contro",
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w900,
                fontSize: 10,
                isBoldonse: true,
              ),
            ),
            // SalomonBottomBarItem(
            //   icon: SvgPicture.asset(
            //     SvgPaths.icExpense,
            //     height: 24,
            //     width: 24,
            //     colorFilter: ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
            //   ),
            //   title: AppTextTheme.text(
            //     "Personal Expense",
            //     color: colorScheme.onSurface,
            //     fontWeight: FontWeight.w900,
            //     fontSize: 10,
            //     isBoldonse: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
