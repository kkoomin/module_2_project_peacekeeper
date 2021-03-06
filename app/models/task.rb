class Task < ApplicationRecord
    has_many :comments
    belongs_to :user
     
    #validates :name, presence: true


    def task_completer
        User.find(self.completer).nickname
    end 
    
    def status_description
        self.status == true ? "Complete" : "Incomplete"
    end
    
    def status_description_button_text
        self.status == true ? 'Set To Incomplete' : 'Mark Complete'
    end

    def status_description_button_image
        self.status == true ? '<i class="far fa-check-square"></i>'.html_safe : '<i class="far fa-square"></i>'.html_safe
    end

    def status_pinned_button_image
        self.pinned == true ? '<i style="color: red" class="fas fa-map-pin"></i>'.html_safe : '<i class="fas fa-map-pin"></i>'.html_safe
    end
end



