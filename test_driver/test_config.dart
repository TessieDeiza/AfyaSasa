import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/updateprofile_steps.dart';
Future<void> main() {
  final config = FlutterTestConfiguration()
  ..features = [Glob(r"test_driver/features/**.feature")]
  ..reporters = [ProgressReporter()]
  ..stepDefinitions = [CheckGivenWidgets(),WhenUserPicture(),AndUserProfile(),AndFieldData(),ThenUserInput()]
  ..restartAppBetweenScenarios = true
  ..targetAppPath = "test_driver/app.dart"
  ..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}