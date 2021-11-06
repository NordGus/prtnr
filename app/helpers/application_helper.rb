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

  def date_as_id(date)
    date.strftime('%Y_%m_%d')
  end

  def date_as_calendar_id(date)
    date.strftime('%Y_%m')
  end

  def date_as_menu_title(date)
    date.strftime('%B %-d %Y')
  end

  def date_weekday(date)
    date.strftime('%A')
  end
end
