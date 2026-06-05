# API 文档

## 镜像源 API

PubPub 使用 Pub 镜像站的 REST API。

### 基础 URL

默认：`https://pub.flutter-io.cn`

可在设置中切换其他镜像源。

### 搜索包

```
GET /api/search?q={query}&page={page}
```

**参数：**
| 参数 | 类型 | 必填 | 说明 |
|------|------|------|------|
| q | string | 是 | 搜索关键词 |
| page | int | 否 | 页码，默认 1 |

**响应：**
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

### 获取包详情

```
GET /api/packages/{name}
```

**响应：**
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

## 错误处理

所有 API 请求都通过 Dio 拦截器处理：

1. **缓存命中**：直接返回缓存数据，不发起网络请求
2. **网络成功**：返回数据并写入缓存
3. **网络失败**：尝试返回过期缓存（离线降级）
4. **完全失败**：显示错误信息

## 缓存策略

- 默认缓存时长：30 分钟
- 缓存 key：`{api}_{query}_{page}` 或 `detail_{packageName}`
- 缓存存储：Hive `api_cache` 盒
