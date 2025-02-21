class DashboardController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def index
    # authorize :dashboard
  end
end
