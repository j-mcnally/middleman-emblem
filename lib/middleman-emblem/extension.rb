


module Middleman
  module Emblem
    class << self
      def registered(app, options={})
        require "barber-emblem"
        require "#{File.dirname(__FILE__)}/sprockets-template"




        app.after_configuration do
          
          set :emblem_ext, "emblem" if emblem_ext.nil?
          set :emblem_dir, "emblem_templates" if emblem_ext.nil?

          





          ::Sprockets.register_engine ".#{emblem_ext}", Middleman::Emblem::Template
          spenv = ::Sprockets::Environment.new(root)
          spenv.append_path("#{source_dir}/#{emblem_dir}");

          #truncate output file
          File.open("#{source_dir}/app/templates.js", 'w') {|f| f.write("")}

          c = 0
          Dir["#{source_dir}/#{emblem_dir}/**/*.#{emblem_ext}"].each do |f|
            ignore sitemap.file_to_path(f)
            local_name = f.gsub("#{source_dir}/#{emblem_dir}/", "");
            template = spenv[local_name].to_s
            puts "   \e[1m\e[33m[emblem]\e[22m compiling \e[0m #{local_name}"



            basename = local_name.gsub(".#{emblem_ext}", "")
            File.open("#{source_dir}/app/templates.js", 'a') {|f| f.write(template + "\r\n") }
            c += 1
          end
          puts "   \e[1m\e[33m[emblem]\e[22m compiled \e[1m\e[0m#{c} \e[22m\e[33mtemplates to \e[1m\e[0msource/app/templates.js\e[22m"

        end

      end  
      alias :included :registered
    end
  end
end