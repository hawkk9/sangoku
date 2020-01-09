module ApplicationHelper
  def dummy_user_id
    1
  end

  def javascript_path
    "#{controller_path}/#{action_name}.js"
  end
end
