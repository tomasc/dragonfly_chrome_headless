require 'json'

module DragonflyChromeHeadless
  module Processors
    class Rasterize
      class UnsupportedFormat < RuntimeError; end

      def call(content, format=:pdf, options={})
        raise UnsupportedFormat unless %w(pdf).include?(format.to_s)

        node_command = content.env.fetch(:node_command, 'node')
        options[:host] ||= content.env[:host]
        options[:port] ||= content.env[:port]

        content.shell_update(ext: format) do |old_path, new_path|
          "#{node_command} #{rasterize_script} #{old_path} #{new_path} '#{options.to_json}'"
        end
      end

      def update_url(attrs, format, args='')
        attrs.ext = format.to_s
      end

      private

      def rasterize_script
        File.join(DragonflyChromeHeadless.root, "script", "rasterize.js")
      end
    end
  end
end
