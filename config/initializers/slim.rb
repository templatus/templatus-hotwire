if Rails.env.development?
  # Indent html for pretty debugging and do not sort attributes
  Slim::Engine.set_options pretty: true, sort_attrs: false
end
