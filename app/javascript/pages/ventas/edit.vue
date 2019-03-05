<template>
  <div id="venta-edit">
    <div class="table-responsive">
      <table class="table table-hover table-sm table-vcenter">
        <thead>
          <tr>
            <th>Cliente</th>
            <th>Fecha compra</th>
            <th>Fecha entrega</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td v-if="venta.cliente">{{ venta.cliente.nombre }}</td>
            <td>{{ venta.created_at }}</td>
            <td>{{ venta.fecha_entrega }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <form>
      <div class="row">
        <div class="col-md-3">
          <div class="form-group">
            <label for="venta_descuento" class="form-control-label"> Descuento </label>
            <input type="number" v-model="venta.descuento" id="venta_descuento" class="form-control" readonly/>
          </div>
        </div>

        <div class="col-md-3">
          <div class="form-group">
            <label for="venta_total" class="form-control-label"> Total </label>
            <input type="text" v-model="venta.total" id="venta_total" class="form-control" readonly/>
          </div>
        </div>

        <div class="col-md-3">
          <div class="form-group">
            <label for="venta_anticipo" class="form-control-label"> Anticipo </label>
            <input type="text" v-model="venta.anticipo" id="venta_anticipo" class="form-control" readonly/>
          </div>
        </div>

        <div class="col-md-3">
          <div class="form-group">
            <label for="venta_deuda" class="form-control-label"> Deuda </label>
            <input type="text" v-model="venta.deuda" id="venta_deuda" class="form-control" readonly/>
          </div>
        </div>
      </div>

      <h5 class="text-center" v-if="venta.vendidos_attributes">
        Productos vendidos ({{ venta.vendidos_attributes.length }})
      </h5>

      <div class="table-responsive">
        <table class="table table-hover table-sm table-vcenter text-center">
          <thead>
            <tr>
              <th>código</th>
              <th>producto</th>
              <th>cantidad</th>
              <th>precio venta</th>
              <th>descuento</th>
              <th>subtotal</th>
              <th>acciones</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(vendido, index) in venta.vendidos_attributes" :key="vendido.id">
              <td>{{ vendido.codigo }}</td>
              <td>{{ vendido.nombre }}</td>
              <td>{{ vendido.cantidad }}</td>
              <td class="text-right">{{ vendido.precio_venta | dinero }}</td>
              <td class="text-right">{{ vendido.descuento | dinero }}</td>
              <td class="text-right">{{ vendido.subtotal | dinero }}</td>
              <td>
                <button type="button" @click.prevent="sumarCantidad(index)"
                  class="btn btn-sm btn-alt-success">
                  <i class="fa fa-arrow-up"></i>
                </button>
                <button type="button" @click.prevent="restarCantidad(index)"
                  class="btn btn-sm btn-alt-primary">
                  <i class="fa fa-arrow-down"></i>
                </button>
                <button type="button" @click.prevent="eliminarProducto(index)"
                  class="btn btn-sm btn-alt-danger">
                  <i class="fa fa-times"></i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </form>
  </div>
</template>


<script>
export default {
  name: 'venta-edit',

  data() {
    return {
      venta: {}
    }
  },

  mounted() {
    this.obtenerVenta()
  },

  methods: {
    calcularTotal() {
      this.venta.descuento = this.venta.vendidos_attributes
              .reduce((descuento, p) => descuento + parseFloat(p.descuento), 0)

      this.venta.total = this.venta.vendidos_attributes
              .reduce((total, p) => total + parseFloat(p.subtotal), 0)

      this.venta.deuda = this.venta.total - this.venta.anticipo
    },

    sumarCantidad(index) {
      let v = this.venta.vendidos_attributes[index]
      v.cantidad += 1
      v.subtotal = (v.cantidad * v.precio_venta) - v.descuento
      this.calcularTotal()
    },

    restarCantidad(index) {
      let v = this.venta.vendidos_attributes[index]
      if (v.cantidad > 1) {
        v.cantidad -= 1
        v.subtotal = (v.cantidad * v.precio_venta) - v.descuento
        this.calcularTotal()
      }
    },

    eliminarProducto(index) {
      if (this.venta.vendidos_attributes.length > 1) {
        this.venta.vendidos_attributes.splice(index, 1)
        this.calcularTotal()
      }
    },

    obtenerVenta() {
      let id = parseInt(window.location.href.split('/')[4])

      this.$http.get(`/api/ventas/${id}`)
        .then(response => this.venta = response.data)
        .catch(err => console.log(err))
    }
  }
}
</script>
