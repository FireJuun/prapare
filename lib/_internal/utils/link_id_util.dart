class LinkIdUtil {
  // take group code on left, assuming format is "/93043-8/56051-6/"
  // for now, no error handling has been established
  String getGroupId(String code) => code.split('/')[1];
  String getQuestionId(String code) => code.split('/')[2] ?? '';
  String getSubquestionId(String code) => code.split('/')[3] ?? '';
}
