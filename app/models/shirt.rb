class Shirt < ActiveRecord::Base
  validates_presence_of :name, :length, :chest, :sleeve
  belongs_to :user

end
