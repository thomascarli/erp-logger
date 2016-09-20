Rails.configuration.erp_logger = ActiveSupport::Logger.new("#{Rails.root}/log/#{Rails.env}.erp.log")
Rails.configuration.erp_logger.formatter = proc do |severity, datetime, progname, msg|
  "#{msg.merge({ severity: severity, datetime: datetime, progname: progname }).to_json}\n"
end
Erp::Logger.info("Starting erp logger")
