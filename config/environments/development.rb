Rails.application.configure do

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  # config.active_record.raise_in_transactional_callbacks = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
        'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.smtp_settings = {
      :address => "smtp.gmail.com",
      :port => 587,
      :user_name => "hirosige1@gmail.com",
      :password => "abCD1234",
      :authentication => :plain,
      :enable_starttls_auto => true
  }

  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load

  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true

  config.assets.debug = true
  # config.action_view.raise_on_missing_translations = true
  config.consider_all_requests_local = true

  config.action_mailer.default_url_options = { host: '192.168.33.20', port: 3000 }
  BetterErrors::Middleware.allow_ip! "0.0.0.0/0"

  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.after_initialize do
    Bullet.enable  = true
    Bullet.alert   = true
    Bullet.bullet_logger = false
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.add_footer   = true
  end
end
