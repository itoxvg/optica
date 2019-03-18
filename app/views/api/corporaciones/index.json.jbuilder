json.items do
  json.array! @corporaciones, partial: 'api/corporaciones/corporacion', as: :corporacion
end

json.set! :total_items, @corporaciones.total_count
