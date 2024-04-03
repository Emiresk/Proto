import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:proto/Application/Providers/AppStateProvider.dart';
import 'package:proto/Application/Application.dart';





void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppStateProvider() ),
      ],
      child: Application(),
    )
  );
}
