require 'sprockets'
require 'sprockets/engines'
require 'barber-emblem'
require 'barber'


module Middleman
  module Emblem
    class Template < Tilt::Template
      def self.default_mime_type
        'application/javascript'
      end
      def prepare; end
      def evaluate(scope, locals, &block)
        target = template_target(scope)
        template = data
        template = precompile_ember_emblem(template)
        "#{target} = #{template}\n"
      end

      private


      def template_target(scope)
        "Ember.TEMPLATES[#{scope.logical_path.inspect}]"
      end


      def precompile_ember_emblem(string)
        Barber::Emblem::EmberFilePrecompiler.call(string)
      end
    end
  end
end