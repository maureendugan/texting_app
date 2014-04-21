class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true, numericality: true
  validates :phone_number, :length => { :in => 10..10}

end
