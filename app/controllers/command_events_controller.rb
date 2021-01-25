# frozen_string_literal: true

class CommandEventsController < ApplicationController
  before_action :set_command_event, only: [:show, :edit, :update, :destroy]

  # Only in development we want to be able to explore the database via a convenient interface. Create is the only API exposed in production
  before_action :restrict_to_development, only: [:index, :show, :new, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, if: :json_request?

  # GET /command_events
  # GET /command_events.json
  def index
    @command_events = CommandEvent.all
  end

  # GET /command_events/10
  # GET /command_events/1.json
  def show
  end

  # GET /command_events/new
  def new
    @command_event = CommandEvent.new
  end

  # GET /command_events/1/edit
  def edit
  end

  # POST /command_events
  # POST /command_events.json
  def create
    @command_event = CommandEvent.new(command_event_params)

    respond_to do |format|
      if @command_event.save
        format.html { redirect_to @command_event, notice: "Command event was successfully created." }
        format.json { render :show, status: :created, location: @command_event }
      else
        format.html { render :new }
        format.json { render json: @command_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /command_events/1
  # PATCH/PUT /command_events/1.json
  def update
    respond_to do |format|
      if @command_event.update(command_event_params)
        format.html { redirect_to @command_event, notice: "Command event was successfully updated." }
        format.json { render :show, status: :ok, location: @command_event }
      else
        format.html { render :edit }
        format.json { render json: @command_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /command_events/1
  # DELETE /command_events/1.json
  def destroy
    @command_event.destroy
    respond_to do |format|
      format.html { redirect_to command_events_url, notice: "Command event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_command_event
      @command_event = CommandEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def command_event_params
      params.require(:command_event).permit(
        :name,
        :subcommand,
        :duration,
        :client_id,
        :tuist_version,
        :swift_version,
        :macos_version,
        :machine_hardware_name,
        params: {} # Allow any key inside the params JSON
        )
    end

    def restrict_to_development
      head(:bad_request) unless Rails.env.development?
    end

    def json_request?
      request.format.json?
    end
end
