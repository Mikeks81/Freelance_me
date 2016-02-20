class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :job
end
