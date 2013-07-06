class Weight < ActiveRecord::Base
  belongs_to :user

  has_attached_file :photo, :styles => { large: "500x500>", thumb: "250x250>" }, :default_url => "http://placehold.it/250x250"

  validates :value, :inclusion => 55..441
  validate :validate_record
  before_create :round_weight

  def validate_record
    errors[:base] << "You must either upload a photo or enter a weight record" if self.value.blank? && self.photo.blank?
  end

  def round_weight
    self.value = self.value.round(1)
  end
end
