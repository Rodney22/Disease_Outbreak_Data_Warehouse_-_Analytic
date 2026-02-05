CREATE TABLE Patient (
    patient_id VARCHAR(10) PRIMARY KEY,
    patient_name VARCHAR(255),
    age INT,
    gender_code CHAR(1),
    contact_information VARCHAR(20),
    symptom_severity VARCHAR(20)
);
-- Alter the table to increase the column size for contact_information
ALTER TABLE Patient
ALTER COLUMN contact_information TYPE VARCHAR(50);


CREATE TABLE Healthcare_Provider (
    provider_id VARCHAR(10) PRIMARY KEY,
    provider_speciality VARCHAR(255),
    contact_information VARCHAR(20)
);
-- Alter the table to increase the column size for contact_information
ALTER TABLE Healthcare_Provider
ALTER COLUMN contact_information TYPE VARCHAR(50);

CREATE TABLE Disease (
    disease_id VARCHAR(10) PRIMARY KEY,
    disease_name VARCHAR(255),
    disease_description TEXT,
    transmission_mode VARCHAR(50)
);

CREATE TABLE Treatment (
    treatment_id VARCHAR(10) PRIMARY KEY,
    disease_id VARCHAR(10),
    treatment_name VARCHAR(255),
    prescribed_dosage VARCHAR(50),
    treatment_effectiveness VARCHAR(50),
    FOREIGN KEY (disease_id) REFERENCES Disease(disease_id)
);

CREATE TABLE Symptoms (
    symptom_id VARCHAR(10) PRIMARY KEY,
    disease_id VARCHAR(10),
    symptom_description TEXT,
    severity_level VARCHAR(50),
    FOREIGN KEY (disease_id) REFERENCES Disease(disease_id)
);

CREATE TABLE Outbreak (
    outbreak_id VARCHAR(10) PRIMARY KEY,
    disease_id VARCHAR(10),
    start_date DATE,
    end_date DATE,
    location_id VARCHAR(10),
    severity_level VARCHAR(50),
    FOREIGN KEY (disease_id) REFERENCES Disease(disease_id)
);

CREATE TABLE Location (
    location_id VARCHAR(10) PRIMARY KEY,
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    population INT
);

CREATE TABLE Patient_Appointment (
    appointment_id VARCHAR(10) PRIMARY KEY,
    patient_id VARCHAR(10),
    provider_id VARCHAR(10),
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (provider_id) REFERENCES Healthcare_Provider(provider_id)
);

CREATE TABLE Patient_Outbreak (
    patient_id VARCHAR(10),
    outbreak_id VARCHAR(10),
    PRIMARY KEY (patient_id, outbreak_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (outbreak_id) REFERENCES Outbreak(outbreak_id)
);                  