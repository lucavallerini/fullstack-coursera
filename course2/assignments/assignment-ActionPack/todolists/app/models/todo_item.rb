class TodoItem < ActiveRecord::Base

   def self.count_completed
      TodoItem.all.where(completed: true).count
   end

end
