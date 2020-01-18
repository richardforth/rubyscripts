require 'listy2'

RSpec.describe List do
  let (:list) { List.new("Shopping List") }
  it "has a name" do
    expect(list.name).to eq("Shopping List")
  end

  it "can change name" do
    list.name = "My Shopping List"
    expect(list.name).to eq("My Shopping List")
  end

  it "can add items" do
    list << "Pork Pie"
    list << "Eggs"
    list << "Milk"
    expect(list.items).to eq(["Pork Pie", "Eggs", "Milk"])
  end

  it "does not allow duplicates" do
    list << "Pork Pie"
    list << "Eggs"
    list << "Milk"
    list << "Apples"
    expect(list.items).to eq(["Pork Pie", "Eggs", "Milk", "Apples"])
  end
end
