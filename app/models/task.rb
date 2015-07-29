class Task < ActiveRecord::Base
  enum status: [:undone, :done]
  validates_presence_of :description
end
