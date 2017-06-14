# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :text             not null
#  long_url   :text             not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#
require 'set'
class ShortenedUrl < ActiveRecord::Base
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true

  include SecureRandom
  def self.random_code
    temp = SecureRandom.urlsafe_base64
    while self.exists?(:short_url => temp)
      temp = SecureRandom.urlsafe_base64
    end
    temp
  end

  def self.create_shortened_url(user, long_url)
    self.create!(:short_url => self.random_code, :long_url => long_url, :user_id => user.id)
  end

  def num_clicks
    visits.length
  end

  def num_uniques
    visits.select { |v| v.user_id if v.short_url_id == @id }


    # Set.new(visitors).length
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :user
end
