class SessionsController < Devise::SessionsController
  respond_to :json
  def create

    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
        @connection = ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :host     => "localhost",
      :database => "db/development.sqlite3"
)
        sql = "UPDATE users
             SET status = 'Online'
            WHERE id = " + current_user.id.to_s
    @connection.connection.execute(sql)
    redirect_to root_url
  end

  def destroy
        
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    @connection = ActiveRecord::Base.establish_connection(
      :adapter  => "sqlite3",
      :host     => "localhost",
      :database => "db/development.sqlite3"
)
        sql = "UPDATE users
            SET status = 'Offline'
            WHERE id = " + current_user.id.to_s
    @connection.connection.execute(sql)
    sign_out
    redirect_to root_url
  end

  def failure
    render :status => 401,
           :json => { :success => false,
                      :info => "Login Credentials Failed"
           }
    
  end

  def show_current_user
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
           :json => { :success => true,
                      :info => "Current User",
                      :user => current_user
           }

  end
end