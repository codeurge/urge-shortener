class Link < ActiveRecord::Base
  validates_uniqueness_of :given_url
  after_create :generate_slug

  def generate_slug
    self.slug = self.id.to_s(36)
    self.save
  end

  def display_slug
    "http://urge.to/#{self.slug}"
  end

  def screenshot_scrape
    ScreenshotWorker.perform_async(self.id)
    ScrapeWorker.perform_async(self.id)
  end
end
