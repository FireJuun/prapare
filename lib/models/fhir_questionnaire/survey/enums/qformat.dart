/// itemType as defined: https://www.hl7.org/fhir/valueset-item-type.html
const choiceType = {
  'autocomplete': QFormat.autocomplete,
  'drop-down': QFormat.drop_down,
  'check-box': QFormat.check_box,
  'lookup': QFormat.lookup,
  'radio-button': QFormat.radio_button,
  'slider': QFormat.slider,
  'spinner': QFormat.spinner,
  'text-box': QFormat.text_box,
};

enum QFormat {
  autocomplete,
  drop_down,
  check_box,
  lookup,
  radio_button,
  slider,
  spinner,
  text_box,
  unknown,
  none,
}
