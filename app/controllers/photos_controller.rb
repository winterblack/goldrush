class PhotosController < ApplicationController

	def show
    @photo = Photo.find(params[:id])
	end

  def new
    @photo = Photo.new(:site_id => params[:site_id])
    if @photo.save
      # Handle a successful save
    else
      render 'new'
    end
  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:success] = "New photo has been successfully submitted."
      redirect_to @photo.site
    else
      flash[:success] = "Didn't Work"
      render 'new'
    end
  end

  def destroy
    Photo.find(params[:id]).destroy
    flash[:success] = "Photo destroyed."
    redirect_to @photo.site
  end

  def edit
  end

  def index
    @photo = Photo.paginate(page: params[:page])
  end

  def update
    if @photo.update_attributes(params[:photo])
      flash[:success] = "Photo updated"
      redirect_to @photo
    else
      render 'edit'
    end
  end
end
