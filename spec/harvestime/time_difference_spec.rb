require 'spec_helper'

describe Harvestime::TimeDifference do 
  describe ".new" do
    let(:start_time) { Time.at(3001).gmtime }
    let(:end_time) { Time.at(3703).gmtime }
    subject do
      Harvestime::TimeDifference.new(start_time, end_time)
    end
    it "takes start and end times as arguments" do
      subject.start_time.should == start_time
      subject.end_time.should == end_time
    end
  end

  describe ".parse" do
    let(:start_time) { "13:40" }
    let(:end_time) { "15:20" }
    let(:time_range) { start_time + " - " + end_time }
    subject { Harvestime::TimeDifference.parse(time_range) }
    it "returns instance for range formatted at 'HH:MM - HH:MM'" do
      subject.should == " 1:40"
    end
  end

  describe "#formatted" do
    subject { described_class.new(start_time, end_time) }
    let(:end_time) { time_at("14:59") }
    context "when difference is less than an hour" do
      let(:start_time) { time_at("14:16") }
      it "formats the time interval as HH:MM" do
        subject.formatted.should == " 0:43"
      end
    end
    context "when difference is less than 10 hours" do
      let(:start_time) { time_at("12:16") }
      it "formats the time interval as HH:MM" do
        subject.formatted.should == " 2:43"
      end
    end
    context "when difference is more than 10 hours" do
      let(:start_time) { time_at("02:16") }
      it "formats the time interval as HH:MM" do
        subject.formatted.should == "12:43"
      end
    end
  end
end
