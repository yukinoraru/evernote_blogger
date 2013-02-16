class ResourceController < ApplicationController
  def show
    @resource = Resource.find_by_body_hash(params[:id])
    type, disposition = nil, nil
    case @resource.mime
    when "png"
      type = 'image/png'
      disposition = 'inline'
    when "jpg"
      type = 'image/jpg'
      disposition = 'inline'
    end
    send_data @resource.body, :type => type, :disposition => disposition
  end
end
