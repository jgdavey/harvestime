require 'spec_helper'

describe Harvestime::Line do
  describe ".new" do
    let(:text) { "string" }
    it "takes a line of text as an argument" do
      Harvestime::Line.new(text).text.should == text
    end
  end

  describe "#convert" do
    subject { Harvestime::Line.new(text).convert }
    context "when line needs converted" do
      let(:text) { "11:30 - 11:56 Internal: basketball" }
      it { should == "11:30 - 11:56  0:26 Internal: basketball" }
    end
    context "when line is already converted" do
      let(:text) { "11:30 - 11:56  0:26 Internal: basketball" }
      it { should == "11:30 - 11:56  0:26 Internal: basketball" }
    end
    context "with no description" do
      let(:text) { "11:30 - 11:56" }
      it { should == "11:30 - 11:56  0:26" }
    end
    context "when already converted with no description" do
      let(:text) { "11:30 - 11:56  0:26" }
      it { should == "11:30 - 11:56  0:26" }
    end
  end

  describe "#description" do
    subject { Harvestime::Line.new(text).description }
    context "when line needs converted" do
      let(:text) { "11:30 - 11:56 Internal: basketball" }
      it { should == "Internal: basketball" }
    end
    context "when line is already converted" do
      let(:text) { "11:30 - 11:56  0:26 Internal: basketball" }
      it { should == "Internal: basketball" }
    end
    context "with no description" do
      let(:text) { "11:30 - 11:56" }
      it { should be_nil }
    end
  end

  describe "#time_difference" do
    subject { Harvestime::Line.new(text).time_difference }
    context "when line needs converted" do
      let(:text) { "11:30 - 11:56 Internal: basketball" }
      it { should == " 0:26" }
    end
    context "when line is already converted" do
      let(:text) { "11:30 - 11:56  0:26 Internal: basketball" }
      it { should == " 0:26" }
    end
    context "with no description" do
      let(:text) { "11:30 - 11:56" }
      it { should == " 0:26" }
    end
  end
end
