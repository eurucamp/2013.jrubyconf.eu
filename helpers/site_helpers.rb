module SiteHelpers

  def ie_html(attrs={}, &block)
    attrs.keys.each do |key|
      attrs[(key.to_sym rescue key) || key] = attrs.delete(key)
    end
    haml_concat("<!--[if lt IE 7]>#{ tag(:html, add_class('ie6', attrs), true) }<![endif]-->")
    haml_concat("<!--[if IE 7]>#{ tag(:html, add_class('ie7', attrs), true) }<![endif]-->")
    haml_concat("<!--[if IE 8]>#{ tag(:html, add_class('ie8', attrs), true) }<![endif]-->")
    haml_concat("<!--[if gt IE 8]><!-->")
    haml_tag :html, attrs do
      haml_concat("<!--<![endif]-->")
      block.call
    end
  end

private

  def add_class(name, attrs)
    classes = attrs[:class] || ''
    classes.strip!
    classes = ' ' + classes if !classes.empty?
    classes = name + classes
    attrs.merge(:class => classes)
  end

  def tag_attributes(attrs={})
    attrs.map {|k, v| "#{k}=\"#{v}\"" }.join(' ')
  end

  def tag(name, attrs=nil, open=false)
    "<#{name}#{" #{tag_attributes(attrs)}" if attrs}#{open ? ">" : " />"}"
  end
end