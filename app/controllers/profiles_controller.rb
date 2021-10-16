class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @profiles = Profile.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @profile = Profile.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @profile = Profile.new(profile_params)

      if @profile.save
        redirect_to profiles_path
      else
        render json: @profile.errors, status: :unprocessable_entity
      end
  end

  # # PATCH/PUT /users/1
  # # PATCH/PUT /users/1.json
  # def update
  #     if @profile.update(profile_params)

  #       redirect_to @profile_path
  #     else
  #       render json: @profile.errors, status: :unprocessable_entity 
  #     end
  # end

  # # DELETE /users/1
  # # DELETE /users/1.json
  # def destroy
  #   @profile.destroy
  #   respond_to do |format|
  #     format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:admin, :email)
    end
end
