class ToppagesController < ApplicationController
  def index
    @places = Place.order(created_at: :desc)
    @place = Place.new
    @title = params[:q].present? ? params[:q] : (@places.first&.title || "新宿区")
    add_latitude_longitude(@title)
  end
end