---
title: API
---

# API Reference

## Mirror API

PubPub uses the REST API exposed by Pub mirrors.

### Base URL

Default: `https://pub.flutter-io.cn`

You can switch to other mirrors in Settings.

### Search packages

```
GET /api/search?q={query}&page={page}
```

**Parameters:**

| Param | Type   | Required | Description     |
|-------|--------|----------|-----------------|
| q     | string | yes      | Search keyword  |
| page  | int    | no       | Page, default 1 |

**Response:**

```json
{
  "packages": [
    {
      "package": "dio",
      "description": "A powerful HTTP client for Dart",
      "version": "5.4.0",
      "likes": 1234,
      "pubScore": 98,
      "popularityScore": 0.97
    }
  ],
  "nextPage": "/api/search?q=dio&page=2"
}
```

### Get package details

```
GET /api/packages/{name}
```

**Response:**

```json
{
  "name": "dio",
  "latestVersion": "5.4.0",
  "description": "A powerful HTTP client for Dart",
  "publisher": { "name": "flutter.dev" },
  "license": "MIT",
  "likes": 1234,
  "score": 98,
  "popularityScore": 0.97,
  "versions": [
    {
      "version": "5.4.0",
      "published": "2024-01-01T00:00:00Z",
      "dartVersion": ">=3.0.0 <4.0.0",
      "flutterVersion": ">=3.10.0",
      "dependencies": {
        "http": "^1.0.0",
        "path": "^1.8.0"
      }
    }
  ],
  "homepage": "https://pub.dev/packages/dio",
  "repository": "https://github.com/flutterchina/dio"
}
```

## Error handling

All requests are handled by a Dio interceptor:

1. Cache hit: return cached data, no network request
2. Network success: return data and write to cache
3. Network failure: try returning expired cache (offline fallback)
4. Total failure: show an error message

## Cache strategy

- Default cache TTL: 30 minutes
- Cache key: `{api}_{query}_{page}` or `detail_{packageName}`
- Cache storage: Hive `api_cache` box
