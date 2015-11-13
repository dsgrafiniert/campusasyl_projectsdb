class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy, :invite, :participate]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:edit, :update, :destroy]
  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
    authorize City
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    authorize @city, :show?
    @projects = @city.projects.order('urgent DESC, title')
    @categories = Category.where(:category => nil)
  end

  # GET /cities/new
  def new
    @city = City.new
    authorize City
  end

  # GET /cities/1/edit
  def edit
    authorize City

  end

  def invite
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    authorize @city

    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def participate
       @participation = CityParticipation.where(:city => @city, :participant => current_user).first_or_create

         @participation.status=:approved
        respond_to do |format|
           if @participation.save
             format.html { redirect_to @city, notice: 'Successfully applied.' }
             format.json { render :show, status: :created, location: @city }
           else
             format.html { render :new }
             format.json { render json: @city.errors, status: :unprocessable_entity }
           end
         end

   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
      @city.generate_token unless @city.invitationHash
      @city
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:title, :user_ids => [])
    end
end
