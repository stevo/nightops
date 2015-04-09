class DecoratorStrategy < DecentExposure::StrongParametersStrategy

  def resource
    r = super.tap { |r| r.class.send(:include, Draper::Decoratable) unless r.respond_to?(:decorate) }
    r.decorate
  end
end