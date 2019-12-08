include 'rspec/autorun'





# Test Driven Development (TDD) Tests
describe Ticket do
  context "when puchased" do
    it "has row number" do
      expect(Ticket.row).to eq("J")
    end

    it "has seat number" do
      expect(Ticket.seat).to eq(12)
    end

    it "has performance date" do
      expect(Ticket.performance_date).to eq("March 17th 2020")
    end

    it "has performance start time" do
      expect(Ticket.performance_start_time).to eq("20:00")
    end

    it "has venue" do
      expect(Ticket.venue).to eq("The Cresset, Peterborough")
    end

    it "has act name" do
      expect(Ticket.act).to eq("Peter Kay Live")
    end
  end
end
