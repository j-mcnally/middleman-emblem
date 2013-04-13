


module Middleman
  module Emblem
    class << self
      def registered(app, options={})
        require "barber-emblem"
        require "#{File.dirname(__FILE__)}/sprockets-template"




        app.after_configuration do
          puts "===Building emblem templates===="



          template_dir = File.join(build_dir, "app")
          



          ::Sprockets.register_engine ".haml", Middleman::Emblem::Template
          spenv = ::Sprockets::Environment.new(root)
          spenv.append_path("#{root}/source/app/templates_haml");

          #truncate output file
          File.open("#{source_dir}/app/templates.js", 'w') {|f| f.write("")}


          Dir["#{root}/source/app/templates_haml/**/*.haml"].each do |f|
            ignore sitemap.file_to_path(f)
            local_name = f.gsub("#{root}/source/app/templates_haml/", "");
            template = spenv[local_name].to_s
            


            basename = local_name.gsub(".haml", "")
            File.open("#{root}/source/app/templates.js", 'a') {|f| f.write(template + "\r\n") }
            



          end


        end

      end  
      alias :included :registered
    end
  end
end