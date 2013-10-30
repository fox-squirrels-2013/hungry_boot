class Restaurant < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :cuisine
end