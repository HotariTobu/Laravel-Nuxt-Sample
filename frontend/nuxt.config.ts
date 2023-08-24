// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },

  // Dockerコンテナでのホットリロードを有効にする
  vite: {
    server: {
      watch: {
        usePolling: true,
        interval: 2000,
      },
    },
  },
})
