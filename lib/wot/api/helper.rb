require 'benchmark'

module Wot
  class Api

    def make_request(namespace, action, parameters = {})
      response                           = nil
      params                             = {:params => parameters.dup}
      params[:params][:application_id]   = @app_id
      params[:params][:language]       ||= @language
      url                                = endpoint(namespace, action)

      print "Request: #{url}"

      time = Benchmark.realtime do
        response = JSON.parse(RestClient.get(url, params))
        response = response.nested_under_indifferent_access
      end

      puts " Done in #{(time * 1000).to_i} ms"
      
      raise Wot::Api::Error.new(response[:error]) if response[:status].downcase == "error"
      return response[:data]
    end

    def parse_response(data, object_type)
      result = nil
      if data.instance_of?(Array)
        result = []
        data.each do |options|
          result << object_type.new(self, options)
        end
      elsif data
        result = object_type.new(self, data)
      end

      result
    end
  end
end