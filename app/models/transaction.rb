# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  sender_id  :integer
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transaction < ActiveRecord::Base
	validates :user_id, :sender_id, :amount, presence: true
	belongs_to :user
end
