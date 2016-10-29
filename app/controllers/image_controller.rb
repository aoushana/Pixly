class ImagesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all

  end

  # GET /images/1
  # GET /images/1.json
  def show

  end

  # GET /images/new
  def new
    @image = Image.new
  #   show the template
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(user_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(user_params)
        format.html { redirect_to @image, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end
  # instance variable

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:user_name, :email, :password)
  end
end
