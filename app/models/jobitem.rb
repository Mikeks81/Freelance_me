class Jobitem < ActiveRecord::Base
  belongs_to :job
  validates_presence_of :name
  validates_presence_of :price
end
