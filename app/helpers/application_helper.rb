# frozen_string_literal: true

module ApplicationHelper # rubocop:todo Style/Documentation
  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  # rubocop:todo Naming/PredicateName
  def is_active_controller(controller_name, class_name = nil)
    # rubocop:todo Style/GuardClause
    if params[:controller] == controller_name
      class_name.nil? ? 'active' : class_name
    end
    # rubocop:enable Style/GuardClause
  end
  # rubocop:enable Naming/PredicateName

  def is_active_action(action_name) # rubocop:todo Naming/PredicateName
    params[:action] == action_name ? 'active' : nil
  end

  def asset_exists?(subdirectory, filename)
    File.exist?(File.join(Rails.root, 'app', 'assets', subdirectory, filename))
  end

  def image_exists?(image)
    asset_exists?('images', image)
  end

  def javascript_exists?(script)
    extensions = %w[.coffee .erb .coffee.erb] + ['']
    extensions.inject(false) do |truth, extension|
      truth || asset_exists?('javascripts', "#{script}.js#{extension}")
    end
  end

  def stylesheet_exists?(stylesheet)
    extensions = %w[.scss .erb .scss.erb] + ['']
    extensions.inject(false) do |truth, extension|
      truth || asset_exists?('stylesheets', "#{stylesheet}.css#{extension}")
    end
  end
end
