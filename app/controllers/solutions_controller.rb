class SolutionsController < ApplicationController
  def index
    @quote = Quote.find_by route: 'solutions'
  end
end
