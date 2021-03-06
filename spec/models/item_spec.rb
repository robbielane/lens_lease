require "rails_helper"

RSpec.describe Item, type: :model do
  it "is valid with name, description, price, image_url" do
    item = Item.new(name: "Canon 7d",
                       description: "The best camera ever (NOT)",
                       price: 15,
                       image_url: "http://blah.blah")

    expect(item).to be_valid
  end
  it "is invalid without a name" do
    item = Item.new(description: "The best camera ever (NOT)",
                       price: 15,
                       image_url: "http://blah.blah")

    expect(item).to_not be_valid
  end
  it "is invalid without a description" do
    item = Item.new(name: "Canon 7d",
                       price: 15,
                       image_url: "http://blah.blah")

    expect(item).to_not be_valid
  end
  it "is invalid without a price" do
    item = Item.new(name: "Canon 7d",
                       description: "The best camera ever (NOT)",
                       image_url: "http://blah.blah")

    expect(item).to_not be_valid
  end
  it "is invalid without an image_url" do
    item = Item.new(name: "Canon 7d",
                    price: 13,
                    description: "The best camera ever (NOT)")

    expect(item).to_not be_valid
  end
end
