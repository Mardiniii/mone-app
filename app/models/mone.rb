# == Schema Information
#
# Table name: mones
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mone < ActiveRecord::Base
  belongs_to :user
end
