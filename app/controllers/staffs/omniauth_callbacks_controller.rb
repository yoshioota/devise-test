class Staffs::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    fb = request.env['omniauth.auth']
    if staff = Staff.where(email: fb[:info][:email]).first_or_initialize
      staff.password = staff.password_confirmation = 'hogehoge'
      staff.save!
      sign_in staff
      staff
    end

    redirect_to welcome_index_path
  end
end
