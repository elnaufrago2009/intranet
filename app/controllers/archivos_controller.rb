class ArchivosController < ApplicationController
  # GET /archivos
  # GET /archivos.json
  layout "front_end"
  def index

  if !params[:nombre].blank? && !params[:created_at].blank? && !params[:updated_at].blank?
    @buscar = 'si existen los 3'
    @archivos = Archivo.paginate(:page => params[:page], :per_page => 4, :conditions => ['lower (nombre) like ? and created_at between ? and ?', "%#{params[:nombre]}%" , "#{params[:created_at]}", "#{params[:updated_at]}"]).order("id Desc")
  elsif params[:nombre].blank? && !params[:created_at].blank? && !params[:updated_at].blank?
    @buscar = 'si existen solo fechas'
    @archivos = Archivo.paginate(:page => params[:page], :per_page => 4, :conditions => ['created_at between ? and ?' , "#{params[:created_at]}", "#{params[:updated_at]}"]).order("id Desc")
  elsif !params[:nombre].blank? && params[:created_at].blank? && params[:updated_at].blank?
    @buscar = 'existe solo nombre'
    @archivos = Archivo.paginate(:page => params[:page], :per_page => 4, :conditions => ['lower (nombre) like ?', "%#{params[:nombre]}%"]).order("id Desc")
  elsif params[:nombre].blank? && params[:created_at].blank? && params[:updated_at].blank?
    @buscar = 'ninguno'
    @archivos = Archivo.paginate(:page => params[:page], :per_page => 4).order("id Desc")
  elsif params[:nombre].blank? && !params[:created_at].blank? && params[:updated_at].blank?
    @buscar = 'solo Inicio'
    @archivos = Archivo.paginate(:page => params[:page], :per_page => 4, :conditions => ['created_at >= ?',"#{params[:created_at]}"]).order("id Desc")
  elsif params[:nombre].blank? && params[:created_at].blank? && !params[:updated_at].blank?
    @buscar = 'solo Final'
    @archivos = Archivo.paginate(:page => params[:page], :per_page => 4, :conditions => ['created_at <= ?', "#{params[:updated_at]}"]).order("id Desc")
  elsif !params[:nombre].blank? && !params[:created_at].blank? && params[:updated_at].blank?
    @buscar = 'nombre y created'
    @archivos = Archivo.paginate(:page => params[:page], :per_page => 4, :conditions => ['lower (nombre) like ? and created_at > ?', "%#{params[:nombre]}%", "#{params[:created_at]}"]).order("id Desc")
  elsif !params[:nombre].blank? && params[:created_at].blank? && !params[:updated_at].blank?
    @buscar = 'nombre y updated'
    @archivos = Archivo.paginate(:page => params[:page], :per_page => 4, :conditions => ['lower (nombre) like ? and created_at < ?', "%#{params[:nombre]}%", "#{params[:updated_at]}"]).order("id Desc")
  end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @archivos }
    end
  end

  # GET /archivos/1
  # GET /archivos/1.json
  def show
    @archivo = Archivo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @archivo }
    end
  end

  # GET /archivos/new
  # GET /archivos/new.json
  def new
    @archivo = Archivo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @archivo }
    end
  end

  # GET /archivos/1/edit
  def edit
    @archivo = Archivo.find(params[:id])
  end

  # POST /archivos
  # POST /archivos.json
  def create
    @archivo = Archivo.new(params[:archivo])

    respond_to do |format|
      if @archivo.save
        format.html { redirect_to @archivo, notice: 'Archivo was successfully created.' }
        format.json { render json: @archivo, status: :created, location: @archivo }
      else
        format.html { render action: "new" }
        format.json { render json: @archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /archivos/1
  # PUT /archivos/1.json
  def update
    @archivo = Archivo.find(params[:id])

    respond_to do |format|
      if @archivo.update_attributes(params[:archivo])
        format.html { redirect_to @archivo, notice: 'Archivo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archivos/1
  # DELETE /archivos/1.json
  def destroy
    @archivo = Archivo.find(params[:id])
    @archivo.destroy

    respond_to do |format|
      format.html { redirect_to archivos_url }
      format.json { head :no_content }
    end
  end
end
