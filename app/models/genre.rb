class Genre < ActiveRecord::Base
	has_many :users
end
