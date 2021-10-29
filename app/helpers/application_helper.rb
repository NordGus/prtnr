module ApplicationHelper
  def navigating?
    @navigating || false
  end

  def in_root?
    @in_root || false
  end

  def auxiliary?
    @auxiliary || false
  end

  def applet_data_controller
    @applet_controller || ''
  end

  def toggle_visibility(force: false, klass: [])
    classes = Set.new

    klass.each { |k| classes.add k }

    classes.add 'is-hidden' unless force

    classes.join(' ')
  end

  def active_nav_link(namespace)
    params[:controller].to_s.include? namespace.to_s
  end
end
