require "dragonfly"
require "dragonfly_chrome_headless/plugin"
require "dragonfly_chrome_headless/version"

module DragonflyChromeHeadless
  def self.root
    File.expand_path '../..', __FILE__
  end
end
