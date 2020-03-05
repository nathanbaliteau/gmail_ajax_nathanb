class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
    end
  end

  def create
    @email = Email.new(object: Faker::HarryPotter.spell, body: Faker::HarryPotter.quote, read: false)
    respond_to do |format|
      if @email.save
        format.html {redirect_to root_path}
        format.js { }
        flash[:notice] = "Email created"
      else
        redirect_to root_path
        flash[:notice] = "Please try again"
      end
    end
  end

  def update
    @email = Email.find(params[:id])
    if @email.read
      @email.update(read: false)
    else
      @email.update(read: true)
    end
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
      flash[:notice] = "Email destroyed"
    end
    @email.destroy
  end
end
