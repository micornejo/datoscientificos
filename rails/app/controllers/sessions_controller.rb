# -*- coding: utf-8 -*-

class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :except => [:create, :close, :login, :failure]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/login
  def login
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    # @user = User.find_or_create_from_auth_hash(auth_hash)

    # Some auth_hash keys are: ["provider", "uid", "info", "credentials", "extra"]
    @auth_data = {
      provider: auth_hash.provider.to_sym,
      uid: auth_hash.uid,
      name: auth_hash.info.name,
      email: auth_hash.info.email,
      nickname: auth_hash.info.nickname,
      location: auth_hash.info.location,
      description: auth_hash.info.description
    }

    @user_identity = UserIdentity.find_by(provider: @auth_data[:provider], uid: @auth_data[:uid])
    if @user_identity
      @user = @user_identity.user
    else
      @user = User.create(name: @auth_data[:name], email: @auth_data[:email])
      @user_identity = UserIdentity.create(user: @user,
                                           provider: @auth_data[:provider],
                                           uid: @auth_data[:uid],
                                           nickname: @auth_data[:nickname],
                                           location: @auth_data[:location],
                                           description: @auth_data[:description])
    end

    p "Create session for user:"
    p @user

    self.current_user = @user
    @session = Session.create(user: @user,
                              provider: @user_identity[:provider],
                              uid: @user_identity[:uid],
                              remote_ip: request.remote_ip,
                              user_agent: request.user_agent)

    session[:user_id] = @user.id

    if @user_identity[:provider] == 'facebook'
      redirect_to 'http://datoscientificos.cl/eventos/1'
    else
      redirect_to :back
    end
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/GET /sessions/close
  # PATCH/GET /sessions/close.json
  def close
    @session = Session.find_by(user: current_user, closed_at: nil)
    @session.closed_at = Time.new
    @session.save
    session[:user_id] = nil
    redirect_to '/'
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
    end
  end

  def failure
    redirect_to '/sessions/login', notice: "Los datos que ha ingresado no concuerdan. Por favor, vuelva a intentar."
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def session_params
    params.require(:session).permit(:user_id, :provider, :uid, :remote_ip, :user_agent, :closed_at)
  end

end
