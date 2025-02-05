class TabsComponent < ApplicationComponent
  include Phlex::Rails::Helpers::CurrentPage

  def view_template(&)
    nav(
      class:
        'flex space-x-5 text-lg font-medium text-center uppercase lg:flex-col lg:space-y-5 lg:space-x-0',
      &
    )
  end

  def tab(text:, href:)
    link_to text,
            href,
            class: [
              'rounded-md px-2 py-1 transition lg:shadow-sm',
              (
                if current_page?(href)
                  'bg-white text-primary lg:bg-primary lg:text-white'
                else
                  'bg-transparent text-white hover:scale-105 lg:bg-white lg:text-primary'
                end
              ),
            ],
            data: {
              turbo_action: 'replace',
            }
  end
end
