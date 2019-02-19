import Vue from 'vue'
import axios from 'axios'

axios.defaults.baseURL = 'http://localhost:3000'
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

import VentasForm from '../pages/ventas/form.vue'

document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('ventas-form')) {
    const app = new Vue({
      el: '#ventas-form',
      render: h => h(VentasForm)
    })
  }
})
