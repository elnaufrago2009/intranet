class CreateDocumentos < ActiveRecord::Migration
  def change
    create_table :documentos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :documentoimg
      t.string :tipoformato
      t.integer :archivo_id

      t.timestamps
    end
  end
end
