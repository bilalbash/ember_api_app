require 'rails_helper'

RSpec.describe Todo, type: :model do

  describe "persisted todo object" do
    it "could have nil title" do
      todo_1 = create :todo_1
      todo_1.title = nil
      todo_1.save
      expect(todo_1.valid?).to be_eql(true)
    end
  end

end
