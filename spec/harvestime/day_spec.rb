require 'spec_helper'

describe Harvestime::Day do 
  describe "#total" do
    subject { Harvestime::Day.new(lines).total }
    context "with no lines" do
      let(:lines) { [] }
      it { should be_nil }
    end
    context "with one line" do
      let(:lines) { [stub(:time_difference => " 0:32")] }
      it "is the value of that line's total" do
        subject.should == " 0:32"
      end
    end
    context "with many lines" do
      let(:lines) do
        [
          stub(:time_difference => " 0:40"),
          stub(:time_difference => " 2:33")
        ]
      end
      it "totals all lines' values" do
        subject.should == " 3:13"
      end
    end
    context "with many lines, over 10 hours" do
      let(:lines) do
        [
          stub(:time_difference => " 0:40"),
          stub(:time_difference => "10:32"),
          stub(:time_difference => " 2:03")
        ]
      end
      it "totals all lines' values" do
        subject.should == "13:15"
      end
    end
  end
end
