class Category < ActiveRecord::Base
  acts_as_tree :parent_id
  extend ActsAsTree::TreeView

  def all_children_ids_with_parent
    all_children_ids << self.id
  end

  def all_children_ids
    all_children.collect{|c| c.id}
  end

  def all_children
    all_children = []
    all_children+= self.children
    all_children.collect do |child|
      all_children+=child.all_children
    end
    all_children
  end
end
