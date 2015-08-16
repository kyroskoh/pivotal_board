class AdminController < ApplicationController
  include PivotalApiHelper
  def index
    # @color = color
    @people = Person.all
  end
  
  def update_colors
    @color = color
    @color.update(color_params)
    redirect_to action: :index
  end
  
  def reload
    people
    render json: Person.all
  end
  
  private
    def color_params
      params.require(:color).permit(:unstarted, :started, :finished, 
                                    :delivered, :impeded, :accepted,
                                    :feature, :chore, :bug, :retro)
    end
end