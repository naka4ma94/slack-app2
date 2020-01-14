if Rails.env == "development"
  30.times do |i|
    Room.create(name: "room#{ i + 1 }", workspace_id: 1)
    Message.create!(content: "")
  end
end
