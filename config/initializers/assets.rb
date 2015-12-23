# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( restaurant.css )
Rails.application.config.assets.precompile += %w( restaurant.js )
Rails.application.config.assets.precompile += %w( kitchen.css )
Rails.application.config.assets.precompile += %w( kitchen.js )
Rails.application.config.assets.precompile += %w( host.css )
Rails.application.config.assets.precompile += %w( host.js )
Rails.application.config.assets.precompile += %w( server.css )
Rails.application.config.assets.precompile += %w( server.js )
Rails.application.config.assets.precompile += %w( users.js )
