class PagesController < ApplicationController
  def index
  end
  def show
    @page = Page.where(name: params[:name]).first 
    raise ActionController::RoutingError.new('Not Found') if @page.nil?
  end
end
