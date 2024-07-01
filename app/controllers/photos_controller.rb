class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "/photo_templates/index" })
  end

  def show
    # # Parameters: {"path_username"=>"777"}

    url_photoid = params.fetch("path_photoid")
    matching_photos = Photo.where({ :id => url_photoid })
    @the_photo = matching_photos.at(0)

    render({ :template => "/photo_templates/show" })
  end

  def delete
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")
  end
end