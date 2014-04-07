require 'spec_helper'

describe "LandingPage" do
  describe "Going to landing page" do
    before { visit root_path }
      it { should have_title('IOU') }
      it { should have_content('Jake Hilborn') }
      it { should have_content('Alyssa Morrow') }
      it { should have_content('Caleb Durante') }
      it { should have_selector('slogan', text: 'Get Paid.') }
  end
end