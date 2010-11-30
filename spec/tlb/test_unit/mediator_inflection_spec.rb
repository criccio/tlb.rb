require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')
require 'mediator_inflection'

describe Tlb::TestUnit::MediatorInflection do
  it "should be included in test-runner-mediator" do
    Test::Unit::UI::TestRunnerMediator.included_modules.should include(Tlb::TestUnit::MediatorInflection)
  end

  it "should call splitter and observer on run_suite when included" do
    mediator = Class.new do
      attr_reader :run_suite_called
      def run_suite
        @run_suite_called = true
        :run_suite_return
      end
      include Tlb::TestUnit::MediatorInflection
    end.new

    mediator.expects(:register_observers) do
      mediator.run_suite_called.should be_false
    end
    mediator.expects(:prune_suite) do
      mediator.run_suite_called.should be_false
    end

    mediator.run_suite.should == :run_suite_return

    mediator.run_suite_called.should be_true
  end
end


