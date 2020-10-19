# PRAPARE

A patient-facing Flutter app that allows for entry of Social Determinants of Health (SDOH) data in their own native language.

This app builds directly off of the work pioneered in the [PRAPARE] project, though at this time it is not formally affiliated with PRAPARE.

## Design

A basic [prototype] and relevant [wireframes] were created in Figma prior to app creation.

## Architecture

This app loosely follows the [Model-View-Controller+Services] `(MVC+S) architecture`, which has both [simple] and [production-level] examples of use. Whereas the above examples make heavy use of Provider, ChangeNotifier, and StatefulWidgets, we are instead using [Get] and some of the [Getx pattern] to simplify state management, routing, and dependency injection.

Our take on MVC+S is as follows:

- `model`: The single point of failure between your data and the controllers/services that call them.
- `views`: The UI layer, which is separated into multiple `pages` and may optionally be managed via a `viewcontroller`.
- `controller`: The connection between models, services, and the UI. State is managed at the controller level and accesses the model directly.
- `service`: Communicates with the outside world (e.g. internet or local file system).
- `command`: high level 'god' functions that perform a specific task, often by fetching from a service and injecting into a controller.

## Folder Structure

The following is the folder structure under the `/lib` folder:

- `/_internal` - _custom components/variations of existing Flutter widgets, utils, and the like_
- `/controllers` - _the controllers typically used to manage state and/or perform a function_
  - `/commands` - _performs a specific task (login, submit, edit) by the user_
  - `/services` - _connects the app to outside world (e.g. REST, http, file storage)_
- `/models` - _the 'single point of failure' between a service and the controller that uses it_
  - `/data` - _the data types and observables used in the app. may include JSON serialization_
- `/views` - _top level widgets that are loaded via a route_
  - `/<screen_name>` - _contains all code specific to this screen that is not shared_
    - `<screen_name>.dart` - _the screen widget, may optionally include 'page', 'card', or 'panel' at the end based view type_
    - `<screen_name>_binding.dart` - _the controllers that may be loaded (or lazy-loaded) in a specific view_
    - `<screen_name>_controller.dart` - _the viewcontroller that only affects this screen widget_
    - `<screen_name>_test.dart` - _any relevant tests for the screen widget or its viewcontroller_
  - `/shared` - _shared widgets_
    - `<widget_name>.dart`

- `/routes` - _maps routes to screen widgets_
  - `app_pages.dart` - _the app_
  - `app_routes.dart` - _the string route names used in the app_
- `api_keys.dart`
- `constants.dart`
- `main.dart`
- `theme.dart` - _theme and builders_  

## Questionnaire vs Survey

To differentiate between FHIR and our local data model, we have employed the term ```Survey```

- When an item is specifically related to FHIR and it's formatting, the term Questionnaire is used, along with the formatting for that FHIR resource
- When it is part of the local model (including locally stored surveys/questionnaires) the term survey is used 

## Style Guide

Follow the [Dart style guide].

Of note, you should:

- Use `UpperCamelCase` for types.
- Use `lowercase_snake_case` for libraries, packages, directories, and files.
- Use `lowerCamelCase` for constant names.
- Use `lowerCamelCase` for everything else (like variable names).
- Capitalize acronyms and abbreviations longer than two letters (Http rather than HTTP or http).
- A leading underscore makes a member variable private. Only use it if it is private.
- You can use single line if statements for returns.
- Use `///` instead of `/** */` for multi-line comments.

For VS Code, install the Dart and Flutter plugin. Set your editor to [format on save].

## Questions

We have a Slack channel and welcome new members/contributors.

[production-level]: https://github.com/gskinnerTeam/flokk
[Dart style guide]: https://dart.dev/guides/language/effective-dart/style
[format on save]: https://flutter.dev/docs/development/tools/formatting#automatically-formatting-code-in-vs-code
[Get]: https://pub.dev/packages/get#the-three-pillars
[Getx pattern]: https://github.com/kauemurakami/getx_pattern
[Model-View-Controller+Services]: https://blog.gskinner.com/archives/2020/09/flutter-state-management-with-mvcs.html
[PRAPARE]: https://www.nachc.org/research-and-data/prapare/
[prototype]: https://www.figma.com/proto/cWKc5iTzhoddhxMov05rWG/PRAPARE?node-id=5%3A2&scaling=scale-down
[simple]: https://github.com/gskinnerTeam/flutter-mvcs-hello-world
[wireframes]: https://www.figma.com/file/cWKc5iTzhoddhxMov05rWG/PRAPARE?node-id=0%3A1