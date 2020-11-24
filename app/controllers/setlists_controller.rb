class SetlistsController < ApplicationController
  before_action :authorized
  before_action :set_setlist, only: [:show, :update, :destroy]

  # GET /setlists
  def index
    @setlists = Setlist.where(user_id: @user.id)

    render json: @setlists
  end

  # GET /setlists/1
  def show
    render json: @setlist
  end

  # POST /setlists
  def create
    @setlist = Setlist.new(setlist_params)
    @setlist.user_id = @user.id

    if @setlist.save
      render json: @setlist, status: :created, location: @setlist
    else
      render json: @setlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /setlists/1
  def update
    if @setlist.update(setlist_params)
      render json: @setlist
    else
      render json: @setlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /setlists/1
  def destroy
    @setlist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setlist
      @setlist = Setlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def setlist_params
      params.require(:setlist).permit(:name, :user_id)
    end
end
