import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

enum MainHomeType {
  home,
  profile,
}

class MainHomePage extends HookWidget {
  const MainHomePage({
    super.key,
    required this.shell,
  });

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final current = useState(0);
    return Scaffold(
      bottomNavigationBar: ListenableBuilder(
        listenable: current,
        builder: (context, child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
            ],
            onTap: (int index) {
              shell.goBranch(index);
              current.value = index;
            },
            selectedItemColor: Colors.red,
            currentIndex: current.value,
          );
        },
      ),
      body: shell,
    );
  }
}
