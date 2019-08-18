# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 2, maximum: 50 }
end
