class BookingsController < ApplicationController
  before_action :set_schedule, only: [ :new, :create ]

  def index
    @bookings = Booking.includes(schedule :trainer).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = booking.new(schedule: @schedule, trainer_id: @schedule.trainer_id)
  end

  def create
    Booking.transaction do
      @booking = Booking.create!(
        schedule: @schedule,
        trainer_id: @schedule.trainer_id,
        kind: params[:kind].presence || :individual,
        status: :confirmed
      )

      BookingParticipant.create!(
        booking: @booking,
        user_id: current_user.id
      )

      redirect_to @booking, notice: "Reserva creada con exito"
    end
  rescue ActiveRecord::RecordInvalid => e
    reduirec_to root_path, alert: e.record.errors.full_messages.to_sentence
  end

  private
  def set_schedule
    @schedule = Schedule.includes(:booking).find(params[:schedule_id])
    if @schedule.booking.present?
      redirect_to root_path, alert: "El horario ya esta reservado" and return
    end
  end
end
