# frozen_string_literal: true

require "spec_helper"

module Backend
  describe Base do
    context "when inherited from a subclass" do
      describe CategoryBackend do
        it { expect(described_class.model).to eq Category }
        it { expect(described_class.path).to eq "categories" }
        it { expect(described_class.full_path).to eq "/backend/categories" }
        it { expect(described_class.model_name).to eq "Category" }
        it { expect(described_class.params_key).to eq :category }
        it { expect(described_class.route_key).to eq :categories }
        it { expect(described_class.display_name_attribute).to eq :name }
        it { expect(described_class.index_columns.map(&:name)).to eq %i[id name slug] }

        # @todo: Move these tests to spec/backend/fields.rb
        it { expect(described_class.fields.map(&:model_attribute)).to eq %i[name slug content] }
        it { expect(described_class.fields.map(&:label)).to eq %w[Name Permalink Content] }
        it { expect(described_class.fields.map(&:type)).to eq %i[base base editor] }
      end

      describe BlogPostBackend do
        it { expect(described_class.model).to eq BlogPost }
        it { expect(described_class.path).to eq "blog_posts" }
        it { expect(described_class.full_path).to eq "/backend/blog_posts" }
        it { expect(described_class.model_name).to eq "Blog post" }
        it { expect(described_class.params_key).to eq :blog_post }
        it { expect(described_class.route_key).to eq :blog_posts }
        it { expect(described_class.display_name_attribute).to be_nil }
      end

      # describe "#fields" do
      #   it { expect(CategoryResource.fields.map(&:class).first).to eq Backend::Field::Base }
      #   it { expect(BlogPostResource.fields.map(&:class).first).to eq Backend::Field::Base }
      #   it { expect(BlogPostResource.fields.map(&:class).last).to eq Backend::Field::Editor }
      # end

      # describe "#normalized_name" do
      #   it { expect(CategoryResource.resource_name).to eq "Category" }
      #   it { expect(BlogPostResource.resource_name).to eq "Blog post" }
      # end
    end
  end
end
