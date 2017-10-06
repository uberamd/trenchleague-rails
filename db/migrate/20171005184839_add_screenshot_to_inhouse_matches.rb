class AddScreenshotToInhouseMatches < ActiveRecord::Migration[5.1]
  def change
    add_attachment :inhouse_matches, :screenshot
  end
end
