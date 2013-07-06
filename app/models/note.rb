class Note < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :body
  self.per_page = 5
end
