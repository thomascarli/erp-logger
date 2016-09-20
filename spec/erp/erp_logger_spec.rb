require 'spec_helper'
require 'rails'

RSpec.describe Erp::Logger do
  it 'calls logger with debug' do
    expect(Rails).to receive_message_chain(:configuration, :erp_logger, :debug).with({ message: 'foo' })
    Erp::Logger.debug("foo")
  end

  it 'calls logger with info' do
    expect(Rails).to receive_message_chain(:configuration, :erp_logger, :info).with({ message: 'foo' })
    Erp::Logger.info("foo")
  end

  it 'calls logger with warn' do
    expect(Rails).to receive_message_chain(:configuration, :erp_logger, :warn).with({ message: 'foo' })
    Erp::Logger.warn("foo")
  end

  it 'calls logger with error' do
    expect(Rails).to receive_message_chain(:configuration, :erp_logger, :error).with({ message: 'foo' })
    Erp::Logger.error("foo")
  end

  it 'calls logger with fatal' do
    expect(Rails).to receive_message_chain(:configuration, :erp_logger, :fatal).with({ message: 'foo' })
    Erp::Logger.fatal("foo")
  end
end
