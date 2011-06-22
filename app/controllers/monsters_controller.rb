class MonstersController < ApplicationController

  sortable_attributes :vitality, :hp, :exp, :lvl
  def index
    @monsters = Monster.find(:all, :order => sort_order).paginate(:page => params[:page])
  end
  
  
end
