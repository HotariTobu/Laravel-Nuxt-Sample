// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },

  // modules: [
  //   '@nuxtjs/auth-next',
  //   '@nuxtjs/axios',
  // ],
  // auth: {
  //   // Options
  // },

  // typescript: {
  //   tsConfig: {
  //     compilerOptions: {
  //       types: [
  //         "@nuxtjs/auth-next",
  //       ],
  //     },
  //   },
  // },

  ssr: false,

  modules: [
    'nuxt-sanctum-auth'
  ],

  // Enable hot reloading on docker container
  vite: {
    server: {
      watch: {
        usePolling: true,
        interval: 2000,
      },
    },
  },
})
