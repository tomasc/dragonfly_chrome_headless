require 'test_helper'

module DragonflyChromeHeadless
  describe Plugin do

    let(:app) { test_app.configure_with(:chrome_headless) }
    let(:html) { app.fetch_file(SAMPLES_DIR.join('sample.html')) }

    describe 'processors' do
      it 'adds #rasterize' do
        html.must_respond_to :rasterize
      end
    end
  end
end
