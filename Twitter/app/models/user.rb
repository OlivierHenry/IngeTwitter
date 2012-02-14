class User < ActiveRecord::Base
	has_many :microposts
	attr_accessible :nom, :email
	validates :nom, :presence => true,
					:length => { :maximum => 50 }
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, :presence => true,
					  :format => { :with => email_regex },
					  :uniqueness => { :case_sensitive => false }
end
