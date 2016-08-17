class ResourcesController < ApplicationController
  def index
    @quote = Quote.find_by route: 'resources'
    @resources = Resource.all
  end
  def show
    @resource = Resource.find_by id: params[:id]
  end
  def resource
  end
end
