# 架构文档

## 整体架构

PubPub 采用 **Service + Controller + Page** 三层架构：

```
┌─────────────────────────────────────────┐
│               Pages (UI)                │
│  home_page / detail_page / favorites    │
├─────────────────────────────────────────┤
│           Controllers (GetX)            │
│  search / detail / favorites / settings │
├─────────────────────────────────────────┤
│             Services (Data)             │
│  api / cache / favorites / settings     │
├─────────────────────────────────────────┤
│              Models (DTO)               │
│  PackageSearchResult / PackageDetail    │
└─────────────────────────────────────────┘
```

## 状态管理

使用 **GetX** 进行状态管理：

- **响应式变量**：`Rx<T>` / `.obs` 声明
- **依赖注入**：`Get.put()` / `Get.find()`
- **UI 更新**：`Obx(() => ...)` 自动监听变化

## 响应式布局

```
LayoutBuilder (监听窗口宽度)
    └── LayoutController.updateWidth()
            ├── < 600px  → MobileLayout (底部导航)
            ├── < 1200px → TabletLayout (同桌面端)
            └── >= 1200px → DesktopLayout (侧边栏)
```

## 缓存机制

```
请求流程:
1. 检查 Hive 缓存 → 有效 → 返回缓存
2. 缓存过期或不存在 → 发起网络请求
3. 请求成功 → 写入缓存 → 返回数据
4. 请求失败 → 尝试返回过期缓存（离线降级）
```

缓存结构：
- `api_cache` 盒：`{ data: Map, timestamp: int, ttl: int }`
- `favorites` 盒：收藏夹数据
- `settings` 盒：用户设置

## 收藏夹数据结构

```json
{
  "默认收藏": ["dio", "get", "provider"],
  "网络相关": ["dio", "http"],
  "状态管理": ["get", "provider", "riverpod"]
}
```

存储在 Hive 的 `favorites` 盒中，key 为 `favorites_folders`。
