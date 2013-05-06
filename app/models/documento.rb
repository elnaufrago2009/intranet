class Documento < ActiveRecord::Base
    belongs_to :archivo
    mount_uploader :documentoimg, DocumentoimgUploader
    attr_accessible :archivo_id, :descripcion, :documentoimg, :nombre, :tipoformato
end
