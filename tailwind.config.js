const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [    
    "./app/views/**/*"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Montserrat', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [],
}
