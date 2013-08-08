module SiteHelpers

  # Render section
  #
  # Wraps content in required tags and adds anchor link to #top.
  # Data is scoped to section.
  # Usage:
  #   = render_section :foo, :class => 'bar'
  #   = render_section :bat do |data|
  #     %h1= data.title
  def render_section(name, attrs = {}, &block)
    section_data = data.send(name.to_sym)

    capture_haml do
      haml_tag :section, attrs.merge(:id => name) do
        haml_tag :div, :class => 'wrapper' do
          haml_tag :a, 'Back to top', { :class => 'top', :href => '#top' }
          if block_given?
            haml_concat yield(section_data)
          else
            haml_concat partial("partials/#{name}", :locals => { :data => section_data })
          end
        end
      end
    end
  end

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

  def markdown(content, fallback = '')
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    renderer.render(content || fallback)
  end

  def speaker_name(twitter)
    data.speakers.speakers.find {|speaker| speaker.twitter == twitter }.name
  end

private

  def add_class(name, attrs)
    classes = attrs[:class] || ''
    classes.strip!
    classes = ' ' + classes if !classes.empty?
    classes = name + classes
    attrs.merge(:class => classes)
  end

end
