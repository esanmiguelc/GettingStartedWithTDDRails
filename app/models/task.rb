class Task < ActiveRecord::Base
  UNDONE = 'undone'

  validates_presence_of :description
  enum status: [UNDONE]
end
