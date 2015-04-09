class MissionDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def field(attr)
    value = case attr
              when :invited
                if teams.present?
                  teams.map { |team| team.name }.join(', ')
                end
              when :start_at
                public_send(attr).strftime('%d/%m/%Y')
              when :primary_objective
                if value.present?
                markdown public_send(attr)
                  end
              else
                public_send(attr)
            end
    if value.present?
      content_tag(:div, (content_tag(:p, "#{content_tag(:b, I18n.t(attr, scope: 'mission'))}: #{value}".html_safe)))
    end
  end
end
