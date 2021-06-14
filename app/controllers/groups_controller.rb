class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @family_groups = Group.where(category_id: 2).order('created_at DESC')
    @job_groups = Group.where(category_id: 3).order('created_at DESC')
    @friend_groups = Group.where(category_id: 4).order('created_at DESC')
    @group = Group.where(category_id: 5).order('created_at DESC')
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :category_id, user_ids: [])
  end
end
