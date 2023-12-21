class TicketsController < ApplicationController
  before_action :load_new_tickets, only: %i[index update]
  def index
    @all_tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_account.ticket.new(ticket_params)
    if @ticket.save
      redirect_to tickets_path
    else
      render :new
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update ticket_params
      redirect_to tickets_path
      flash[:notice] = "Статус заявки изменён"
    else
      redirect_to tickets_path
      flash[:notice] = "Ошибка при изменении статуса заявки"
    end
  end
  private

  def ticket_params
    params.require(:ticket).permit(:title, :body, :account_id, :ticket_status_id)
  end

  def load_new_tickets
    @new_tickets = Ticket.where(ticket_status_id: TicketStatus.find_by(status_name: 'Новая')&.id)
  end
end