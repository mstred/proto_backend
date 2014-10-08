class TechniciansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_technician, only: [:show, :edit, :update, :destroy, :technician_location, :technician_ratings]

  # GET /technicians
  # GET /technicians.json
  def index
    @technicians = Technician.all
  end

  # GET /technicians/1
  # GET /technicians/1.json
  def show
    @ratings = @technician.ratings
  end

  # GET /technicians/new
  def new
    @technician = Technician.new
  end

  # GET /technicians/1/edit
  def edit
  end

  # POST /technicians
  # POST /technicians.json
  def create
    @technician = Technician.new(technician_params)
     #If location params is not passed
     # creates a new entry with null lat and long
     if @technician.location == nil
       @technician.build_location
     end

    respond_to do |format|
      if @technician.save
        format.html { redirect_to @technician, notice: 'Technician was successfully created.' }
        format.json { render :show, status: :created, location: @technician }
      else
        format.html { render :new }
        format.json { render json: @technician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /technicians/1
  # PATCH/PUT /technicians/1.json
  def update
    respond_to do |format|
      if @technician.update(technician_params)
        format.html { redirect_to @technician, notice: 'Technician was successfully updated.' }
        format.json { render :show, status: :ok, location: @technician }
      else
        format.html { render :edit }
        format.json { render json: @technician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /technicians/1
  # DELETE /technicians/1.json
  def destroy
    @technician.destroy
    respond_to do |format|
      format.html { redirect_to technicians_url, notice: 'Technician was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #GET /technicians/1/location
  #GET /technicians/1/location.json
  def technician_location
    respond_to do |format|
      if @technician.location != nil
        format.html {redirect_to @technician.location}
        format.json { render json: @technician.location.to_json(only: [:lat , :long] ) , status: :ok, location: @technician }
      else
        format.html { redirect_to technicians_url, notice: 'Couldn\'t retrieve technician\'s location.' }
        format.json { render json: @technician.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technician
      @technician = Technician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def technician_params
      params.require(:technician).permit(:name, :email, :password, :gcm_id, location_attributes: [:lat , :long])
    end
end
