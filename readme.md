# WeWrite iOS App

This repository contains a simplified SwiftUI implementation of the **WeWrite** collaborative novel writing application. The app allows users to browse novels by category, create their own stories and read chapters generated with the help of a backend service.

## Features

- Category tabs for switching between novel genres.
- Bookshelf grid showing existing novels with an empty slot for creating a new one.
- Modal form to create a novel with options for ideas, themes, roles and plots.
- Reading view that loads chapters from the server and lets the reader rate them.
- Simple feedback sheet to submit likes, neutral or dislike opinions.
- Networking layer in `NovelService` that communicates with the backend (URLs are placeholders).

All views are built with SwiftUI. You can open the `WeWriteApp` folder in Xcode 15 or later and run on iOS 17.

Backend APIs must implement the following endpoints:

1. `POST /novels` – create a new novel.
2. `GET /novels?category=` – fetch a list of novels for a given category.
3. `GET /novels/{id}/chapters/{chapterId}` – retrieve a specific chapter.
4. `POST /novels/{id}/chapters` – request generation of the next chapter.

The data models for `Novel` and `Chapter` match these API responses.

This is a minimal example project and does not include image generation or audio playback. The networking code assumes JSON responses and should be adapted to your own backend implementation.
