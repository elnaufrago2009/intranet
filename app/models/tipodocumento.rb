class Tipodocumento < ActiveRecord::Base
  has_many :archivos
  mount_uploader :tipodocumentoimg, TipodocumentoimgUploader
  attr_accessible :descripcion, :nombre, :tipodocumentoimg
end
