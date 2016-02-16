module ApplicationHelper

  def div_for(record, &block)
    content_tag(:div, class: record.class.model_name.plural, id: "#{record.class.model_name.param_key}_#{record.id}", &block)
  end

end
