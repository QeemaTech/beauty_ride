import 'package:beauty_ride/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashOnboard extends StatelessWidget {
  const SplashOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          final cubit = context.read<SplashCubit>();
          return Scaffold(
            backgroundColor: Color(0xffE4C6C6),
            body: GestureDetector(
              onTap: () {
                cubit.changeByController();
              },
              child: PageView.builder(
                controller: cubit.controller,
                itemCount: cubit.models.length,
                onPageChanged: (value) {
                  cubit.changeIndex(value);
                },
                itemBuilder: (_, index) {
                  return Center(child: Image.asset(cubit.models[index].icon));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
