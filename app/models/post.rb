class Post < ActiveRecord::Base
  FULL_WIDTH = 930
  THUMBNAIL_WIDTH = 300

  acts_as_paranoid

  def self.formats
    subclasses.map(&:name)
  end

  default_scope -> { order created_at: :desc }

  validates_presence_of :type
  #TODO validates_inclusion_of :type, in: formats
end
