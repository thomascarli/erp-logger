module Erp
  class Railtie < Rails::Railtie
    initializer "erp-logger-initializer" do
      log_dir = "#{Rails.root}/log/"
      file = File.join(log_dir,  "#{Rails.env}.erp.log")
      FileUtils.touch(file)
      config.erp_logger = ActiveSupport::Logger.new(file)
      config.erp_logger.formatter = proc do |severity, datetime, progname, msg|
        "#{msg.merge({ severity: severity, datetime: datetime, progname: progname }).to_json}\n"
      end
      Erp::Logger.info("Starting erp logger")
    end
  end
end
