require "symbol_to_fontawesome/version"

module SymbolToFontawesome
  class ::Symbol
    def fa(*args, &block)
      Builder.call(*([self.to_s.gsub('_', '-')] + args), &block).build!
    end
  end

  class Builder
    class << self
      def call(*args, &block)
        new(*args, &block)
      end
    end

    def initialize(*args, &block)
      if block_given?
        args.shift
        @classes = ['fa-stack'] + args.map(&method(:analyze))
        @stacker = []
        instance_eval(&block)
      else
        @stacked = true if !!args.delete(:stacking)
        @classes = ['fa-' + args.shift] + args.map(&method(:analyze))
      end
    end

    def analyze(param)
      raise 'not number' if (i = param.to_i) == 0
      case param.to_i
        when 1, 2, 3, 4, 5
          if !!@stacked
            "fa-stack-#{i}x"
          else
            "fa-#{i}x"
          end
        when 90, 180, 270
          "fa-rotate-#{i}"
        else
          nil
      end
    rescue
      case param
        when :fixed_width
          'fa-fw'
        when :left, :right
          "fa-pull-#{param}"
        when :horizontal, :vertical
          "fa-flip-#{param}"
        else
          if param.is_a?(Symbol)
            "fa-#{param}"
          else
            param
          end
      end
    end

    def build!
      tag = if !!@stacker
              %{<span class="#{@classes.join(' ')}">#{@stacker.join}</span>}
            else
              %{<i class="fa #{@classes.join(' ')}"></i>}
            end

      if tag.respond_to?(:html_safe)
        tag.html_safe
      else
        tag
      end
    end

    def stack(*args)
      @stacker.push(args.shift.fa(*args + [:stacking]))
    end
  end
end
