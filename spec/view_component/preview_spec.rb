# Lookbook previews are only mounted in development, so nothing else in the
# suite ever loads them. Without this spec they silently rot whenever a
# component's API changes - which is exactly what happened to four of them.
describe ViewComponent::Preview, type: :component do
  it 'finds the previews' do
    expect(described_class.all).not_to be_empty
  end

  described_class.all.to_a.each do |preview|
    describe preview do
      preview.examples.each do |example|
        it "renders ##{example}" do
          expect { render_preview(example, from: preview) }.not_to raise_error
        end
      end
    end
  end
end
