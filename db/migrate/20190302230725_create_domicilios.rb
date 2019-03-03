class CreateDomicilios < ActiveRecord::Migration[5.2]
  def change
    create_table :domicilios do |t|
      t.string :calle
      t.string :numero
      t.string :colonia
      t.string :codigo_postal
      t.string :municipio
      t.string :estado, default: "Oaxaca"
      t.string :pais, default: "México"
      t.string :domiciliable_type
      t.integer :domiciliable_id

      t.timestamps
    end
  end
end
