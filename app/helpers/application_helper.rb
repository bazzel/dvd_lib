# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Output modified to fit ParticleTree's buttons (http://particletree.com/features/rediscovering-the-button-element/).
  # Images replaced by SilkSprite (http://www.ajaxbestiary.com/Labs/SilkSprite/) (silkpsrite plugin required)
  def button_tag(value = "Submit", &block)
    tick = silksprite(:tick)
    button = content_tag(:button, "#{tick}#{value}", :class => 'button positive', :type => 'submit')

    if block_given?
      concat(button + capture(&block))
    else
      button
    end
  end
  
  
  # Creates a pre-formatted link tag using <tt>url</tt> as UL.
  #
  # >> cancel_link('www.kabisa.nl')
  # => <a class="button negative" href="/mail_templates">
  #      <span class="ss_sprite ss_cross"> </span> Cancel
  #    </a>
  def cancel_link(url, html_options = {})
    name = "#{silksprite(:cross)} Cancel"
    html_options[:class] = "button negative"
    link_to name, url, html_options
  end

end
