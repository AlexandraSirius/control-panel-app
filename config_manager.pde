// =====================================
// ControlConfig — настройки одного органа
// =====================================
class ControlConfig {

  // MIDI
  int midiA = 0;
  int midiB = 0;
  int midiC = 0;
  int midiDropdown = 0;

  // OSC
  String oscPath = "/message";
  float oscMin = 0.0;
  float oscMax = 1.0;

  ControlConfig() {
  }

  String buildMidiLine(char prefix, int index) {
    // midi,b0,1,23,100,0
    return "midi," +
           prefix + index + "," +
           midiA + "," +
           midiB + "," +
           midiC + "," +
           midiDropdown;
  }

  String buildOscLine(int index) {
    // osc,0,/message,0.000,1.000
    return "osc," +
           index + "," +
           oscPath + "," +
           nf(oscMin, 0, 3) + "," +
           nf(oscMax, 0, 3);
  }
}
