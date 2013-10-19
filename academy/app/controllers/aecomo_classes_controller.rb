class AecomoClassesController < ApplicationController
  # GET /aecomo_classes
  # GET /aecomo_classes.json
  def index
    @aecomo_classes = AecomoClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @aecomo_classes }
      format.xml { render xml: @aecomo_classes }
    end
  end

  # GET /aecomo_classes/1
  # GET /aecomo_classes/1.json
  def show
    @aecomo_class = AecomoClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aecomo_class }
    end
  end

  # GET /aecomo_classes/new
  # GET /aecomo_classes/new.json
  def new
    @aecomo_class = AecomoClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aecomo_class }
    end
  end

  # GET /aecomo_classes/1/edit
  def edit
    @aecomo_class = AecomoClass.find(params[:id])
  end

  # POST /aecomo_classes
  # POST /aecomo_classes.json
  def create
    @aecomo_class = AecomoClass.new(params[:aecomo_class])

    respond_to do |format|
      if @aecomo_class.save
        format.html { redirect_to @aecomo_class, notice: 'Aecomo class was successfully created.' }
        format.json { render json: @aecomo_class, status: :created, location: @aecomo_class }
      else
        format.html { render action: "new" }
        format.json { render json: @aecomo_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /aecomo_classes/1
  # PUT /aecomo_classes/1.json
  def update
    @aecomo_class = AecomoClass.find(params[:id])

    respond_to do |format|
      if @aecomo_class.update_attributes(params[:aecomo_class])
        format.html { redirect_to @aecomo_class, notice: 'Aecomo class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aecomo_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aecomo_classes/1
  # DELETE /aecomo_classes/1.json
  def destroy
    @aecomo_class = AecomoClass.find(params[:id])
    @aecomo_class.destroy

    respond_to do |format|
      format.html { redirect_to aecomo_classes_url }
      format.json { head :no_content }
    end
  end
end
