class Log < ActiveRecord::Base
    belongs_to :log_author, class_name: "User"

end
