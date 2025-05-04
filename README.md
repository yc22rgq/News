# 📰 Swift NewsReader App

Приложение для чтения новостей с использованием [NewsAPI.org](https://newsapi.org/), реализованное с использованием Clean Architecture, архитектуры MVVM, UIKit и CoreData.

---

## 🧱 Архитектура

Проект разделён на три слоя:

- **Data Layer** — отвечает за работу с внешними API и локальной базой данных (CoreData).
- **Domain Layer** — содержит бизнес-логику и модели.
- **Presentation Layer** — UI-компоненты, ViewModels и навигация.

Используется MVVM для каждого экрана.

---

## ⚙️ Технологии

- Swift 5
- UIKit
- Clean Architecture + MVVM
- CoreData
- NewsAPI.org
- AutoLayout (программно)
- Dark Mode поддержка
- Unit Tests (Data + Domain)

---

## 🖼️ UI Screens

- 📰 **Список новостей** — новости из различных источников.
- 📄 **Детали новости** — полная информация о выбранной новости.
- 📌 **Bookmarks** — сохранённые новости, доступные offline.
- 🔁 Pull-to-refresh и таббар с двумя вкладками.

---

## 🧪 Unit-тесты

Покрытие юнит-тестами:
- `BookmarkService` (CoreData)
- Модель `News` (бизнес-логика)
- Используется `InMemoryCoreDataStack` для изоляции тестов от основной базы.

---

## 🚀 Запуск проекта

1. Склонируйте репозиторий:
    ```bash
    git clone https://github.com/your-username/NewsReaderApp.git
    ```

2. Установите [Xcode](https://developer.apple.com/xcode/) (если ещё не установлен).

3. Откройте `.xcodeproj` или `.xcworkspace` файл.

4. Вставьте ваш API-ключ в `NewsService.swift`:
    ```swift
    private let apiKey = "YOUR_NEWS_API_KEY"
    ```

5. Запустите проект на симуляторе или устройстве.

---

## 📁 Структура проекта

```
NewsReaderApp/
├── Data/
│   ├── Models/
│   ├── Network/
│   ├── Persistence/
│   └── RepositoriesImpl/
├── Domain/
│   ├── Entities/
│   └── Repositories/
├── Presentation/
│   ├── Modules/
│   ├── Views/
│   └── Common/
├── Resources/
├── SupportingFiles/
└── Tests/
```

---
