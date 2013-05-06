class Tipodocumento < ActiveRecord::Base
  has_many :archivos
  mount_uploader :tipodocumentoimg, TipodocumentoUploader
  attr_accessible :descripcion, :nombre, :tipodocumentoimg
end
