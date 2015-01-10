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

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
