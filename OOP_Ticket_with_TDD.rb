require 'rspec/autorun'


class Ticket
  def initialize(hash)
    @row = hash[:row]
    @seat = hash[:seat]
    @venue = hash[:venue]
    @act = hash[:act]
    @performance_date = hash[:performance_date]
    @performance_start_time = hash[:performance_start_time]
  end

  def row
    @row
  end

  def seat
    @seat
  end

  def performance_date
    @performance_date
  end

  def performance_start_time
    @performance_start_time
  end

  def venue
    @venue
  end

  def act
    @act
  end
end


# Test Driven Development (TDD) Tests
describe Ticket do
  context "when puchased" do
    let(:order_details) do
      {
        seat: 12,
        row: "J",
        venue: "The Cresset, Peterborough",
        act: "Peter Kay Live",
        performance_date: "March 17th 2020",
        performance_start_time: "20:00"
      }
    end

    let(:myticket) do
      Ticket.new(order_details)
    end
    it "has row number" do
      expect(myticket.row).to eq("J")
    end

    it "has seat number" do
      expect(myticket.seat).to eq(12)
    end

    it "has performance date" do
      expect(myticket.performance_date).to eq("March 17th 2020")
    end

    it "has performance start time" do
      expect(myticket.performance_start_time).to eq("20:00")
    end

    it "has venue" do
      expect(myticket.venue).to eq("The Cresset, Peterborough")
    end

    it "has act name" do
      expect(myticket.act).to eq("Peter Kay Live")
    end
  end

  context "ticket sale sets custom values" do
    let(:order_details) do
      {
        seat: 8,
        row: "F",
        venue: "Nottingham Odeon IMAX",
        act: "LeMan 66",
        performance_date: "December 16th, 2019",
        performance_start_time: "19:30"
      }
    end

    let(:myticket) do
      Ticket.new(order_details)
    end

    it "has row number" do
      expect(myticket.row).to eq(order_details[:row])
    end

    it "has seat number" do
      expect(myticket.seat).to eq(order_details[:seat])
    end

    it "has performance date" do
      expect(myticket.performance_date).to eq(order_details[:performance_date])
    end

    it "has performance start time" do
      expect(myticket.performance_start_time).to eq(order_details[:performance_start_time])
    end

    it "has venue" do
      expect(myticket.venue).to eq(order_details[:venue])
    end

    it "has act name" do
      expect(myticket.act).to eq(order_details[:act])
    end
  end
end
