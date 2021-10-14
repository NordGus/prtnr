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

  def toggle_visibility(force: false, klass: [])
    classes = Set.new

    klass.each { |k| classes.add k }

    classes.add 'is-hidden' unless force

    classes.join(' ')
  end
end
