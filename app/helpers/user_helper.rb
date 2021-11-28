module UserHelper


  def is_org_member?
    @user.organisation_id != nil
  end
end
