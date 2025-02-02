class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network

    def actors_list
        # that returns an Array of the full names of each actor associated with the a show. 
        # Remember, a show should have many actors through characters.
        # Character.where(actor:self).map{|c|"#{c.name} - #{c.show.name}"}
        Character.where(show:self).map{|character|character.actor.full_name}
    end
end