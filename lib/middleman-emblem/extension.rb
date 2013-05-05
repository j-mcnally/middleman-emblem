require "barber-emblem"
require "middleman-emblem/sprockets-template"

module Middleman
  module Emblem
    class << self
      @@template_root = "templates"

      def template_root
        @@template_root
      end

      def registered(app, options={})
        sprocket_extension = "emblem"
        app.after_configuration do
          @@template_root    = options[:emblem_dir] if options.has_key?(:emblem_dir)
          sprocket_extension = options[:emblem_ext] if options.has_key?(:emblem_ext)
          ignore "#{js_dir}/#{@@template_root}*"
          ::Sprockets.register_engine ".#{sprocket_extension}", Middleman::Emblem::Template
        end
      end  
      alias :included :registered
    end
  end
end