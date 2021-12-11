describe ClicksChannel, type: :channel do
  it 'successfully subscribes and unsubscribes' do
    subscribe
    expect(subscription).to be_confirmed

    unsubscribe
    expect(subscription).to be_confirmed
  end
end
