<template>
  <div id="ventas-form">
    <form @submit.prevent="vender">
      <div class="row">
        <div class="col-4">
          <div class="form-group">
            <label for="fecha_entrega">
              Fecha entrega
              <span class="text-danger">*</span>
            </label>
            <input type="date" v-model="venta.fecha_entrega" id="fecha_entrega"
              class="form-control"
              :class="errores.fecha_entrega ? 'is-invalid' : ''"
              autocomplete="off"/>
            <div class="invalid-feedback" v-if="errores.fecha_entrega">
              {{ errores.fecha_entrega[0] }}
            </div>
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="cliente_nombre" class="form-control-label">
              Nombre
              <span class="text-danger">*</span>
            </label>
            <input type="text" v-model="venta.cliente_attributes.nombre"
              id="cliente_nombre"
              class="form-control"
              required/>
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="cliente_telefono" class="form-control-label">
              Telefono
            </label>
            <input type="text" v-model="venta.cliente_attributes.telefono"
              id="cliente_telefono"
              class="form-control"/>
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="descuento" class="form-control-label">
              Descuento
            </label>
            <input type="number" v-model="venta.descuento"
              min="0"
              id="descuento"
              class="form-control"/>
          </div>
        </div>
        <div class="col-4">
          <div class="form-group">
            <label for="total" class="form-control-label">
              Total
              <span class="text-danger">*</span>
            </label>
            <input type="number" v-model="venta.total" min="0" id="total"
              class="form-control"
              :class="errores.total ? 'is-invalid' : ''"/>
            <div class="invalid-feedback" v-if="errores.total">
              {{ errores.total[0] }}
            </div>
          </div>
        </div>
        <div class="col-12">
          <div class="form-group">
            <label for="observaciones" class="form-control-label">
              Observaciones
            </label>
            <textarea v-model="venta.observaciones" id="observaciones"
              class="form-control">
            </textarea>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-12">
          <div class="form-group">
            <label for="buscar-productos">Buscar el producto</label>
            <select v-model="producto" id="buscar-productos" class="form-control">
            </select>
          </div>
        </div>
      </div>

      <button type="submit" class="btn btn-alt-primary">
        <i class="fa fa-save"></i>
        Vender
      </button>
    </form>
  </div>
</template>

<script>
export default {
  name: 'ventas-form',

  data() {
    return {
      venta: {
        descuento: 0,
        total: 0,
        cliente_attributes: {}
      },
      producto: {},
      errores: {}
    }
  },

  mounted() {
    this.buscarProductos()
  },

  methods: {
    vender() {
      this.venta.fecha_entrega = $("#fecha_entrega").val()
      this.errors = {}
      this.$http.post('/ventas', this.venta)
        .then(response => {
          console.log(response)
        })
        .catch(err => this.errores = err.response.data)
    },

    buscarProductos() {
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
          data: (params) => { return { buscar: params.term } },
          processResults: (data, params) => {
            params.page = params.page || 1
            console.log(data)
            return {
              results: data.resultados,
              pagination: {
                more: (params.page * 10) < data.total_filtrados
              }
            }
          }
        }
      })
    }
  }
}
</script>
