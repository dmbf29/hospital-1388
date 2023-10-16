require 'csv'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @patients = []
    @next_id = 1
    @room_repository = room_repository
    load_csv if File.exists?(@csv_file_path)
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # we need to convert any non-strings
      # update the row for any non-string data
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      row[:room_id] = row[:room_id].to_i
      room = @room_repository.find(row[:room_id])
      row[:room] = room
      patient = Patient.new(row)
      @patients << patient
      @next_id = patient.id + 1
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['id', 'name', 'cured']
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?]
      end
    end
  end
end
