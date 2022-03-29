module.exports = {
  content: [
    "../templates/**/*.eex", 
    "../includes/**/*.eex",
    "../pages/**/*.eex" 
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Quicksand", "sans-serif"]
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography')
  ]
}
