module ApplicationHelper

  def bip(object, field, options={})
    random = Random.rand(999999999999)
    cls = bip_class(object, field)
    options[:id] = "#{cls}_#{random}"
    options[:class] = cls
    best_in_place object, field, options
  end

  def bip_class(object, field)
    "bestinplace_#{object.class}_#{object.id}_#{field}".downcase
  end

  def bip_span(object, field)
    content_tag(:span, object[field], class: bip_class(object, field))
  end

end
