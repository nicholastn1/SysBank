# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

# app/assets
Rails.application.config.assets.precompile += %w( users.js users.css
                                                  user_devise.js user_devise.css)

# lib/assets
Rails.application.config.assets.precompile += %w( ie10-viewport-bug-workaround.css dashboard.css
                                                  ie-emulation-modes-warning.js holder.min.js
                                                  ie10-viewport-bug-workaround.js signin.css)
