class DataImporter
  def initialize(path)
    raise 'File not present' unless path.present?
    @path = path
  end

  def process_spreadsheet
    process_topics

  end

  def process_topics
    spreadsheet =
    spreadheet.sheet('topic names').each_row_streaming(offset: 1) do |row|
      Topic.find_or_create_by!(name: "#{row[1]}")
    end
  end
end