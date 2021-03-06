class Outcome
  def handle(result)
    status = result.status
    method_name = if status == 200
                    :call_on_success
                  elsif status < 500
                    :call_on_decline
                  else
                    :call_on_exception
                  end
    self.send(method_name)
  end
end
