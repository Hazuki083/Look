class ApplicationController < ActionController::Base
  
  #ログイン後の遷移先
  def after_sign_in_path_for(resource)
    case resource
    when Admin
    admin_homes_top_path
    when Customer
      root_path
    end
  end

  #ログアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end
  
end
