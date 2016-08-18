class SitesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit]
  #before_filter :admin_user, only: [:new, :edit]

  def show
  	@site = Site.find(params[:id])
    #@photos = @site.photos.paginate(page: params[:page])
  end

  def new
    @site = Site.new
    if @site.save
      # Handle a successful save
    else
      render 'new'
    end
  end

  def create
    @site = Site.new(params[:site])
    if @site.save
      @site.submitted_by = current_user.id
      @site.edited_by = current_user.id
      @site.save
      flash[:success] = "New Site has been successfully submitted."
      redirect_to @site
    else
      render 'new'
    end
  end

  def destroy
    Site.find(params[:id]).destroy
    flash[:success] = "Site destroyed."
    redirect_to sites_url
  end

  def edit
    @site = Site.find(params[:id])
  end

  def index
    @sites = Site.paginate(page: params[:page])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(params[:site])
      @site.edited_by = current_user.id
      flash[:success] = "Site updated"
      redirect_to @site
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      #redirect_to(root_path) unless current_user?(@user)
    end

end
