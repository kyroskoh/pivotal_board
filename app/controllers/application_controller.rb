class ApplicationController < ActionController::Base
  before_action :teams
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include PivotalApiHelper
  
  def teams
    @teams = ENV["TEAMS"].split(",")
  end

  protected
    def set_team(team)
      @teams.include?(team)?team:@teams[0]
    end
end
