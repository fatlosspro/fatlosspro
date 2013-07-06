class WeightsController < ApplicationController
  before_action :set_weight, only: [:update, :destroy]
  before_filter :authenticate_user!

  def index
    @weight = Weight.new
    @weights = current_user.weights.reverse
  end

  def create
    @weight = Weight.new(weight_params)
    @weight.user_id = current_user.id
    if @weight.save
      flash[:notice] = 'Weight record added'
      redirect_to :weight_tracker
    else
      flash[:error] = @weight.errors.full_messages.join("<br/>").html_safe
      redirect_to :back
    end
  end

  def update
  end

  def destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_weight
      @weight = Weight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weight_params
      params.require(:weight).permit(:value, :photo, :user_id)
    end
end
