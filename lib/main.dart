import 'package:flutter/material.dart';
import 'package:project_it/Pages/FirstTime.dart';
import 'package:project_it/Providers/FriendProvider.dart';
import 'package:project_it/Providers/InviteProvider.dart';
import 'package:project_it/Providers/RouterProvider.dart';
import 'package:project_it/Providers/UserProvider.dart';
import 'package:project_it/Services/AppPallete.dart';
import 'package:project_it/Services/GrahQLConfig.dart';
import 'package:project_it/Services/GraphQlService.dart';
import 'package:project_it/Providers/GroupProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RouterProvider()),
        ChangeNotifierProvider(create: (context) => InviteProvider()), 
        ChangeNotifierProvider(create: (context) => GroupProvider()), 
        ChangeNotifierProvider(create: (context) => UserProvider()), 
        ChangeNotifierProvider(create: (context) => FriendProvider()), 
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: RouterProvider.routes,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.white,
      body: const FirstTimePage(),
    );
  }
}





















































































class testPage extends StatefulWidget {
  const testPage({super.key});

  @override
  State<testPage> createState() => _testPageState();
}

class _testPageState extends State<testPage> {
  final GraphQLService _graphQLService = GraphQLService(
    GraphQLConfig().client.value,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('asdfasd'),
      ),
      body: FutureBuilder<List<String>>(
        future: _graphQLService.fetchCustomer(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final customer = snapshot.data!;
            // print(snapshot.data);
            return ListView.builder(
              itemCount: customer.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(customer[index]),
                );
              },
            );
          } else {
            return const Center(child: Text('No customer found'));
          }
        },
      ),
    );
  }
}
