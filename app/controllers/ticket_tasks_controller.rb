class TicketTasksController < ApplicationController
  def index
    @all_ticket_tasks = TicketTask.all
    @inner_tasks = TicketTask.where(executor_id: current_account.id)
    @outer_tasks = TicketTask.where(assigner_id: current_account.id)
  end

  def new
    @ticket_task = TicketTask.new
    @own_account_tickets = Ticket.where(responsible_id: current_account.id)
  end

  def create
    @ticket_task = TicketTask.new(ticket_task_params)
    if @ticket_task.save
      redirect_to tickets_path
    else
      render :new
      flash[:alert] = "Ошибка при создании задачи!"
    end
  end

  private

  def ticket_task_params
    params.require(:ticket_task).permit(:ticket_id, :title, :description, :assigner_id, :executor_id)
  end
end