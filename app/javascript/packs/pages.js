import Vue from 'vue'
import axios from 'axios'

axios.defaults.baseURL = window.location.origin
axios.defaults.headers.post['Content-Type'] = 'application/json'
axios.defaults.headers.post['Accept'] = 'application/json'
axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
Vue.prototype.$http = axios

Vue.filter('dinero', (value) => {
  let formatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
    minimumFractionDigits: 0
  })
  return formatter.format(value)
})

import VentasNew from '../pages/ventas/new'

document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('venta-new')) {
    const app = new Vue({
      el: '#venta-new',
      render: h => h(VentasNew)
    })
  }
})
