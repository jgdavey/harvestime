require 'spec_helper'

describe Harvestime do 
  describe ".total" do
    let(:path) { File.expand_path('../data/example.md', __FILE__) }
    let(:lines) { File.read(path) }
    it "totals all lines passed" do
      Harvestime.total(lines).should == " 6:21"
    end
  end
end
