class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.string :nombre
      t.string :resumen
      t.text :contenido
      t.integer :tipodocumento_id

      t.timestamps
    end
  end
end
