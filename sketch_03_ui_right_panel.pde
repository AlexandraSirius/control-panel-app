void drawRightPanel() {

  float px = width - 260;
  float py = 50;
  float pw = 250;
  float ph = height - 60;

  fill(40);
  rect(px, py, pw, ph);

  fill(220);
  textAlign(LEFT, TOP);
  textSize(12);

  // =========================
  // TAB 0 — ОРГАНЫ
  // =========================
  if (activeTab == 0) {

    text("Настройки органа", px + 10, py + 10);

    if (activeControl == null) {
      text("Выберите орган слева", px + 10, py + 40);
      return;
    }

    ControlConfig cfg = activeControl.config;

    float y = py + 40;

    text("ID: " + activeControl.id, px + 10, y); y += 18;
    text("Тип: " + activeControl.controlType, px + 10, y); y += 25;

    // ---------- MIDI ----------
    text("MIDI", px + 10, y);
    y += 16;
    
    drawNumberField("Device", px, y, cfg.midiDevice);
    y += 18;
    
    drawNumberField("Channel", px, y, cfg.midiChannel);
    y += 18;
    
    drawNumberField("Param 1", px, y, cfg.midiParam1);
    y += 18;
    
    drawNumberField("Param 2", px, y, cfg.midiParam2);
    y += 18;
    
    drawNumberField("Param 3", px, y, cfg.midiParam3);
    y += 25;


    // ---------- OSC ----------
    text("OSC", px + 10, y); y += 16;

    text("Path: " + cfg.oscPath, px + 10, y); y += 18;
    text("Min: " + nf(cfg.oscMin, 1, 3), px + 10, y); y += 18;
    text("Max: " + nf(cfg.oscMax, 1, 3), px + 10, y);
  }

  // =========================
  // TAB 1 — ЦВЕТА
  // =========================
  if (activeTab == 1) {
    text("Цвет кнопки", px + 10, py + 10);
    text("Color picker будет здесь", px + 10, py + 40);
  }

  // =========================
  // TAB 2 — СЕТЬ
  // =========================
  if (activeTab == 2) {
    text("Сетевые настройки", px + 10, py + 10);
    text("IP / Port / OSC", px + 10, py + 40);
  }
}
void drawNumberField(String label, float px, float y, int value) {
  fill(180);
  text(label + ": " + value, px + 10, y);
}
