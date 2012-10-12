app = Bookmate::Application
app_images = Dragonfly[:images]
app_images.configure_with(:imagemagick)
app_images.configure_with(:rails) do |c|
  c.datastore.root_path = Rails.root.join('public', 'system', 'images').to_s
  c.url_format = '/system/images/:job/:basename.:format'
  c.secret = Array.new(24) { rand(256) }.pack('C*').unpack('H*').first
end

app_images.define_macro(ActiveRecord::Base, :image_accessor)
app_images.analyser.register(Dragonfly::ImageMagick::Analyser)
app_images.analyser.register(Dragonfly::Analysis::FileCommandAnalyser)


app.config.middleware.insert_after 'Rack::Lock', 'Dragonfly::Middleware', :images

app.config.middleware.insert_before 'Dragonfly::Middleware', 'Rack::Cache', {
  :verbose     => Rails.env.development?,
  :metastore   => "file:#{Rails.root.join('tmp', 'dragonfly', 'cache', 'meta')}",
  :entitystore => "file:#{Rails.root.join('tmp', 'dragonfly', 'cache', 'body')}"
}