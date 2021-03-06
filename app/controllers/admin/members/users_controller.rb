class Admin::Members::UsersController < AdminController
  before_action :set_user, only: [:show, :destroy, :toggle_ban]
  before_action :set_breadcrumps_base

  def index
    @q = User.ransack(params[:q])

    @users = UsersDecorator.decorate(
        UserDecorator.decorate_collection(
            @q.result.includes(:profile).accessible_by(current_ability).page(params[:page])
        )
    )

    gon.conditions = UserDecorator.search_conditions

    if request.xhr?
      render partial: 'contents'
    end
  end

  def show
    if request.xhr?
      render partial: 'show'
    end
  end

  def toggle_ban
    # true/false upside down
    status = @user.blacklist_flg ^= true
    @user.update(:blacklist_flg => status)

    set_users
    render :action => 'index'
  end

  def destroy
    @user.destroy

    @q = User.ransack(params[:q])

    @users = UsersDecorator.decorate(
        UserDecorator.decorate_collection(
            @q.result.includes(:profile).accessible_by(current_ability).page(params[:page])
        )
    )
    render partial: 'contents'
  end

  def condition
    @condition = params[:condition]
    render partial: 'admin/members/users/html/condition'
  end

  private
    def set_user
      @user = UserDecorator.decorate(User.find(params[:id]))
    end

    def search_params
      params.require(:q).permit(:email_cont)
    end

    def set_breadcrumps_base
      add_breadcrumb t('admin.sidemenu_5.title')
      add_breadcrumb t('admin.users.title')
    end
end
