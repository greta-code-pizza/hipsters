class ThemesController < ApplicationController

  def change
    puts "themes is changed !"
    redirect_to "/settings"
  end
end
