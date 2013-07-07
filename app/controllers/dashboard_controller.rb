class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    @current_weight = current_user.weights.last.present? ? current_user.weights.last.value : "Your last logged weight will appear here in"
  end

end
