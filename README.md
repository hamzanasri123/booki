# Booki

Booki is a Flutter MVP for a SaaS booking and management platform for local service businesses in Tunisia.

## Current Scope

This repository starts Sprint 0 from the technical architecture document:

- Clean Architecture + feature-first folder structure
- Riverpod application state
- GoRouter navigation
- Theme and reusable design-system widgets
- Static client home, business dashboard, business setup, booking, and appointments screens

## Run Locally

Flutter is not available in the current Codex shell, so platform folders were not generated here.

When Flutter is installed locally:

```bash
flutter create .
flutter pub get
flutter run
```

Firebase setup is intentionally left for Sprint 1. Add Firebase configuration with FlutterFire before enabling real authentication and Firestore access.
