# CLAUDE.md

This file provides guidance to AI agents when working with code in this repository.

## Project Overview

StarterKit is a starter kit that provides a quick start for Flutter projects and includes a structured layout and reusable widgets.

## Tools & Configuration

- **Language**: Dart / Flutter (iOS + Android)
- **Architecture**: Feature-based, MVVM
- **State Management**: Custom `StoreBase<T>` system (ValueNotifier-based, no third-party)
- **API**: Dio (`DioService` wrapper) with `CustomInterceptor`
- **Local Storage**: Hive (key-value)
- **Firebase**: Analytics, Realtime Database
- **Push Notifications**: OneSignal
- **Routing**: Named routes via `RouteGenerator`, platform-aware transitions
- **UI Language**: Turkish

## Project Structure

Flutter project lives in `starterkit/` subdirectory (not repo root). All AI agents must follow this and [flutter-coder.md](ai/flutter-coder.md) instructions.
