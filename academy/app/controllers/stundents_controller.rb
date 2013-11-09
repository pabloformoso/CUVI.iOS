class StundentsController < ApplicationController
  # GET /stundents
  # GET /stundents.json
  def index
    @stundents = Stundent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stundents, methods: :image_url }
      format.xml { render xml: @stundents, methods: :image_url }
    end
  end

  # GET /stundents/1
  # GET /stundents/1.json
  def show
    @stundent = Stundent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stundent }
    end
  end

  # GET /stundents/new
  # GET /stundents/new.json
  def new
    @stundent = Stundent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stundent }
    end
  end

  # GET /stundents/1/edit
  def edit
    @stundent = Stundent.find(params[:id])
  end

  # POST /stundents
  # POST /stundents.json
  def create
    @stundent = Stundent.new(params[:stundent])

    respond_to do |format|
      if @stundent.save
        format.html { redirect_to @stundent, notice: 'Stundent was successfully created.' }
        format.json { render json: @stundent, status: :created, location: @stundent }
      else
        format.html { render action: "new" }
        format.json { render json: @stundent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stundents/1
  # PUT /stundents/1.json
  def update
    @stundent = Stundent.find(params[:id])

    respond_to do |format|
      if @stundent.update_attributes(params[:stundent])
        format.html { redirect_to @stundent, notice: 'Stundent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stundent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stundents/1
  # DELETE /stundents/1.json
  def destroy
    @stundent = Stundent.find(params[:id])
    @stundent.destroy

    respond_to do |format|
      format.html { redirect_to stundents_url }
      format.json { head :no_content }
    end
  end
end
