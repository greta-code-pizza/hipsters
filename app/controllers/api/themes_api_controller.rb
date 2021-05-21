class Api::ThemesApiController < ApplicationController
  def find_themes
    begin
      user = User.find_by(id: params[:id])
      themes = Theme.find_by(id: user.theme_id).name
      response = true
    rescue StandardError => e
      puts e
      themes = ""
      response = false
    end

    render json: { "response" => response, "data" => themes }
  end
end
