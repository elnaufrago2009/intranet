class Archivo < ActiveRecord::Base
  belongs_to :tipodocumento
  has_many :documentos
  attr_accessible :contenido, :nombre, :resumen, :tipodocumento_id
end
