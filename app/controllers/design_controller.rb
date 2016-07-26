class DesignController < ApplicationController
  def index
    @quote = Quote.find_by route: 'design'
  end
end
