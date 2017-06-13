require 'dragonfly_chrome_headless/processors/rasterize'

module DragonflyChromeHeadless
  class Plugin
    def call(app, options={})
      app.env[:node_command] = options[:node_command] || 'node'

      app.add_processor :rasterize, DragonflyChromeHeadless::Processors::Rasterize.new
    end
  end
end

Dragonfly::App.register_plugin(:chrome_headless) do
  DragonflyChromeHeadless::Plugin.new
end
