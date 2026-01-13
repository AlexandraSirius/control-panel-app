abstract class ControlBase {
  String id;
  float x, y, w, h;
  String controlType = "";
  int midiValue = 0;
  int protocolIndex = -1;  // номер для bX / pX / eX
  ControlConfig config = new ControlConfig();
 
  ControlBase(String id, float x, float y, float w, float h) {
    this.id = id;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  // =================================
  // ОСНОВНОЙ DRAW
  // =================================
  void draw() {
    drawControl();
  }

  abstract void drawControl();

  // =================================
  // UPDATE (по умолчанию пустой)
  // =================================
  void update() {}

  // =================================
  // MOUSE EVENTS
  // =================================
  void mousePressed() {}
  void mouseReleased() {}

  // =================================
  // HOVER CHECK
  // =================================
  boolean isHovered(float mx, float my) {
    return mx >= x && mx <= x + w &&
           my >= y && my <= y + h;
  }

  // =================================
  // ПРОТОКОЛЬНЫЙ ПРЕФИКС (ШАГ 1 ПО ТЗ)
  // =================================
  char getProtocolPrefix() {
    if (controlType.equals("button"))  return 'b';
    if (controlType.equals("knob"))    return 'p';
    if (controlType.equals("slider"))  return 'p';
    if (controlType.equals("lever"))   return 'p';
    if (controlType.equals("encoder")) return 'e';
    return '?';
  }
  int getProtocolIndex() {
    return protocolIndex;
  }

}
