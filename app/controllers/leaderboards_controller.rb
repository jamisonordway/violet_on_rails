class LeaderboardsController < ApplicationController
  def public
    @leaderboard = Leaderboard.current_public
  end

  def friends
  end
end
