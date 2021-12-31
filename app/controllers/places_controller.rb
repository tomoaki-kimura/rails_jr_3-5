class PlacesController < ApplicationController
  def show
    @place = Place.find(params[:id])
    add_latitude_longitude(@place.title)
  end
  
  def create
    @title = params[:title]
    add_latitude_longitude(@title)
    @place = Place.new(place_params)
    @place.title = @title
    @place.latitude = @latitude
    @place.longitude = @longitude
    
    if @place.save
      flash[:success] = '地図データーが投稿されました'
      redirect_to root_url
    else
      @places = Place.order(created_at: :desc)
      flash.now[:danger] = '地図データーの投稿が失敗しました'
      render 'toppages/index'
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    flash[:success] = '地図データーを削除しました'
    redirect_to root_url
  end
  
  private
  
  def place_params
    params.require(:place).permit(:memo, :title)
  end
end
