import 'package:flutter/material.dart';
import 'package:sorcery_desktop_v3/src/features/apps/domain/app.dart';
import 'package:sorcery_desktop_v3/src/features/terminal_commands/shell_commands.dart';
import 'package:xterm/frontend/terminal_view.dart';
import 'package:xterm/terminal/terminal.dart';

class AppsShowScreen extends StatelessWidget {
  final String _appId;
  final App? _app;
  const AppsShowScreen({required String appId, App? app, Key? key})
      : _appId = appId,
        _app = app,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    const SizedBox box = SizedBox(height: 20);
    final Terminal terminal = Terminal(maxLines: 10000);

    if (_app != null) {
      // print(_app.toString());

      switch (_app!.frameworkId) {
        case 22:
          if (_app!.typeId == 23) {
            // creat rails api app
            final shell =
                ShellCommands(path: '/Users/holdenhinkle/Documents/Projects');
            print('Before ls');
            shell.ls();
            print('Before mkdir');
            shell.mkdir();
            print('Before rails new');
            shell.railsNew();
            print('After rails new');
          } else if (_app!.typeId == 24) {
            // create rails monolith app
          }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sorcery')),
      body: Center(
        child: Column(
          children: [
            box,
            Text(
              'App $_appId',
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: TerminalView(terminal: terminal),
            ),
          ],
        ),
      ),
    );
  }
}
