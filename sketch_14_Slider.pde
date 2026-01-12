class Slider extends ControlBase {

  float value = 0.5;        // 0..1
  float handleH = 40;
  boolean dragging = false;

  float minY;
  float maxY;

  Slider(String id, float x, float y, float w, float h) {
    super(id, x, y, w, h);
    controlType = "slider";

    minY = y;
    maxY = y + h - handleH;

    value = constrain(value, 0, 1);
  }

  void drawControl() {
    // трек
    fill(200);
    rect(x, y, w, h, 6);

    // ручка
    float handleY = map(value, 0, 1, maxY, minY);
    fill(isHovered(mouseX, mouseY) ? 120 : 150);
    rect(x + w/2 - w*0.25, handleY, w*0.5, handleH, 6);
  }

  void update() {
    if (dragging) {
      float ny = mouseY - handleH/2;
      ny = constrain(ny, minY, maxY);
  
      value = map(ny, maxY, minY, 0, 1);
      value = constrain(value, 0, 1);
  
      midiValue = getMidiValue(); // ← ВОТ ЭТО
    }
  }


  void mousePressed() {
    if (isHandleHovered(mouseX, mouseY)) {
      dragging = true;
    }
  }

  void mouseReleased() {
    dragging = false;
  }

  boolean isHandleHovered(float mx, float my) {
    float handleY = map(value, 0, 1, maxY, minY);
    return mx >= x && mx <= x + w &&
           my >= handleY && my <= handleY + handleH;
  }

  // =================================
  // VALUE CONVERSION (ВНУТРИ КЛАССА!)
  // =================================
  int getMidiValue() {
    return round(map(value, 0, 1, 0, 127));
  }

  float getNormalizedValue() {
    return value;
  }
}
