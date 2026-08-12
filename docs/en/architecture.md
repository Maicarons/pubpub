---
title: Architecture
---

# Architecture

## Overview

PubPub uses a **Service + Controller + Page** three-layer architecture:

```
Pages (UI)
  home_page / detail_page / favorites
Controllers (GetX)
  search / detail / favorites / settings
Services (Data)
  api / cache / favorites / settings
Models (DTO)
  PackageSearchResult / PackageDetail
```

## State management

State is managed with **GetX**:

- Reactive variables: `Rx<T>` / `.obs`
- Dependency injection: `Get.put()` / `Get.find()`
- UI updates: `Obx(() => ...)` automatically reacts to changes

## Responsive layout

```
LayoutBuilder (watches window width)
    -> LayoutController.updateWidth()
        -> < 600px  -> MobileLayout (bottom nav)
        -> < 1200px -> TabletLayout (same as desktop)
        -> >= 1200px -> DesktopLayout (sidebar)
```

## Caching

```
Request flow:
1. Check Hive cache -> valid -> return cache
2. Cache missing or expired -> send network request
3. Success -> write cache -> return data
4. Failure -> return expired cache if available (offline fallback)
```

Cache structure:

- `api_cache` box: `{ data: Map, timestamp: int, ttl: int }`
- `favorites` box: collection data
- `settings` box: user settings

## Collection data structure

```json
{
  "Default": ["dio", "get", "provider"],
  "Network": ["dio", "http"],
  "State Management": ["get", "provider", "riverpod"]
}
```

Stored in the Hive `favorites` box under the key `favorites_folders`.
