class CreateEmpresas < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :telefono
      t.string :rfc
      t.string :eslogan
      t.string :logotipo
      t.string :type

      t.timestamps
    end
  end
end
