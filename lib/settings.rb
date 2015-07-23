# Configuration loading
module Settings
  mattr_accessor :private_key

  # Load config from supplied hash
  #
  # @param config_hash [Hash] configuration
  def self.configure_from_hash(config_hash)
    configure(config_hash)
  end

  private

  def self.configure(provided_config)
    self.private_key = provided_config['private_key']
  end
end
