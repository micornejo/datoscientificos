# -*- coding: utf-8 -*-

class FeedbackFieldsController < ApplicationController
  before_filter :authorize, :except => :post

  # GET /feedback_fields
  # GET /feedback_fields.json
  def index
    @fields = FeedbackField.fields
  end

  # GET /feedback_fields/1
  # GET /feedback_fields/1.json
  def show
    @field = FeedbackField.fields[params[:id]]
  end

  # POST /feedback_fields
  # POST /feedback_fields.json
  def post
    post_id = "%10.5f" % Time.new.to_f
    params['fields'].each do |id, value|
      if FeedbackField.fields.include? id
        entry = FeedbackEntry.create(field_id: id, value: value, post_id: post_id)
        entry.user = current_user if current_user
        entry.save
      end
    end
    respond_to do |format|
      format.html { render nothing: true }
      format.json { render json: params }
    end
  end

end
