module AdminHelper
  def active? (action)
    utilize_action = -> (act) {  act.split('/').reject {|item| item == 'admin'}.join('/') }

    target_action = utilize_action.call(action)
    current_action = utilize_action.call(params[:controller])

    if target_action == current_action
      "active"
    end
  end

  def active_module? (members)
    module_index = 1

    utilize_action = -> (act) {  act.split('/')[module_index] }
    current_action = utilize_action.call(params[:controller])

    if members == current_action
      "active"
    end
  end

  def get_action
    controller_index = 2
    params[:controller].split('/')[controller_index].capitalize
  end
end
