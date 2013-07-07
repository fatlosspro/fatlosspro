class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    @current_weight = current_user.weights.last || "Your last logged weight will appear here"
  end

end
