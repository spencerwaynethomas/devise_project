class AthletesController < ApplicationController

  before_action :set_athlete, only: [:show, :edit, :update]

  def index
    @athletes = current_user.athletes
  end

  def show
  end

  def new
    @athlete = Athlete.new
    
  end

    def create
      @athlete = current_user.athletes.new(athlete_params)
      if @athlete.save
        redirect_to athletes_path
      else
        render :new
      end
    end

    def edit
    end
  

  def update
    if @athlete.update(athlete_params)
      redirect_to athletes_path
    else
      render :edit
    end
  end

  def destroy
    @athlete.destroy
    redirect_to athletes_path
  end

  private

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :sport)
  end

  def set_athlete
    @athlete = current_user.athletes.find(params[:id])
  end

end
