import jQuery from 'jquery'
window.$ = jQuery
import 'jquery-slimscroll'
import 'jquery-scroll-lock'
import 'jquery.appear'

import 'select2/dist/js/select2.full.min.js'
import 'select2/dist/css/select2.min.css'

import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap-notify'

import 'assets/css/codebase.min.css'
import 'assets/js/codebase.js'
import 'assets/js/plugins'

import 'assets/css/optica.css'

const images = require.context('assets/images', true)
const imagePath = (name) => images(name, true)
