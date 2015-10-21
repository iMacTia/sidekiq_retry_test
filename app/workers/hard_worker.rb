class HardWorker
  include Sidekiq::Worker

  sidekiq_options :retry => 5

  sidekiq_retry_in do |count|
    5
  end

  def perform(name)
    puts "Hi #{name}!"
    raise RandomError
  end

  class RandomError < StandardError; end
end