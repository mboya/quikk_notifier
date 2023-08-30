# == Schema Information
#
# Table name: messages
#
#  id                :uuid             not null, primary key
#  contact           :string
#  mode              :string
#  message           :string
#  retries           :integer          default(0)
#  provider_feedback :string
#  active            :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
