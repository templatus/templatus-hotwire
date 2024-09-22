class ApplicationComponent < Phlex::HTML
  include Phlex::Rails::Helpers::Routes
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::ImageTag
  include Phlex::Rails::Helpers::ButtonTo

  if Rails.env.development?
    # :nocov:
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
    # :nocov:
  end
end
