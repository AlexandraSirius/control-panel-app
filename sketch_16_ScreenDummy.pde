class ScreenDummy extends ControlBase {

  ScreenDummy(String id, float x, float y, float w, float h) {
    super(id, x, y, w, h);
    controlType = "screen";
  }

  void drawControl() {
    fill(40);
    stroke(80);
    rect(x, y, w, h, 4);

    fill(160);
    textAlign(CENTER, CENTER);
    text("SCREEN", x + w/2, y + h/2);
  }
}
