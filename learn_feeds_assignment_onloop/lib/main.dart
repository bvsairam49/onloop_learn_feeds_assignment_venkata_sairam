import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_feeds_assignment_onloop/app/home_screen/bloc/feed/feed_bloc.dart';
import 'package:learn_feeds_assignment_onloop/app/splash_screen/view/splash_screen.dart';
import 'package:learn_feeds_assignment_onloop/services/api_service.dart';

import 'app/home_screen/bloc/filter/filter_bloc.dart';
import 'app/my_collection/bloc/my_collection_bloc.dart';

void main() {
  runApp(const LearnFeedsApp());
}

class LearnFeedsApp extends StatelessWidget {
  const LearnFeedsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FilterBloc(service: ApiService())),
        BlocProvider(create: (context) => FeedBloc(service: ApiService())),
        BlocProvider(create: (context) => MyCollectionBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learns Feed App',
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
