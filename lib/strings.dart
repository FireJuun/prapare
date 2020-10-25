import 'package:get/get.dart';

// ignore_for_file: non_constant_identifier_names
class _Strings {
  static _Strings instance = _Strings();

  String TITLE_PERSONAL = "Personal Characteristics".tr;
  String TITLE_HOME = "Family and Home".tr;
  String TITLE_MONEY = "Money and Resources".tr;
  String TITLE_SOCIAL = "Social and Emotional Health".tr;
  String TITLE_OTHER = "Optional Measures".tr;

  //todo: automate connection of string to PRAPARE survey data
  String CODE_PERSONAL = 'personal';
  String CODE_HOME = 'home';
  String CODE_MONEY = 'money';
  String CODE_SOCIAL = 'social';
  String CODE_OTHER = 'other';

  String BTN_NEW_SURVEY = "New Survey".tr;
  String BTN_EDIT_SURVEY = "Edit Survey".tr;
  String BTN_SUBMIT_SHARE = "Submit/Share".tr;
  String BTN_OK = "OK".tr;

  String STG_TITLE = "App Settings".tr;
  String STG_THEME_MODE = "Choose Theme".tr;
  String STG_THEME_SYSTEM = "System".tr;
  String STG_THEME_DARK = "Dark".tr;
  String STG_THEME_LIGHT = "Light".tr;
  String STG_LANGUAGE = "Choose Language".tr;

  // temporary, used only for scrolling purposes
  String LOREM_IPSUM =
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Tristique magna sit amet purus. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi. Rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Ut lectus arcu bibendum at varius vel pharetra. Phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam. Ultrices sagittis orci a scelerisque purus semper eget duis. Sed risus ultricies tristique nulla. Aliquam malesuada bibendum arcu vitae. Neque gravida in fermentum et sollicitudin ac orci.

      Vel quam elementum pulvinar etiam. Egestas sed tempus urna et pharetra pharetra massa. Risus feugiat in ante metus dictum at tempor commodo. Risus commodo viverra maecenas accumsan lacus. Risus in hendrerit gravida rutrum quisque non tellus. Lectus urna duis convallis convallis tellus id interdum. Tortor at auctor urna nunc id cursus. Ultrices dui sapien eget mi proin sed libero enim sed. Aliquam nulla facilisi cras fermentum. Urna molestie at elementum eu facilisis sed odio morbi. Quis eleifend quam adipiscing vitae proin.

      Augue neque gravida in fermentum et sollicitudin ac orci. Mauris augue neque gravida in fermentum et sollicitudin ac. In nisl nisi scelerisque eu. Sem et tortor consequat id porta nibh venenatis cras sed. Viverra mauris in aliquam sem fringilla ut morbi tincidunt augue. Hac habitasse platea dictumst vestibulum rhoncus est pellentesque. Sem integer vitae justo eget magna fermentum iaculis. Ultricies integer quis auctor elit. Tristique et egestas quis ipsum suspendisse ultrices gravida dictum. Egestas maecenas pharetra convallis posuere morbi leo urna molestie at. Habitant morbi tristique senectus et netus et malesuada fames. Pulvinar pellentesque habitant morbi tristique senectus. Ultricies tristique nulla aliquet enim. Consectetur libero id faucibus nisl tincidunt eget nullam non. Velit egestas dui id ornare arcu odio ut. Et molestie ac feugiat sed lectus vestibulum mattis. Pulvinar mattis nunc sed blandit libero volutpat sed. Penatibus et magnis dis parturient montes nascetur ridiculus. Est ultricies integer quis auctor elit sed.

      Euismod elementum nisi quis eleifend quam adipiscing vitae. Interdum varius sit amet mattis vulputate enim nulla aliquet porttitor. Feugiat nisl pretium fusce id velit ut tortor pretium viverra. Id neque aliquam vestibulum morbi. Sapien faucibus et molestie ac feugiat sed lectus vestibulum. Faucibus pulvinar elementum integer enim neque volutpat ac tincidunt vitae. In nibh mauris cursus mattis molestie. Mauris sit amet massa vitae. Dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur. Mi bibendum neque egestas congue quisque egestas diam. Diam maecenas sed enim ut sem viverra aliquet eget sit. Sed sed risus pretium quam vulputate dignissim. Sodales neque sodales ut etiam sit amet nisl purus. Massa placerat duis ultricies lacus sed turpis tincidunt id. At in tellus integer feugiat scelerisque varius morbi enim. Facilisis gravida neque convallis a cras semper. Facilisi nullam vehicula ipsum a arcu cursus. Amet consectetur adipiscing elit duis tristique sollicitudin nibh sit. Netus et malesuada fames ac turpis egestas maecenas.

      Arcu ac tortor dignissim convallis aenean et. Eget est lorem ipsum dolor. Dictum fusce ut placerat orci nulla pellentesque dignissim. Faucibus in ornare quam viverra orci. Amet porttitor eget dolor morbi non arcu risus. Ultrices tincidunt arcu non sodales neque sodales. Senectus et netus et malesuada fames ac turpis. Commodo odio aenean sed adipiscing diam donec adipiscing tristique risus. Tristique senectus et netus et malesuada fames ac. Arcu felis bibendum ut tristique et egestas quis ipsum suspendisse.'''
          .tr;
}

_Strings get S => _Strings.instance;
