class StaticsController < ApplicationController
  def manifest
    expires_in 1.day

    respond_to { |format| format.webmanifest { render } }
  end
end
