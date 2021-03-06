module FeatureMacros
  def sign_in(*args)
    if args.size == 2
      email = args[0]
      password = args[1]
    else
      email = args[0].email
      password = args[0].password
    end

    visit new_user_session_path
    fill_in :email, with: email
    fill_in :password, with: password

    click_button "Login"
  end
end
