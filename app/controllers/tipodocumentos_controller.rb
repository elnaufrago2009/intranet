class TipodocumentosController < ApplicationController
  # GET /tipodocumentos
  # GET /tipodocumentos.json
  layout "front_end"
  def index
    @tipodocumentos = Tipodocumento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipodocumentos }
    end
  end

  # GET /tipodocumentos/1
  # GET /tipodocumentos/1.json
  def show
    @tipodocumento = Tipodocumento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipodocumento }
    end
  end

  # GET /tipodocumentos/new
  # GET /tipodocumentos/new.json
  def new
    @tipodocumento = Tipodocumento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipodocumento }
    end
  end

  # GET /tipodocumentos/1/edit
  def edit
    @tipodocumento = Tipodocumento.find(params[:id])
  end

  # POST /tipodocumentos
  # POST /tipodocumentos.json
  def create
    @tipodocumento = Tipodocumento.new(params[:tipodocumento])

    respond_to do |format|
      if @tipodocumento.save
        format.html { redirect_to @tipodocumento, notice: 'Tipodocumento was successfully created.' }
        format.json { render json: @tipodocumento, status: :created, location: @tipodocumento }
      else
        format.html { render action: "new" }
        format.json { render json: @tipodocumento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipodocumentos/1
  # PUT /tipodocumentos/1.json
  def update
    @tipodocumento = Tipodocumento.find(params[:id])

    respond_to do |format|
      if @tipodocumento.update_attributes(params[:tipodocumento])
        format.html { redirect_to @tipodocumento, notice: 'Tipodocumento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipodocumento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipodocumentos/1
  # DELETE /tipodocumentos/1.json
  def destroy
    @tipodocumento = Tipodocumento.find(params[:id])
    @tipodocumento.destroy

    respond_to do |format|
      format.html { redirect_to tipodocumentos_url }
      format.json { head :no_content }
    end
  end
end
