class HomeController < ApplicationController
  def index
    @trainers = Trainer.oder(:First_name, :last_name)

    @schedules = Schedule
      .includes(:trainer, :booking)
      .where("horario >= ?", Time.zone.now.beginning_of_day)
      .order(:horario)

    if params[:date].present?
      date = Time.zone.parse(params[:date]) rescue nil
      if date
        @schedules = @schedules.where(horario: date.beginnign_of_dat..date.end_of_day)
      end
    end

    if param[:trainer_id].present?
      @schedules = @schedules.where(trainer_id: params[:trainer_id])
    end
  end
end
