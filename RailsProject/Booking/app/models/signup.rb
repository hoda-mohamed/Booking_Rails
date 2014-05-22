class Signup < ActiveRecord::Base
	validates :name, :presence => true
	validates :email, :presence => true
	validates :password, :presence => true
	validates :phone, :presence => true
end
