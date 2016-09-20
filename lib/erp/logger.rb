module Erp
  class Logger

    def self.debug(message, hash = {})
      log(:debug, message, hash)
    end

    def self.info(message, hash = {})
      log(:info, message, hash)
    end

    def self.warn(message, hash = {})
      log(:warn, message, hash)
    end

    def self.error(message, hash = {})
      log(:error, message, hash)
    end

    def self.fatal(message, hash = {})
      log(:fatal, message, hash)
    end

    def self.log(level, message, hash = {})
      hash[:message] = message
      validate_required_hash_keys(hash)
      log_message(level, hash)
    rescue StandardError => e
      puts e
    end

    private_class_method

    def self.validate_required_hash_keys(hash)
      required_hash_keys.each do |key|
        raise "missing key in erp log message #{key}" unless hash.has_key?(key)
      end
    end

    def self.required_hash_keys
      [:message]
    end

    def self.log_message(level, hash)
      logger.send(level, hash)
    end

    def self.logger
      Rails.configuration.erp_logger
    end

    #wish list:
    #company_id
    #job_id
    #source (procore, resque, fx)
    #sync_event_id
    #entity_type (vendor, job etc,)
    #entity_id

    #for new sync
    #conversation_syncable_id
    #conversation_has_syncable_id
    #item_syncable_id
    #item_has_syncable_id

  end
end

