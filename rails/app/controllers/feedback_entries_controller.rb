class FeedbackEntriesController < ApplicationController
  before_action :set_feedback_entry, only: [:show, :edit, :update, :destroy]

  # GET /feedback_entries
  # GET /feedback_entries.json
  def index
    @feedback_entries = FeedbackEntry.all
  end

  # GET /feedback_entries/1
  # GET /feedback_entries/1.json
  def show
  end

  # GET /feedback_entries/new
  def new
    @feedback_entry = FeedbackEntry.new
  end

  # GET /feedback_entries/1/edit
  def edit
  end

  # POST /feedback_entries
  # POST /feedback_entries.json
  def create
    @feedback_entry = FeedbackEntry.new()
    @feedback_entry.value = params['fields'].to_json
    @feedback_entry.user_id = current_user.id if current_user
    @feedback_entry.save
    render json: @feedback_entry
  end

  # PATCH/PUT /feedback_entries/1
  # PATCH/PUT /feedback_entries/1.json
  def update
    respond_to do |format|
      if @feedback_entry.update(feedback_entry_params)
        format.html { redirect_to @feedback_entry, notice: 'Feedback entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @feedback_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_entries/1
  # DELETE /feedback_entries/1.json
  def destroy
    @feedback_entry.destroy
    respond_to do |format|
      format.html { redirect_to feedback_entries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_entry
      @feedback_entry = FeedbackEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_entry_params
      params.require(:feedback_entry).permit(:feedback_field_id, :user_id, :value, :status, :post_id)
    end
end
