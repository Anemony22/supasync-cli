import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_console/dart_console.dart';
import 'package:dcli/dcli.dart';
import 'package:path/path.dart';
import 'package:supasync_cli/src/templates.dart';

import '../console_utils/console_utils.dart';

/// Init leaf command.
/// Sets up supabase and powersync directories
class InitCommand extends Command {
  @override
  String get name => 'init';

  @override
  String get description => 'Initialises Supabase and PowerSync within the directory.'
      "Runs 'supabase init' as well as custom PowerSync setup."
      "If used after running 'supabase init', will only set up PowerSync in directory.";

  @override
  void run() async {
    // Attempt to run Supabase CLI init
    try {
      'supabase init --with-vscode-settings'.start();
    } catch (e) {
      ConsoleUtils.writeError("Supabase CLI not accessible. Ensure you've followed the Supabase CLI setup instructions.");
    }

    // Create directories
    String currentDir = Directory.current.path;
    String envPath = join(currentDir, '.env');

    String powersyncDir = join(currentDir, 'powersync');
    String configPath = join(powersyncDir, 'config.yaml');
    String composePath = join(powersyncDir, 'powersync_compose.yaml');
    String syncRulesPath = join(powersyncDir, 'sync_rules.yaml');

    await File(envPath).writeAsBytes(templateEnv);

    await Directory(powersyncDir).create();
    await File(configPath).writeAsBytes(templateConfig);
    await File(composePath).writeAsBytes(templateCompose);
    await File(syncRulesPath).writeAsBytes(templateSyncRules);

    ConsoleUtils.write('Finished ');
    ConsoleUtils.writeColored('supasync init', ConsoleColor.cyan);
    ConsoleUtils.write('.');
  }
}
