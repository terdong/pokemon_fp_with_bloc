import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gcl_for_flutter/gcl.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_fp_with_gext/src/bloc/pokemon_bloc.dart';
import 'package:pokemon_fp_with_gext/src/ui/pages/pokemon_detail_page.dart';
import 'package:pokemon_fp_with_gext/src/ui/pages/pokemon_page.dart';

void main() {
  startGcl();
  // Bloc.observer = SimpleBlocObserver();
  // configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonBloc(),
      child: MaterialApp.router(
          title: 'Pokemon App',
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate),
    );
/*     return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon App',
        home: BlocProvider(
          create: (context) => PokemonBloc(),
          child: const PokemonPage(),
        )); */
  }

  late final _router = GoRouter(
      debugLogDiagnostics: true,
      urlPathStrategy: UrlPathStrategy.path,
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => const PokemonPage(),
            routes: [
              GoRoute(
                path: 'pokemon/:id',
                builder: (context, state) {
/*                   final id = state.params['id'];
                  final Future<String?> result =
                      context.read<PokemonBloc>().checkPokemonId(id!); */
                  return const PokemonCard();
                },
                /* pageBuilder: (context, state) => MaterialPage<void>(
                        key: state.pageKey,
                        child: const PokemonCard(),
                      ) */
              ),
            ])
      ]);
}

/*
  void main() {
  startGcl();
  // configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
    defaultDevice: Devices.android.samsungGalaxyS20,
    builder: (context) => GetMaterialApp(
      title: 'Pokemon App',
      debugShowCheckedModeBanner: true,
      initialRoute: Routes.INITIAL,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true, // for working DevicePreview
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        },
      ),
      getPages: AppPages.pages,
      /* theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
            color: Colors.deepOrange,
            textTheme: TextTheme(
                headline6: GoogleFonts.exo2(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )))), */
    ), // Wrap your app
  ));
  }
   */
