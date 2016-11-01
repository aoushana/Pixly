class ImagesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.limit(50).all
  #   fetchs all of the images from the database. images is an array of image models
  #   show 50 images instead of all.

  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])
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
    @image = Image.new(image_params)
    @image.user = current_user

    if @image.save!
      puts "SUCCEEDED IMAGE UPLOAD"
      redirect_to @image, notice: 'Image was successfully created.'
    else
      puts "FAILED IMAGE UPLOAD"
      render :new
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

  def set_user
    @user = current_user
  end
  # instance variable

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:file)
  end
end
