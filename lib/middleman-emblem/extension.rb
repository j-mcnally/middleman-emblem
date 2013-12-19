require "barber-emblem"
require "middleman-emblem/sprockets-template"

module Middleman
  module Emblem
    class << self
      @@template_root = "templates"
      @@ember = true
      @@object = "Ember.TEMPLATES"

      def template_root
        @@template_root
      end

      def ember
        @@ember
      end

      def object
        @@object
      end

      def registered(app, options={})
        sprocket_extension = "emblem"
        @@template_root    = options[:emblem_dir] if options.has_key?(:emblem_dir)
        @@ember            = options[:ember] if options.has_key?(:ember)
        @@object           = options[:object] if options.has_key?(:object)

        sprocket_extension = options[:emblem_ext] if options.has_key?(:emblem_ext)

        ::Sprockets.register_engine ".#{sprocket_extension}", Middleman::Emblem::Template
        app.after_configuration do
          root = [@@template_root].flatten
          root.each do |root|
            ignore "#{js_dir}/#{root}*" unless options.has_key?(:ignore) && !options[:ignore] 
          end
        end
      end  
      alias :included :registered
    end
  end
end