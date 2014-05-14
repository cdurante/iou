require 'spec_helper'

describe "friendships/new" do
  before(:each) do
    assign(:friendship, stub_model(Friendship).as_new_record)
  end

  it "renders new friendship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", friendships_path, "post" do
    end
  end
end
