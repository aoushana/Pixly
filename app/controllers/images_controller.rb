class ImagesController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json

  def index
    # @images = Image.limit(50).all
    # @images = Image.order("created_at DESC").all
    # @images = Image.joins( "JOIN votes AS v on v.votable_type = 'Image' and v.votable_id = images.id" ).group( "images.id" ).order( "count(images.id) desc" ).all
    # fetchs all of the images from the database. images is an array of image models
    # show 50 images instead of all.
    sortBy = params[:sortBy]

    if sortBy == "Popular"
      @images = Image.joins( "JOIN votes AS v on v.votable_type = 'Image' and v.votable_id = images.id" ).group( "images.id" ).order( "count(images.id) desc" ).all
    else
      @images = Image.limit(50)
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find(params[:id])
    @votes = @image.votes_for.all
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

    if @image.save
      puts "SUCCEEDED IMAGE UPLOAD"
      redirect_to @image, notice: 'Image was successfully created.'
    else
      puts "FAILED IMAGE UPLOAD"
      render :new
    end
  end

  # DELETE /images/1/delete
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to @image.user, notice: 'image was successfully destroyed.'
  end

  def like
    unless logged_in?
      redirect_to login_path
    else
      @image = Image.find(params[:id])
      if current_user.voted_up_on? @image
        @image.unvote_by current_user
      else
        @image.upvote_by current_user
      end
      redirect_to @image
   end
  end

  def dislike
    unless logged_in?
      redirect_to login_path
    else
      @image = Image.find(params[:id])
      if current_user.voted_down_on? @image
        @image.unvote_by current_user
      else
        @image.downvote_by current_user
      end
      redirect_to @image
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


  def options_for_sorted_by
    [
        ['Name (a-z)', 'name_asc'],
        ['Registration date (newest first)', 'created_at_desc'],
        ['Registration date (oldest first)', 'created_at_asc'],
        ['Users (a-z)', 'users_name_asc']
    ]
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    params.require(:image).permit(:file, :caption)
  end
end
