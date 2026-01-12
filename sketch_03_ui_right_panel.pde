void drawRightPanel() {

  float px = width - 260;
  float py = 50;
  float pw = 250;
  float ph = height - 60;

  fill(40);
  rect(px, py, pw, ph);

  fill(200);
  textAlign(LEFT, TOP);

  // TAB 0 — ОРГАНЫ
  if (activeTab == 0) {
    text("Настройки органа", px + 10, py + 10);

    if (selectedControl == null) {
       text("Выберите орган слева", px + 10, py + 40);
    } else {
       text("ID: " + selectedControl.id, px + 10, py + 40);
       text("Тип: " + selectedControl.controlType, px + 10, py + 60);
    }
  }

  // TAB 1 — ЦВЕТА
  if (activeTab == 1) {
    text("Цветовые настройки", px + 10, py + 10);
    text("Тут будут цветовые настройки кнопок", px + 10, py + 40);
  }

  // TAB 2 — СЕТЬ
  if (activeTab == 2) {
    text("Сетевые настройки", px + 10, py + 10);
    text("Тут будут настройки OSC / IP / Port", px + 10, py + 40);
  }
}
