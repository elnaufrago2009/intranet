class CreateTipodocumentos < ActiveRecord::Migration
  def change
    create_table :tipodocumentos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :tipodocumentoimg

      t.timestamps
    end
  end
end
