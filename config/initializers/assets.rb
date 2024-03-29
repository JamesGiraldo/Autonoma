# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w[home.js]
Rails.application.config.assets.precompile += %w[home.scss]
Rails.application.config.assets.precompile += %w[cursos.css]
Rails.application.config.assets.precompile += %w[cursos.js]
Rails.application.config.assets.precompile += %w[lineas.css]
Rails.application.config.assets.precompile += %w[lineas.js]
Rails.application.config.assets.precompile += %w[proyecciones.css]
Rails.application.config.assets.precompile += %w[proyecciones.js]
Rails.application.config.assets.precompile += %w[comentarios.css]
Rails.application.config.assets.precompile += %w[comentarios.js]
Rails.application.config.assets.precompile += %w[facultades.css]
Rails.application.config.assets.precompile += %w[facultades.js]
Rails.application.config.assets.precompile += %w[programas.css]
Rails.application.config.assets.precompile += %w[programas.js]
Rails.application.config.assets.precompile += %w[cursos_usuarios.css]
Rails.application.config.assets.precompile += %w[cursos_usuarios.js]
Rails.application.config.assets.precompile += %w[users.css]
Rails.application.config.assets.precompile += %w[users.js]
Rails.application.config.assets.precompile += %w( devise/sessions.js )
# Rails.application.config.assets.precompile += %w( devise/sessions.css devise/sessions.js)
# Rails.application.config.assets.precompile += %w( devise/registrations.css)
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
