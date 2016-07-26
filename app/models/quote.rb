class Quote < ActiveRecord::Base
  # Makes sure there is only one quote per route
  validates :route, uniqueness: true
end
