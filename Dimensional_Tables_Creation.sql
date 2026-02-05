-- Dimension Table for Date
CREATE TABLE disease_outbreak_dw.dimension_date (
    date_id SERIAL PRIMARY KEY,
    year INT,
    quarter INT,
    month INT,
    week INT,
    day_of_week INT
);

-- Dimension Table for Disease
CREATE TABLE disease_outbreak_dw.dimension_disease (
    disease_id VARCHAR(10) PRIMARY KEY,
    disease_name VARCHAR(255),
    disease_description TEXT,
    transmission_mode VARCHAR(50)
);

-- Dimension Table for Location
CREATE TABLE disease_outbreak_dw.dimension_location (
    location_id VARCHAR(10) PRIMARY KEY,
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    population INT
);

-- Dimension Table for Healthcare Provider
CREATE TABLE disease_outbreak_dw.dimension_healthcare_provider (
    provider_id VARCHAR(10) PRIMARY KEY,
    provider_specialty VARCHAR(255),
    contact_information VARCHAR(50)
);

-- Dimension Table for Patient
CREATE TABLE disease_outbreak_dw.dimension_patient (
    patient_id VARCHAR(10) PRIMARY KEY,
    patient_name VARCHAR(255),
    age INT,
    gender_code CHAR(1),
    symptom_severity VARCHAR(20)
);

-- Dimension Table for Outbreak
CREATE TABLE disease_outbreak_dw.dimension_outbreak (
    outbreak_id VARCHAR(10) PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    severity_level VARCHAR(50)
);

-- Fact Table for Outbreak
CREATE TABLE disease_outbreak_dw.fact_outbreak (
    fact_outbreak_id SERIAL PRIMARY KEY,
    outbreak_id VARCHAR(10),
    disease_id VARCHAR(10),
    location_id VARCHAR(10),
    patient_count INT,
    severity_level VARCHAR(50),
    treatment_count INT,
    date_id INT,
    FOREIGN KEY (outbreak_id) REFERENCES disease_outbreak_dw.dimension_outbreak (outbreak_id),
    FOREIGN KEY (disease_id) REFERENCES disease_outbreak_dw.dimension_disease (disease_id),
    FOREIGN KEY (location_id) REFERENCES disease_outbreak_dw.dimension_location (location_id),
    FOREIGN KEY (date_id) REFERENCES disease_outbreak_dw.dimension_date (date_id)
);
