class Admin::Accommodations::RoomsController < AdminController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = RoomDecorator.decorate_collection(
        Room.includes(:room_class).page(params[:page])
    )
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to [:admin, :accommodations, @room], notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to [:admin, :accommodations, @room], notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to admin_accommodations_rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(
          :name,
          :room_number,
          :room_class_id,
          :description,
          :sales_description,
          :area,
          :price,
          :qty,
          :checkin_time,
          :checkout_time,
          :how_many_ppl
      )
    end
end
