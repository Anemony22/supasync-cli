import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:supasync_cli/src/commands/restart_command.dart';
import 'package:supasync_cli/src/commands/start_command.dart';
import 'package:supasync_cli/src/commands/stop_command.dart';

import 'package:supasync_cli/supasync_cli.dart';

// Compile with 'dart compile exe bin/supasync_cli.dart -o bin/supasync'

void main(List<String> args) {
  var runner = CommandRunner('supasync', 'A CLI tool to streamline local development with Supabase and PowerSync.')
    ..addCommand(TestCommand())
    ..addCommand(InitCommand())
    ..addCommand(StartCommand())
    ..addCommand(StopCommand())
    ..addCommand(RestartCommand());

  runner.argParser.addFlag('verbose', abbr: 'v', negatable: false, help: 'Displays extra logging information for a command.');

  runner.run(args).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
    exit(64); // Exit code 64 indicates a usage error.
  });
}
