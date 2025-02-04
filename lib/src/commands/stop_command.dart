import 'package:args/command_runner.dart';
import 'package:dart_console/dart_console.dart';
import 'package:dcli/dcli.dart';
import 'package:supasync_cli/src/console_utils/console_utils.dart';

class StopCommand extends Command {
  StopCommand();

  @override
  String get name => 'stop';

  @override
  String get description => 'Stops Supabase and PowerSync services.';

  @override
  Future<void> run() async {
    'docker compose -f powersync/powersync_compose.yaml --env-file .env down'.start(progress: Progress.capture(), terminal: true);

    ConsoleUtils.writeLine('');

    'supabase stop'.start(terminal: true);

    ConsoleUtils.writeLine('');

    ConsoleUtils.writeLineColored('Supabase & PowerSync stopped successfully.', ConsoleColor.green);
  }
}
