// главный файл проекта (первый компилируется)

import java.util.ArrayList;

// глобальный список органов управления
ArrayList<ControlBase> controls = new ArrayList<ControlBase>();

// текущая активная вкладка меню
int activeTab = 0; // 0 — органы, 1 — цвета, 2 — сеть

ControlBase selectedControl = null; // выбранный элемент
ControlBase activeControl = null;
