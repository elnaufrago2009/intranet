class Documento < ActiveRecord::Base
  attr_accessible :archivo_id, :descripcion, :documentoimg, :nombre, :tipoformato
end
