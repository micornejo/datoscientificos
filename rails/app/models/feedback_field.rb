class FeedbackField
  attr_reader :id, :type, :title, :description

  @@fields = {}

  def self.fields
    @@fields
  end

  def self.<<(field)
    @@fields[field.id] = field
  end

  def self.[](id)
    @@fields[id]
  end

  def initialize(params)
    @id          = params[:id]
    @type        = params[:type]
    @title       = params[:title]
    @description = params[:description]
    self.class << self
  end

  def entries
    FeedbackEntry.where(field_id: @id).order(created_at: :desc)
  end

  YAML.load_file('app/data/feedback_fields.yml').each do |params|
    FeedbackField.new(params)
  end

end
