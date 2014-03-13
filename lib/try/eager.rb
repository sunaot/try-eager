require 'timeout'

module Try
  def self.eager params = {}, &block
    options = {
      until: ->(args) { true },
      timeout: 10, # in sec
      interval: 0.1, # in sec
    }.update(params)
    timeout(options[:timeout]) do
      loop do
        result = block.call
        break result if options[:until].call(result)
        sleep options[:interval]
      end
    end
  end

  def self.call enumerator, params = {}, &block
    options = {
      until: ->(args) { true },
      interval: 0.1, # in sec
    }.update(params)
    enumerator.each do
      result = block.call
      break result if options[:until].call(result)
      sleep options[:interval]
    end
  end
end
