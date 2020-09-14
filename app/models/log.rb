class Log < ActiveRecord::Base
    belongs_to :author, class_name: "User"
    validates :game_title, presence: true
    validates :game_console, presence: true
    validates :game_desc, presence: true
end
