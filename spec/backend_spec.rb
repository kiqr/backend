# frozen_string_literal: true

require "spec_helper"

describe Backend do
  it { expect(described_class::VERSION).to be_truthy }

  it "can get a list of backend classes" do
    # We need to sort the list of classes since it is not guaranteed to be in the same order.
    expect(described_class.all.sort_by(&:model_name)).to eq [BlogPostBackend, CategoryBackend]
  end
end
