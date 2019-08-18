# == Schema Information
#
# Table name: chores
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  card_id     :bigint
#
# Indexes
#
#  index_chores_on_card_id  (card_id)
#
# Foreign Keys
#
#  fk_rails_...  (card_id => cards.id)
#

class Chore < ApplicationRecord
  belongs_to :card

  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, length: { maximum: 500 }, allow_blank: true
end
