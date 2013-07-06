class PagesController < ApplicationController
  def index
  end
  def show
    @page = Page.where(name: params[:name]).first
  end
end
