class CastsController < ApplicationController
    
  def cast_index
    @casts = Cast.all
  end

  def cast_new
    @cast = Cast.new
  end

  def cast_show
    @cast = Cast.find(params[:id])
  end

  def cast_create
    
    require 'carrierwave/orm/activerecord'
    
    @makeCast = Cast.new
    @makeCast.castTitle = params[:castTitle]
    @makeCast.castContent = params[:castContent]
    @makeCast.casts = params[:file]
    # @makeCast.user = current_user
    
    u = UpcastUploader.new
    u.store!(params[:castImage])
    @makeCast.cast_image_url = u
    # @makeCast.upcast_identifier
    @makeCast.save

    # uploader.retrieve_from_store!('my_file.png')
    
    
    redirect_to '/casts' #method는 자동으로 get
    
  end

  def cast_edit
    @cast = Cast.find(params[:id])
  end

  def cast_update
    # @cast = Cast.find(params[:id])
    # @cast.update_attributes(castTitle: params[:castTitle], castContent: params[:castContent])
    # redirect_to '/casts'
    
    make_cast = Cast.find(params[:id])
    make_cast.castTitle = params[:castTitle]
    make_cast.castContent = params[:castContent]
    make_Cast.casts = params[:file]
    # @makeCast.user = current_user
    
    a = UpcastUploader.new
    a.store!(params[:castImage])
    @makeCast.cast_image_url = a
    # @makeCast.upcast_identifier
    @makeCast.save
    redirect_to '/casts'
    
    
    # Form_for 전용
    #  @post.update_attributes(title: params[:post][:title], content: params[:content])
  end

  def cast_destroy
    @cast = Cast.find(params[:id])
    @cast.destroy
    redirect_to '/casts'
  end
end