# frozen_string_literal: true

RSpec.describe Web::Controllers::Subscribers::Create, type: :action do
  subject { action.call(params) }

  let(:action) { described_class.new(operation: operation) }
  let(:operation) { ->(*) { Success(Vacancy.new(id: 123)) } }

  let(:params) { { subscriber: { email: 'test@rubyjobs.dev' } } }

  context 'when operation returns success result' do
    let(:operation) { ->(*) { Success(Subscriber.new(email: 'test@rubyjobs.dev', id: 123)) } }
    let(:flash_message) { 'test@rubyjobs.dev успешно добавлен в рассылку.' }

    it { expect(subject).to redirect_to '/' }

    it 'shows flash message' do
      subject
      expect(action.exposures[:flash][:success]).to eq(flash_message)
    end
  end

  context 'when operation returns failure result' do
    let(:flash_message) { 'Произошла ошибка, попробуйте позже.' }
    let(:operation) { ->(*) { Failure(:error) } }

    it { expect(subject).to redirect_to '/' }

    it 'shows flash message' do
      subject
      expect(action.exposures[:flash][:error]).to eq(flash_message)
    end
  end

  context 'with real dependencies' do
    subject { action.call(params) }

    let(:action) { described_class.new }

    it { expect(subject).to redirect_to '/' }
  end
end
