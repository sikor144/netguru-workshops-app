require 'rails_helper'

RSpec.describe StudentPaymentsController do
  let(:user) { create :user }
  let(:student) { create :student }

  before { sign_in user }

  describe 'GET #show' do
    let(:student_payment) { create :student_payment, student_id: student.id }
    subject { get :show, id: student_payment.id }

    it_behaves_like 'template rendering action', :show
  end

  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #edit' do
    let(:student_payment) { create :student_payment, student_id: student.id }
    subject { get :edit, id: student_payment.id }

    it_behaves_like 'template rendering action', :edit
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'template rendering action', :new
  end

  describe 'POST #create' do
    let!(:params) do
      { student_payment: { amount: '1.23', student_id: student.id } }
    end
    subject { post :create, params }

    context 'success' do
      it { is_expected.to redirect_to student_payment_path(controller.student_payment) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq I18n.t('shared.created', resource: 'student_payment')
      end

      it 'creates student payment' do
        expect{ subject }.to change(StudentPayment, :count).by(1)
      end
    end

    context 'failure' do
      include_context 'record save failure'

      it_behaves_like 'template rendering action', :new
    end
  end

  describe 'PUT #update' do
    let!(:student_payment) { create :student_payment, amount: '1.23', student_id: student.id }
    let(:amount) { '2.34'}
    let!(:params) do
      { id: student_payment.id, student_payment: { amount: amount } }
    end
    subject { put :update, params }

    context 'success' do
      it { is_expected.to redirect_to student_payment_path(controller.student_payment) }

      it 'flashes info' do
        subject
        expect(flash[:notice]).to eq I18n.t('shared.updated', resource: 'student_payment')
      end

      context 'updates student payment' do
        subject { -> { put :update, params } }
        it { is_expected.to change{ student_payment.reload.amount.to_s }.to(amount) }
      end
    end

    context 'failure' do
      include_context 'record save failure'

      it_behaves_like 'template rendering action', :edit
    end
  end

  describe 'DELETE #destroy' do
    let!(:student_payment) { create :student_payment, student_id: student.id }
    subject { delete :destroy, id: student_payment.id }

    it { is_expected.to redirect_to student_payments_path }

    it 'flashes info' do
      subject
      expect(flash[:notice]).to eq I18n.t('shared.deleted', resource: 'student_payment')
    end

    it 'destroys student payment' do
      expect{ subject }.to change(StudentPayment, :count).by(-1)
    end
  end
end
