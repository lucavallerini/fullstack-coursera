class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: { in: %w(male female) }

  validate :both_name_not_nil, :male_not_sue

  def both_name_not_nil
    if first_name.nil? && last_name.nil?
      errors.add(:first_name, "Either first name and last name must not be null.")
      errors.add(:last_name, "Either first name and last name must not be null.")
    end
  end

  def male_not_sue
    if gender == 'male' && first_name == 'Sue'
      errors.add(:first_name, "A male cannot have Sue as first name.")
    end
  end

  scope :get_all_profiles, ->(min_year, max_year) { where("birth_year BETWEEN ? AND ?", min_year, max_year).order(:birth_year) }

end
