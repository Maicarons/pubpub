import { defineConfig } from 'vitepress'

export default defineConfig({
  base: '/pubpub/',
  title: 'PubPub',
  description: '跨平台 Pub 包浏览器 —— 搜索、浏览、收藏 Flutter/Dart 包',
  lastUpdated: true,
  cleanUrls: true,
  locales: {
    root: {
      label: '简体中文',
      lang: 'zh-CN',
      themeConfig: {
        nav: [
          { text: '快速开始', link: '/getting-started' },
          { text: '开发指南', link: '/development' },
          {
            text: '参考',
            items: [
              { text: '架构', link: '/architecture' },
              { text: 'API', link: '/api' },
              { text: '本地化', link: '/localization' },
            ],
          },
          { text: 'GitHub', link: 'https://github.com/Maicarons/pubpub' },
        ],
        sidebar: [
          {
            text: '指南',
            items: [
              { text: '简介', link: '/' },
              { text: '快速开始', link: '/getting-started' },
              { text: '开发指南', link: '/development' },
            ],
          },
          {
            text: '参考',
            items: [
              { text: '架构', link: '/architecture' },
              { text: 'API', link: '/api' },
              { text: '本地化', link: '/localization' },
            ],
          },
        ],
      },
    },
    en: {
      label: 'English',
      lang: 'en',
      themeConfig: {
        nav: [
          { text: 'Getting Started', link: '/en/getting-started' },
          { text: 'Development', link: '/en/development' },
          {
            text: 'Reference',
            items: [
              { text: 'Architecture', link: '/en/architecture' },
              { text: 'API', link: '/en/api' },
              { text: 'Localization', link: '/en/localization' },
            ],
          },
          { text: 'GitHub', link: 'https://github.com/Maicarons/pubpub' },
        ],
        sidebar: [
          {
            text: 'Guide',
            items: [
              { text: 'Introduction', link: '/en/' },
              { text: 'Getting Started', link: '/en/getting-started' },
              { text: 'Development', link: '/en/development' },
            ],
          },
          {
            text: 'Reference',
            items: [
              { text: 'Architecture', link: '/en/architecture' },
              { text: 'API', link: '/en/api' },
              { text: 'Localization', link: '/en/localization' },
            ],
          },
        ],
      },
    },
  },
  themeConfig: {
    search: { provider: 'local' },
    socialLinks: [
      { icon: 'github', link: 'https://github.com/Maicarons/pubpub' },
    ],
    footer: {
      message: '基于 VitePress 构建',
      copyright: 'Copyright (c) 2024 Mai',
    },
    docFooter: { prev: '上一篇', next: '下一篇' },
    outline: { label: '本页目录' },
    lastUpdatedText: '最后更新',
    sidebarMenuLabel: '菜单',
    returnToTopLabel: '回到顶部',
    langMenuLabel: '切换语言',
  },
})
