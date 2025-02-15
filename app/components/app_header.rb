class Components::AppHeader < Components::Base
  def initialize(class: nil)
    @class = binding.local_variable_get(:class)
    super()
  end

  def view_template
    header(
      class: [
        'flex justify-between items-end p-5 space-x-5 lg:flex-col lg:items-stretch lg:p-0 lg:space-y-36 lg:space-x-0',
        @class,
      ],
    ) do
      image_tag view_context.vite_asset_path('images/logo.svg'),
                class:
                  'p-3 w-20 h-20 bg-linear-to-br from-tertiary to-white rounded-sm lg:w-56 lg:h-56',
                alt: 'Logo',
                width: 150,
                height: 150

      render Components::Tabs.new do |t|
        t.tab text: 'Home', href: root_path
        t.tab text: 'About', href: about_path
      end
    end
  end
end
