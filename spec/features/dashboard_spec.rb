# frozen_string_literal: true

require "spec_helper"

describe "dashboard", type: :feature do
  before { visit "/backend/" }

  it { expect(page).to have_css "h1", text: "Dashboard" }
  it { expect(page).to have_css "nav#primary > a", text: "Categories" }
end
