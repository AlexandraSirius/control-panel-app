void setup() {
  size(1000, 600);
  smooth(4);

  initControls();
}

void draw() {
  background(60);

  drawTabs();

  // показываем органы ТОЛЬКО во вкладке ОРГАНЫ
  if (activeTab == 0) {
    drawControls();
  }

  drawRightPanel();
}

// ===================================================
// MOUSE EVENTS
// ===================================================
void mousePressed() {

  // 1️⃣ СНАЧАЛА — выбор элемента (КАК БЫЛО РАНЬШЕ)
  handleControlClick();

  // 2️⃣ ПОТОМ — проброс события контролам (для Slider и др.)
  for (ControlBase c : controls) {
    c.mousePressed();
  }
}

void mouseReleased() {
  for (ControlBase c : controls) {
    c.mouseReleased();
  }
}
