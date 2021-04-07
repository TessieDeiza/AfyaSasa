import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckGivenWidgets extends Given1WithWorld<String,FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
  // TODO: implement executeStep
    final textinput1 = find.byValueKey(input1);
    await FlutterDriverUtils.isPresent( world.driver, textinput1);
  }
  @override
  // TODO: implement pattern
  RegExp get pattern => RegExp(r"I have {string} on the home tab");
}

class WhenUserPicture extends When1WithWorld<String, FlutterWorld> {
    @override
    Future<void> executeStep(String input1) async {
      final textinput1 = find.byValueKey(input1);
      await FlutterDriverUtils.isPresent( world.driver, textinput1);

    }

    @override
    RegExp get pattern => RegExp(r"I tap on the {string} on the app bar");

    
}

class AndUserProfile extends And1WithWorld<String, FlutterWorld> {
    @override
    Future<void> executeStep(String input1) async {
      final textinput1 = find.byValueKey(input1);
      await FlutterDriverUtils.isPresent( world.driver, textinput1);

    }

    @override
    RegExp get pattern => RegExp(r"I tap on {string} from the side navigation menu");

}

class AndFieldData extends And1WithWorld<String, FlutterWorld> {
    @override
    Future<void> executeStep(String input1) async {
      final textinput1 = find.byValueKey(input1);
      await FlutterDriverUtils.getText( world.driver, textinput1);

    }

    @override
    RegExp get pattern => RegExp(r"I edit the {string} field on the tab");

    
}

class ThenUserInput extends Then1WithWorld<String, FlutterWorld> {
    @override
    Future<void> executeStep(String input1) async {
      final textinput1 = find.byValueKey(input1);
      await FlutterDriverUtils.getText( world.driver, textinput1);

    }

    @override
    RegExp get pattern => RegExp(r"the {string} information on the personal tab should be visible");

    
}