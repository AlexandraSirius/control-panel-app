class Knob extends ControlBase {

  // ---------------------------------
  // ENCODER MODE
  // 0 = LEFT
  // 1 = PRESS
  // 2 = RIGHT
  // ---------------------------------
  int encoderMode = 1; // по умолчанию PRESS

  Knob(String id, float x, float y, float w, float h) {
    super(id, x, y, w, h);
    controlType = "knob"; // будет переопределён в initControls для энкодера
  }

  // ---------------------------------
  // DRAW
  // ---------------------------------
  void drawControl() {
    float cx = x + w / 2;
    float cy = y + h / 2;
    float r  = min(w, h);

    // цвет при наведении
    fill(isInside(mouseX, mouseY) ? 210 : 180);
    noStroke();
    ellipse(cx, cy, r, r);

    // индикатор режима (очень полезен для отладки)
    fill(60);
    textAlign(CENTER, CENTER);
    textSize(12);

    if ("encoder".equals(controlType)) {
      text(getEncoderModeShort(), cx, cy);
    }
  }

  // ---------------------------------
  // MOUSE
  // ПКМ — переключение режима
  // ---------------------------------
  void mousePressed() {
    if (!isInside(mouseX, mouseY)) return;

    // только для энкодера
    if ("encoder".equals(controlType) && mouseButton == RIGHT) {
      encoderMode = (encoderMode + 1) % 3;
    }
  }

  // ---------------------------------
  // HIT TEST (круг)
  // ---------------------------------
  boolean isInside(float mx, float my) {
    float dx = mx - (x + w / 2);
    float dy = my - (y + h / 2);
    float r  = min(w, h) / 2;
    return dx * dx + dy * dy <= r * r;
  }

  // ---------------------------------
  // ENCODER MODE NAME
  // ---------------------------------
  String getEncoderModeName() {
    if (encoderMode == 0) return "LEFT";
    if (encoderMode == 2) return "RIGHT";
    return "PRESS";
  }

  String getEncoderModeShort() {
    if (encoderMode == 0) return "L";
    if (encoderMode == 2) return "R";
    return "P";
  }
}
