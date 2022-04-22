# frozen_string_literal: true

require "spec_helper"

describe "dashboard", type: :feature do
  describe "#index", type: :feature do
    before { visit "/backend/categories" }

    it { expect(page).to have_css "h1", text: "Categories" }
    it { expect(page).to have_css "table th", text: "ID" }
    it { expect(page).to have_css "table th", text: "Name" }
    it { expect(page).to have_css "table th", text: "Slug" }
  end

  describe "#new", type: :feature do
    before { visit "/backend/categories/new" }

    it { expect(page).to have_css "h1", text: "Create Category" }
    it { expect(page).to have_css "a.button-header", text: "Back to Categories" }
    it { expect(page).to have_css "label", text: "Name" }
    it { expect(page).to have_css "label", text: "Permalink" }
    it { expect(page).to have_css "input", id: "category_slug" }
    it { expect(page).to have_css ".custom-input-html", id: "category_slug" }
  end
end
