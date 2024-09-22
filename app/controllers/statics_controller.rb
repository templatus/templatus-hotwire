class StaticsController < ApplicationController
  skip_before_action :check_for_lockup, raise: false
  layout false

  def manifest
    expires_in 1.day

    respond_to { |format| format.webmanifest { render } }
  end
end
