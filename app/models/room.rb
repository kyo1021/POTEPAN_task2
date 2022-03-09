class Room < ApplicationRecord
    
    validates :name, presence: true
    validates :address, presence: true
    validates :price, presence: true, numericality: {only_integer: true,  greater_than_or_equal_to: 1, less_than_or_equal_to: 9999999}
    validates :introduction, length: { in: 10..30 }
    validates :image, presence: true
    
    mount_uploader :image, ImageUploader
    
    has_one :reservations, dependent: :destroy
    has_many :user, through: :reservations, dependent: :destroy
    
    accepts_nested_attributes_for :reservations

end
