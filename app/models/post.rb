class Post < ActiveRecord::Base
  FULL_WIDTH = 930
  THUMBNAIL_WIDTH = 300

  acts_as_paranoid

  def self.formats
    subclasses.map(&:name)
  end

  scope :ordered, -> { order created_at: :desc }

  validates :type, presence: true, inclusion: { in: ->(post) { formats } }
  validates :content, uniqueness: true

  # Gather all active scopes from descendant classes and create master query
  # http://pivotallabs.com/merging-scopes-with-sti-models/
  def self.active
    query = subclasses.map { |m| m.active.where_values.inject(:and) }.inject(:or)
    where(query)
  end
end
