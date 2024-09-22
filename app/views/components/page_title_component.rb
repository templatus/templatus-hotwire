class PageTitleComponent < ApplicationComponent
  def initialize(title)
    super()
    @title = title
  end

  def view_template
    h1(
      class:
        'text-4xl font-extrabold tracking-tight break-words text-primary sm:text-5xl lg:text-6xl',
    ) { @title }

    p(class: 'max-w-4xl mt-6 text-base lg:text-xl') do
      plain 'Templatus is an opinionated template for web applications with'
      whitespace
      b { 'Ruby on Rails' }
      whitespace
      plain 'and'
      whitespace
      b { 'Hotwire' }
    end
  end
end
