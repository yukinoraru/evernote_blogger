class ResourceController < ApplicationController
  layout "application", :except => [:get_elem]

  def show
    @resource = Resource.find_by_body_hash(params[:hash])
    disposition = 'attachment'
    type = @resource.mime
    case @resource.mime
    when "image/png", "image/jpg", "image/jpeg"
      disposition = 'inline'
    end

    send_data @resource.body, :type => type, :disposition => disposition,
      :filename => @resource.filename
  end

  def get_elem
    @resource = Resource.find_by_body_hash(params[:hash])
    render :action => :get_elem, :layout => false
  end
end
