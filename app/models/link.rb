class Link < ActiveRecord::Base
  after_create :generate_slug

  def generate_slug
    binding.pry
    self.slug = self.id.to_s(36)
    self.save
  end

  def display_slug
    "http://localhost:3000/#{self.slug}"
  end

  def screenshot_scrape
    ScreenshotWorker.perform_async(self.id)
    ScrapeWorker.perform_async(self.id)
  end

end
