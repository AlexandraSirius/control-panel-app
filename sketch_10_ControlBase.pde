abstract class ControlBase {
  String id;
  float x, y, w, h;
  String controlType = "";
  int midiValue = 0; // универсальное значение 0..127 для любых аналоговых элементов (slider/рычаг/крутилка)
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
  void update() {
    // по умолчанию ничего
  }

  // =================================
  // MOUSE EVENTS (по умолчанию пустые)
  // =================================
  void mousePressed() {
    // переопределяется при необходимости
  }

  void mouseReleased() {
    // переопределяется при необходимости
  }

  // =================================
  // HOVER CHECK
  // =================================
  boolean isHovered(float mx, float my) {
    return mx >= x && mx <= x + w &&
           my >= y && my <= y + h;
  }
}
