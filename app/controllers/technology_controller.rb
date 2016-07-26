class TechnologyController < ApplicationController
  def index
    @quote = Quote.find_by route: 'technology'
  end
end
