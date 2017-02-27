class Case < ApplicationRecord
  belongs_to :personnel
  has_many :documents
  validates :c2_id, presence: true
  validates :c1_id, presence: true
  validate :personnel_defend_opponent_before, on: [:create, :update]

  def personnel_defend_opponent_before
  	prev_cases = Case.where(personnel_id: personnel_id);
  	if prev_cases.present?
      prev_cases.each do |pc|
      	if pc.c1_id == c2_id
		  		errors.add(:base, "#{Personnel.find(personnel_id).name} can't be assigned due to previous presence of defending #{Company.find(c2_id).name} in Case #{pc.case_id}")
		  	end
		  end
  	end
  end
end
