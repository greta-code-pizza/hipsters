class DashboardController < ApplicationController
 def index
    @users_count = User.all.count
 end
end