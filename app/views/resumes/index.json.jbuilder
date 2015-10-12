json.array!(@resumes) do |resume|
  json.extract! resume, :id, :attachment, :letter, :user_id, :post_id
  json.url resume_url(resume, format: :json)
end
