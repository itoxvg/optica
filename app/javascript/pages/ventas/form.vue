<template>
  <form @submit.prevent="vender" id="ventas-form">
    <div class="row">

      <div class="col-4">
        <div class="form-group">
          <label for="fecha_entrega">
            Fecha entrega <span class="text-danger">*</span>
          </label>
          <input type="date" v-model="venta.fecha_entrega" id="fecha_entrega"
            class="form-control" :class="errores.fecha_entrega ? 'is-invalid' : ''" autocomplete="off"/>
          <div class="invalid-feedback" v-if="errores.fecha_entrega">{{ errores.fecha_entrega[0] }}</div>
        </div>
      </div>

      <div class="col-4">
        <div class="form-group">
          <label for="cliente_nombre" class="form-control-label">
            Nombre <span class="text-danger">*</span>
          </label>
          <input type="text" v-model="venta.cliente_attributes.nombre"
            id="cliente_nombre" class="form-control" placeholder="Nombre del cliente" required/>
        </div>
      </div>

      <div class="col-4">
        <div class="form-group">
          <label for="cliente_telefono" class="form-control-label"> Telefono </label>
          <input type="text" v-model="venta.cliente_attributes.telefono"
            id="cliente_telefono" class="form-control" placeholder="Telefono del cliente"/>
        </div>
      </div>

      <div class="col-4">
        <div class="form-group">
          <label for="descuento" class="form-control-label"> Descuento </label>
          <input type="number" :value="descuento" id="descuento" class="form-control" readonly/>
        </div>
      </div>

      <div class="col-4">
        <div class="form-group">
          <label for="total" class="form-control-label">
            Total <span class="text-danger">*</span>
          </label>
          <input type="number" :value="total" id="total" class="form-control"
            :class="errores.total ? 'is-invalid' : ''" readonly/>
          <div class="invalid-feedback" v-if="errores.total">{{ errores.total[0] }}</div>
        </div>
      </div>

      <div class="col-4">
        <div class="form-group">
          <label for="pago" class="form-control-label">
            Pago <span class="text-danger">*</span>
          </label>
          <input type="number" v-model="venta.pago" id="pago"
            class="form-control" :class="errores.pago ? 'is-invalid' : ''"
            placeholder="Pago del cliente"/>
          <div class="invalid-feedback" v-if="errores.pago">{{ errores.pago[0] }}</div>
        </div>
      </div>

      <div class="col-12">
        <div class="form-group">
          <label for="observaciones" class="form-control-label"> Observaciones </label>
          <textarea v-model="venta.observaciones" id="observaciones" class="form-control"></textarea>
        </div>
      </div>

    </div>

    <div v-if="venta_tiene_productos">
      <div class="row">
        <div class="col-12">
          <div class="table-responsive">
            <table class="table table-striped table-bordered table-condensed table-hover">
              <thead>
                <tr>
                  <th>existencia</th>
                  <th>código</th>
                  <th>nombre</th>
                  <th>tipo</th>
                  <th>cantidad</th>
                  <th>precio</th>
                  <th>descuento</th>
                  <th>subtotal</th>
                  <th>acciones</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(vendido, index) in venta.vendidos_attributes" :key="vendido.id">
                  <td>{{ vendido.existencia }}</td>
                  <td>{{ vendido.codigo }}</td>
                  <td>{{ vendido.nombre }}</td>
                  <td>{{ vendido.tipo }}</td>
                  <td>
                    <input type="number" v-model="vendido.cantidad"
                      @change.prevent="calcularSubtotal"
                      @keyup="calcularSubtotal"
                      id="cantidad"
                      class="form-control"/>
                  </td>
                  <td class="text-right">{{ vendido.precio_venta }}</td>
                  <td>
                    <input type="number" v-model="vendido.descuento"
                      @change.prevent="calcularSubtotal"
                      @keyup="calcularSubtotal"
                      id="descuento"
                      class="form-control"/>
                  </td>
                  <td class="text-right">{{ vendido.subtotal }}</td>
                  <td class="text-center">
                    <div class="btn-group">
                      <button type="button" @click.prevent="eliminarProducto(index)"
                        class="btn btn-sm btn-danger">
                        <i class="fa fa-times"></i>
                      </button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-10">
        <div class="form-group">
          <label for="buscar-productos">Seleccionar productos</label>
          <select id="buscar-productos" class="form-control"></select>
        </div>
      </div>

      <div class="col-2 align-self-center">
        <button type="submit" class="btn btn-alt-primary">
          <i class="fa fa-save"></i>
          Cobrar
        </button>
      </div>
    </div>

  </form>
</template>

<script>
export default {
  name: 'ventas-form',

  data() {
    return {
      venta: {
        total: 0,
        descuento: 0,
        cliente_attributes: {},
        vendidos_attributes: [],
      },
      errores: {}
    }
  },

  mounted() {
    this.buscador()
    window.$('#buscar-productos').on('select2:select', (event) => {
      this.agregarProducto()
      this.limpiarBuscador()
      this.abrirBuscador()
      this.calcularSubtotal()
    })
  },

  computed: {
    venta_tiene_productos() {
      if (this.venta.vendidos_attributes.length) return true
      return false
    },

    total() {
      return this.venta.total = this.venta.vendidos_attributes
              .reduce((total, p) => total + p.subtotal, 0)
    },

    descuento() {
      return this.venta.descuento = this.venta.vendidos_attributes
              .reduce((descuento, p) => descuento + parseFloat(p.descuento), 0)
    }
  },

  methods: {
    vender() {
      this.$http.post('/ventas', this.venta)
        .then(response => {
          //TODO lanzar notificacion
        })
        .catch(err => {
          this.errors = {}
          this.errores = err.response.data
        })
    },

    calcularSubtotal() {
      this.venta.vendidos_attributes.map((p) => {
        p.subtotal = (p.cantidad * p.precio_venta) - p.descuento
      })
    },

    abrirBuscador() {
      window.$('#buscar-productos').select2('open')
    },

    limpiarBuscador() {
      window.$("#buscar-productos").val(null).trigger("change")
    },

    agregarProducto() {
      let producto = JSON.parse(window.$('#buscar-productos').val())
      this.venta.vendidos_attributes.push(producto)
    },

    eliminarProducto(index) {
      this.venta.vendidos_attributes.splice(index, 1)
    },

    buscador() {
      window.$('#buscar-productos').select2({
        placeholder: 'Buscar productos',
        language: 'es',
        escapeMarkup: (markup) => { return markup },
        maximumSelectionLength: 1,
        allowClear: true,
        ajax: {
          url: `${window.location.origin}/api/productos`,
          dataType: 'json',
          delay: 250,
          data: (params) => { return { q: params.term } },
          processResults: (data, params) => {
            params.page = params.page || 1

            let items = data.items.map((item) => {
              return {
                id: JSON.stringify(item),
                text: `${item.existencia} | ${item.codigo} | ${item.nombre} | ${item.tipo}`
              }
            })

            return {
              results: items,
              pagination: {
                more: (params.page * 10) < data.total_items
              }
            }
          }
        }
      })
    }
  }
}
</script>
