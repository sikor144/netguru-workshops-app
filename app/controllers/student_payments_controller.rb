class StudentPaymentsController < ApplicationController
  expose(:student_payments)
  expose(:student_payment, attributes: :student_payment_params)
  expose(:students)

  before_action :authenticate_user!

  def create
    if student_payment.save
      redirect_to student_payment_path(student_payment), notice: I18n.t('shared.created', resource: 'student_payment')
    else
      render :new
    end
  end

  def update
    if student_payment.save
      redirect_to student_payment_path(student_payment), notice: I18n.t('shared.updated', resource: 'student_payment')
    else
      render :edit
    end
  end

  def destroy
    student_payment.destroy
    redirect_to student_payments_path, notice: I18n.t('shared.deleted', resource: 'student_payment')
  end

  private

  def student_payment_params
    params.require(:student_payment).permit(:amount, :due_date, :payment_date, :student_id)
  end
end
