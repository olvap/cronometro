var riot = require('riot')

require('./tags/new-competitor.tag')

document.addEventListener('DOMContentLoaded', () => {
  riot.mount('*')
})
