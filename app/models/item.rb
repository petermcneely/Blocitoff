class Item < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: { message: "can't be blank" }
end
