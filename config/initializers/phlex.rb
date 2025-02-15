module Views
end

module Components
  extend Phlex::Kit
end

Rails.autoloaders.main.push_dir(
  Rails.root.join('app', 'views').to_s,
  namespace: Views,
)

Rails.autoloaders.main.push_dir(
  Rails.root.join('app', 'components').to_s,
  namespace: Components,
)
