class BusersController < ApplicationController
  before_action :set_buser, only: [:show, :edit, :update, :destroy]

  # GET /busers
  # GET /busers.json
  def index
    @busers = Buser.all
  end

  # GET /busers/1
  # GET /busers/1.json
  def show
  end

  # GET /busers/new
  def new
    @buser = Buser.new
  end

  # GET /busers/1/edit
  def edit
  end

  # POST /busers
  # POST /busers.json
  def create
    @buser = Buser.new
    @buser.name = params[:name]
    @buser.

    respond_to do |format|
      if @buser.save
        format.html { redirect_to @buser, notice: 'Buser was successfully created.' }
        format.json { render :show, status: :created, location: @buser }
      else
        format.html { render :new }
        format.json { render json: @buser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /busers/1
  # PATCH/PUT /busers/1.json
  def update
    respond_to do |format|
      if @buser.update(buser_params)
        format.html { redirect_to @buser, notice: 'Buser was successfully updated.' }
        format.json { render :show, status: :ok, location: @buser }
      else
        format.html { render :edit }
        format.json { render json: @buser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /busers/1
  # DELETE /busers/1.json
  def destroy
    @buser.destroy
    respond_to do |format|
      format.html { redirect_to busers_url, notice: 'Buser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buser
      @buser = Buser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buser_params
      params.require(:buser).permit(:name)
    end
end
