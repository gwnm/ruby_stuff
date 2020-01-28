def colorise(text, color_code)

    "\e[#{color_code}m#{text}\e[0m"
  
  end
  
  def black(text); colorise(text, 40); end
  
  def red(text); colorise(text, 41); end
  
  def green(text); colorise(text, 42); end
  
  def yellow(text); colorise(text, 43); end
  
  def blue(text); colorise(text, 44); end
  
  def purple(text); colorise(text, 45); end
  
  def teal(text); colorise(text, 46); end
  
  def gray(text); colorise(text, 47); end
  
  
  module Colored
  
    extend self
  
  
  
    COLORS = { 
  
      'black'   => 30,
  
      'red'     => 31, 
  
      'green'   => 32, 
  
      'yellow'  => 33,
  
      'blue'    => 34,
  
      'magenta' => 35,
  
      'cyan'    => 36,
  
      'white'   => 37
  
    }
  
  
  
    EXTRAS = {
  
      'clear'     => 0, 
  
      'bold'      => 1,
  
      'underline' => 4,
  
      'reversed'  => 7
  
    }
  
    
  
    COLORS.each do |color, value|
  
      define_method(color) do 
  
        colorise(self, :foreground => color)
  
      end
  
  
  
      define_method("on_#{color}") do
  
        colorise(self, :background => color)
  
      end
  
  
  
      COLORS.each do |highlight, value|
  
        next if color == highlight
  
        define_method("#{color}_on_#{highlight}") do
  
          colorise(self, :foreground => color, :background => highlight)
  
        end
  
      end
  
    end
  
  
  
    EXTRAS.each do |extra, value|
  
      next if extra == 'clear'
  
      define_method(extra) do 
  
        colorise(self, :extra => extra)
  
      end
  
    end
  
  
  
    define_method(:to_eol) do
  
      tmp = sub(/^(\e\[[\[\e0-9;m]+m)/, "\\1\e[2K")
  
      if tmp == self
  
        return "\e[2K" << self
  
      end
  
      tmp
  
    end
  
  
  
    def colorise(string, options = {})
  
      colored = [color(options[:foreground]), color("on_#{options[:background]}"), extra(options[:extra])].compact * ''
  
      colored << string
  
      colored << extra(:clear)
  
    end
  
  
  
    def colors
  
      @@colors ||= COLORS.keys.sort
  
    end
  
  
  
    def extra(extra_name)
  
      extra_name = extra_name.to_s
  
      "\e[#{EXTRAS[extra_name]}m" if EXTRAS[extra_name]
  
    end
  
  
  
    def color(color_name)
  
      background = color_name.to_s =~ /on_/
  
      color_name = color_name.to_s.sub('on_', '')
  
      return unless color_name && COLORS[color_name]
  
      "\e[#{COLORS[color_name] + (background ? 10 : 0)}m" 
  
    end
  
  end unless Object.const_defined? :Colored
  
  
  
  String.send(:include, Colored)