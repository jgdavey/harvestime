require 'spec_helper'

describe Harvestime::Entry do

  describe "#project_name" do
    let(:time) { 30 }
    subject { Harvestime::Entry.new(description, time).project_name }
    context "when there is no description" do
      let(:description) { nil }
      it { should be_nil }
    end
    context "with a project in the description" do
      let(:description) { "Project A" }
      it { should == 'Project A' }
    end
    context "with a project and task in the description" do
      let(:description) { "Project A: Doing something" }
      it { should == 'Project A' }
    end
  end

  describe "#task_name" do
    let(:time) { 20 }
    subject { Harvestime::Entry.new(description, time).task_name }
    context "when there is no description" do
      let(:description) { nil }
      it { should be_nil }
    end
    context "with only a project in the description" do
      let(:description) { "Project A" }
      it { should be_nil }
    end
    context "with a project and task in the description" do
      let(:description) { "Project A: Doing something" }
      it { should == 'Doing something' }
    end
  end
end
