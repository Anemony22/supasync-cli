# supasync_cli

A CLI tool to streamline local development with Supabase and PowerSync.

When you have an issue `templates.g.dart` file read this
https://stackoverflow.com/questions/78242687/my-flutter-app-is-not-generating-g-dart-files

### Installation:

#### Windows:

Run the following commands in the terminal:

```
dart pub add dev:build_runner
```

```
dart run build_runner build
```

Compile the supasync_cli.dart file to an executable file

```
dart compile exe bin/supasync_cli.dart -o bin/supasync.exe
```

Add the supasync_cli/bin directory to your system path. Make sure its the
absolute path not the relative path.

Start a new terminal (if in VS Code, restart VS Code) and enter `supasync` to
see the available commands.
