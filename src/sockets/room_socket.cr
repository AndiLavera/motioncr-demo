struct ChatSocket < Amber::WebSockets::ClientSocket
  channel "motion:*", Motion::Channel

  def on_connect
    # do some authentication here
    # return true or false, if false the socket will be closed
    true
  end
end
