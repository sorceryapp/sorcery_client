import 'package:process_run/shell_run.dart';

class ShellCommands {
  final Shell _shell;
  ShellCommands({
    required path,
  }) : _shell = Shell(workingDirectory: path);

  void ls() async {
    _shell.run('ls');
  }

  void pwd() async {
    _shell.run('pwd');
  }

  void mkdir({required String name}) async {
    _shell.run('mkdir $name');
  }

  void railsNew({required String name, required String options}) async {
    _shell.run('rails new $name $options');
    // _shell.run('rails new super_app --api --database=postgresql');
  }
}
