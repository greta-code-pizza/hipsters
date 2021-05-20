unless Rails.env.production?
  Rack::MiniProfiler.config.disable_caching = false
end
