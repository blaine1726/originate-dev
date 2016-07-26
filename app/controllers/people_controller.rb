class PeopleController < ApplicationController
  def index
    @people = Person.all
    @quote = Quote.find_by route: 'people'
  end
end
