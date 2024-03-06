const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'terracotta': {
          '50': '#faf5f0',
          '100': '#f7eee4',
          '200': '#e8cfba',
          '300': '#dbb095',
          '400': '#c27055',
          '500': '#a73121',
          '600': '#96291b',
          '700': '#7d1d13',
          '800': '#63150c',
          '900': '#4a0c07',
          '950': '#300703'
          }
        }
      }
      },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
