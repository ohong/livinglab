class RoomsController < ApplicationController

  # I don't like to repeat code :)
  before_action :set_room, only: [:show, :edit, :update]

  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def show
    @photos = @room.photos
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @rooms.save
      # create a photo entity for each image that a room has
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end
      @photos = @room.photos
      redirect_to edit_room_path(@room), notice: "Saved..."
    else
      render :new
    end
  end

  def edit
    # security feature: ensure that editor of home is the owner of that home
    if current_user.id = @room.user.id
      @photos = @room.photos
    else
      redirect_to root_path, notice: "You don't have permission to edit a home you don't own."
  end

  def update
    if @room.update(room_params)
      if params[:images]
        params[:images].each do |image|
          @room.photos.create(image: image)
        end
      end
      redirect_to edit_room_path(@room), notice: "Updated..."
    else
      render :edit
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end
    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate,
      :bedroom, :bathroom, :listing_name, :summary, :address, :has_wifi,
      :is_furnished, :has_ac, :has_washer_dryer, :rent, :active)
    end
end
