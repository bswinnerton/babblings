module Fetchable
  extend ActiveSupport::Concern
  class FetchError < StandardError; end

  TIMEOUT_THRESHOLD = 20

  included do
    class_attribute :destination, :source

    def self.fetches(destination, source)
      self.destination = destination
      self.source = source[:from]
    end

    before_save :save_destination
  end

  private

  def save_destination
    self.send("#{destination}=", fetch_destination)
  rescue FetchError
    self.errors.add(:base, "I had trouble grabbing that #{destination}.")
    false
  end

  def fetch_destination
    Timeout::timeout(TIMEOUT_THRESHOLD) { URI.parse(self.send(source)) }
  rescue OpenURI::HTTPError, Timeout::Error
    raise FetchError
  end
end
