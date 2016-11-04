class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @profiles = Profile.all
  end

	def new
    if current_user.profile != nil
      flash[:notice] = 'You can not create another profile because you already have a profile'
      redirect_to profiles_path
    else
    	@profile = current_user.build_profile
      @categories = Category.all
    end
  end

  def show
   
  end

  def create
    @profile = current_user.build_profile(profile_params)
  	
    if @profile.save
      flash[:notice] = 'Profile was successfully created'
      redirect_to profile_path(@profile)
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    end
  end

  def destroy

  end

  private

  def set_profile
  	@profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :profile_pic, :category_ids => [])
  end
end
