class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotUnique, with: :handle_record_not_unique

  private

  def handle_record_not_unique(exception)
    redirect_to root_path, alert: "Record already exists."
  end

end
