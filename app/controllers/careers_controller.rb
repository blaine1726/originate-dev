class CareersController < ApplicationController
  def index
    @quote = Quote.find_by route: 'careers'
  end
end
