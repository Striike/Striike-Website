# == Schema Information
#
# Table name: estimations
#
#  id         :integer          not null, primary key
#  title      :string
#  price      :string
#  time       :string
#  def        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EstimationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
