class HomeController < ApplicationController
  def index
    @pages = {}
    @pages[:page] = (params[:page] || 1).to_i
    @pages[:last_page] = Event.all.count / 10
    offset = (@pages[:page] - 1) * 10
    @events = Event.order(created_at: :desc).limit(10).offset(offset).all
  end
end
