require_relative "../../lib/pagination"
describe Paginated do
  include ::Conversions
  describe "given 20 entries" do
    before do
      @it = Paginated((1..20).collect{|n| n})
      @it.limiter = :first
      @it.offsetter = :drop
    end

    it "has two pages" do
      @it.page_count.should == 2
    end

    it "has the first 10 entries in the first page" do
      @it.entries.should == (1..10).collect{|n| n}
    end

    it "has the second 10 entries on the second page" do
      @it.page = 2
      @it.entries.should == (11..20).collect{|n| n}
    end
  end
end