-- Load data into dimension_date from the outbreak's start_date
INSERT INTO disease_outbreak_dw.dimension_date (year, quarter, month, week, day_of_week)
SELECT DISTINCT
    EXTRACT(YEAR FROM o.start_date) AS year,
    EXTRACT(QUARTER FROM o.start_date) AS quarter,
    EXTRACT(MONTH FROM o.start_date) AS month,
    EXTRACT(WEEK FROM o.start_date) AS week,
    EXTRACT(DOW FROM o.start_date) AS day_of_week
FROM outbreak o;

-- Load data into dimension_disease from the outbreak table
INSERT INTO disease_outbreak_dw.dimension_disease (disease_id, disease_name, disease_description, transmission_mode)
SELECT DISTINCT
    o.disease_id,
    d.disease_name,
    d.disease_description,
    d.transmission_mode
FROM outbreak o
JOIN disease d ON o.disease_id = d.disease_id;

-- Load data into dimension_location from the outbreak table
INSERT INTO disease_outbreak_dw.dimension_location (location_id, city, state, country, population)
SELECT DISTINCT
    o.location_id,
    l.city,
    l.state,
    l.country,
    l.population
FROM outbreak o
JOIN location l ON o.location_id = l.location_id;


select * from healthcare_provider


-- Load data into dimension_healthcare_provider from the healthcare_provider table
INSERT INTO disease_outbreak_dw.dimension_healthcare_provider (provider_id, provider_specialty, contact_information)
SELECT provider_id, provider_speciality, contact_information
FROM healthcare_provider;

-- Load data into dimension_patient from the patient table
INSERT INTO disease_outbreak_dw.dimension_patient (patient_id, patient_name, age, gender_code, symptom_severity)
SELECT patient_id, patient_name, age, gender_code, symptom_severity
FROM patient;

-- Load data into dimension_outbreak from the outbreak table
INSERT INTO disease_outbreak_dw.dimension_outbreak (outbreak_id, start_date, end_date, severity_level)
SELECT outbreak_id, start_date, end_date, severity_level
FROM outbreak;



-- Inserting into fact_outbreak with patient counts and treatment counts
INSERT INTO disease_outbreak_dw.fact_outbreak (outbreak_id, disease_id, location_id, patient_count, severity_level, treatment_count, date_id)
SELECT 
    o.outbreak_id,
    o.disease_id,
    o.location_id,
    COUNT(po.patient_id) AS patient_count,   -- Count of patients per outbreak
    o.severity_level,                         -- Severity level from outbreak
    COUNT(po.patient_id) AS treatment_count,  -- Assuming treatment_count is equivalent to patient_count for simplicity
    d.date_id                                 -- Date ID from the dimension_date table for the start_date of the outbreak
FROM outbreak o
JOIN patient_outbreak po ON o.outbreak_id = po.outbreak_id  -- Joining patient_outbreak to get patient counts
JOIN disease_outbreak_dw.dimension_date d ON d.year = EXTRACT(YEAR FROM o.start_date)  -- Matching year from outbreak to year in the date dimension
GROUP BY o.outbreak_id, o.disease_id, o.location_id, o.severity_level, d.date_id;

-- Check the structure of the dimension_date table
select * from outbreak;
select * from location;

UPDATE outbreak
SET location_id =   'L102'  -- Update to a valid location_id
WHERE location_id = 'L100';  -- Replace 'L137' with the invalid location_id


select * from disease_outbreak_dw.fact_outbreak