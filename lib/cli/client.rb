module Cli
  module Client
    attr_accessor :config

    def client
      load_config

      @client ||= Fog::Tasks.new(:provider => 'Wunderlist',
                                 :wunderlist_username => config[:username],
                                 :wunderlist_password => config[:password])
    end

    def load_config
      if File.exists?(config_file)
        @config ||= YAML::load_file(config_file)
      else
        {}
      end
    end

    def save_config
      File.open(self.class.config_file, 'w') {|f| f.write old_config.to_yaml }
    end
  
    def config_file
      File.join(ENV['HOME'], '.wunderlist')
    end
  end
end