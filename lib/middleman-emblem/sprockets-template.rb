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
        "Ember.TEMPLATES[#{template_path(scope.logical_path).inspect}]"
      end

      def template_path(path)
        root = configuration.templates_root
        if root.kind_of? Array
          root.each do |root|
            path.sub!(/#{Regexp.quote(root)}\//, '')
          end
        else
          unless root.empty?
            path.sub!(/#{Regexp.quote(root)}\/?/, '')
          end
        end

        path = path.split('/')

        path.join(configuration.templates_path_separator)
      end

      def configuration
        OpenStruct.new(
          templates_root: Middleman::Emblem.template_root,
          templates_path_separator: "/"
        )
      end

      def precompile_ember_emblem(string)
        Barber::Emblem::EmberFilePrecompiler.call(string)
      end
    end
  end
end