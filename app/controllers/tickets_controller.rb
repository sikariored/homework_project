class TicketsController < ApplicationController
  before_action :load_new_tickets, :load_in_work_tickets, :load_closed_tickets, :load_on_verification_tickets, :load_own_account_tickets, only: %i[index update]
  before_action :load_all_lines_accounts, only: %i[index]
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
      puts @ticket.errors.full_messages
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update ticket_params
      redirect_to tickets_path
      flash[:notice] = "Заявка обновлена"
    else
      redirect_to tickets_path
      flash[:notice] = "Ошибка при изменении статуса заявки"
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :body, :account_id, :ticket_status_id, :responsible_id)
  end

  def load_new_tickets
    @new_tickets = Ticket.where(ticket_status_id: TicketStatus.find_by(status_name: 'Новая')&.id)
  end

  def load_in_work_tickets
    @in_work_tickets = Ticket.where(ticket_status_id: TicketStatus.find_by(status_name: 'В работе')&.id)
  end

  def load_on_verification_tickets
    @on_verification_tickets = Ticket.where(ticket_status_id: TicketStatus.find_by(status_name: 'Клиент проверяет')&.id)
  end

  def load_closed_tickets
    @closed_tickets = Ticket.where(ticket_status_id: TicketStatus.find_by(status_name: 'Закрыта')&.id)
  end

  def load_all_lines_accounts
    @all_lines_accounts = Account.where(role: Role.where(role_name: ['Работник 1 линии', 'Работник 2 линии', 'Работник 3 линии']))
  end

  def load_own_account_tickets
    @own_account_tickets = Ticket.where(responsible_id: current_account.id)
  end

end