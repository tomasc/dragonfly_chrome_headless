require 'test_helper'

module DragonflyChromeHeadless
  module Processors
    describe Rasterize do
      let(:app) { test_app.configure_with(:chrome_headless) }
      let(:processor) { DragonflyChromeHeadless::Processors::Rasterize.new }

      let(:html) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.html')) }
      let(:html_string) { Dragonfly::Content.new(app, '<html><head></head><body>foo</body></html>', name: 'html_string.html') }

      let(:options) { {} }

      describe 'html' do
        it 'returns PDF' do
          processor.call(html, :pdf, options)
          get_mime_type(html.path).must_include "application/pdf"
          assert is_pdf(html.data)
        end
      end

      describe 'string' do
        it 'returns PDF' do
          obj = '<html><head></head><body>foo</body></html>'
          def obj.original_filename; 'something.html'; end
          html_string.update(obj)
          processor.call(html_string, :pdf, options)
          get_mime_type(html_string.path).must_include "application/pdf"
          assert is_pdf(html_string.data)
        end
      end

      describe 'options' do
        describe 'completion trigger' do
          let(:options) { { completionTrigger: 'new htmlPdf.CompletionTrigger.Timer(5000);' } }

          it 'returns PDF' do
            processor.call(html, :pdf, options)
            get_mime_type(html.path).must_include "application/pdf"
            assert is_pdf(html.data)
          end
        end
      end

      # ---------------------------------------------------------------------

      def is_pdf data
        data =~ /\A%PDF-1.4/
      end

      def get_mime_type file_path
        `file --mime-type #{file_path}`.gsub(/\n/, "")
      end
    end
  end
end
