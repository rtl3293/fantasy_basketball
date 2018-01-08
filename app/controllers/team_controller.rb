class TeamController < ApplicationController

  def index
    if current_user
      @teams = Team.all
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end

end
