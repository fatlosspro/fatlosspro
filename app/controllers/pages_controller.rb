class PagesController < ApplicationController
  def show
    @page = Page.where(name: params[:name]).first
  end
end
