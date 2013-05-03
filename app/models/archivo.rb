class Archivo < ActiveRecord::Base
  attr_accessible :contenido, :nombre, :resumen, :tipodocumento_id
end
