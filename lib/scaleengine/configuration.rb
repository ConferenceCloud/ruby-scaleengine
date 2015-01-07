class ScaleEngineAPI
  class Configuration
    class << self
      attr_accessor :api_key
      
      def end_point
        "https://api.scaleengine.net/stable"
      end
    end
  end
end