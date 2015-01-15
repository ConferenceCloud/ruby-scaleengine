class ScaleEngineAPI
  class Configuration
    class << self
      attr_accessor :api_key
      attr_accessor :secret_key
      attr_accessor :cdn

      def api_end_point
        "https://api.scaleengine.net/stable/"
      end

      def record_control_end_point
        "https://api.scaleengine.net/stable/serecordcontrols"
      end
    end
  end
end