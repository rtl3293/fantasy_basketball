class WelcomeController < ApplicationController

  def welcome
    # binding.pry
    render 'index.html.erb'
  end

end
