class HomeController < ApplicationController
  def index
    @pages = {}
    @pages[:page] = (params[:page] || 1).to_i
    @pages[:last_page] = Event.all.count / 20
    offset = (@pages[:page] - 1) * 20
    @events = Event.order(created_at: :desc).limit(20).offset(offset).all
  end
end
