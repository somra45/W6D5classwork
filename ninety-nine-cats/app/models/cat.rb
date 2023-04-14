# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    require 'date'
    require 'action_view'
    include ActionView::Helpers::DateHelper

    CAT_COLORS = ['orange', 'red', 'brown', 'tan']
    SEX = ['M', 'F']

    validates :birth_date, presence: true
    validates :color, presence: true
    validates :name, presence: true
    validates :sex, presence: true

    validate :inclusion_color
    validate :inclusion_sex 
    validate :birth_date_cannot_be_in_future

    def inclusion_color
        if !CAT_COLORS.include?(self.color)
            errors.add(:color, "must be within valid cat colors")
        end
    end

    def inclusion_sex
        if !SEX.include?(self.sex)
            errors.add(:sex, "must be either M or F representing Male or Female")
        end
    end

    def birth_date_cannot_be_in_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "cannot be in the future and must have been born by today")
        end
    end

    def age
        time_ago_in_words(birth_date)
    end
end
