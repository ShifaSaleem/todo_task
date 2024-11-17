import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/providers/task_provider.dart';
import 'package:todo_task/screens/add_edit_task_screen.dart';
import 'package:todo_task/screens/dashboard_screen.dart';
import 'package:todo_task/screens/task_detail_screen.dart';
import 'package:todo_task/screens/tasks_lists_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Todo Task'),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Todo Task',),
        '/dashboard': (context) => const DashboardScreen(),
        '/tasksList': (context) => const TasksListsScreen(),
        '/taskDetail': (context) => const TaskDetailScreen(),
        '/addEditTask': (context) => const AddEditTaskScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void initState() {
    super.initState();
    _navigateToDashboard();
  }

  void _navigateToDashboard() async {
    // Wait for 3 seconds to simulate splash delay
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100),
            const Text(
              'Welcome to Task Manager',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
