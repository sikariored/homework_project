class TicketsController < ApplicationController
  def index
    allowed_roles = [1, 2]
    @allowed_roles = allowed_roles
    @all_tickets = Ticket.all
    @only_new_tickets = @all_tickets.select { |ticket| ticket.status == 'Новая' }
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

  private

  def ticket_params
    params.require(:ticket).permit(:title, :body, :account_id)
  end
end