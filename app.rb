require_relative 'app/models/patient'
require_relative 'app/models/room'
require_relative 'app/repositories/patient_repository'

# scott = Patient.new(name: 'scott', cured: true)
# nick = Patient.new(name: 'nick')
# shinji = Patient.new(name: 'shinji')

# vip = Room.new(capacity: 2)
# general = Room.new(capacity: 20)

csv_file_path = 'data/patients.csv'
patient_repository = PatientRepository.new(csv_file_path)



# rina = Patient.new(name: 'Rina')
# mao = Patient.new(name: 'Mao')
# patient_repository.create(rina)
# patient_repository.create(mao)
# p patient_repository

# vip.add_patient(scott)
# vip.add_patient(nick)
# general.add_patient(shinji)
# p vip
# p general
# p scott
