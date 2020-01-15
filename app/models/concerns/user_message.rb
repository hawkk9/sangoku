module UserMessage
  def message(body)
    "<font color='navy'>●</font>#{body}(#{Time.new.strftime("%d日%H時%M分")})"
  end
end