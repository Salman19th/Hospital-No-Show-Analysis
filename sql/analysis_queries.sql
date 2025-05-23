CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

CREATE TABLE hospital_appointments (
    patientid VARCHAR(50),
    appointmentid VARCHAR(50),
    gender VARCHAR(10),
    scheduledday DATETIME,
    appointmentday DATETIME,
    age INT,
    neighbourhood VARCHAR(100),
    scholarship TINYINT,
    hypertension TINYINT,
    diabetes TINYINT,
    alcoholism TINYINT,
    handicap TINYINT,
    sms_received TINYINT,
    no_show_status VARCHAR(5),
    appointment_day DATE,
    appointment_weekday VARCHAR(15),
    appointment_month VARCHAR(15),
    appointment_year INT,
    age_flag VARCHAR(20),
    lead_time INT,
    age_group VARCHAR(30)
);


SELECT * FROM hospital_appointments;

-- Average Lead Time by No-show Status
SELECT 
  no_show_status,
  ROUND(AVG(lead_time), 2) AS avg_lead_days
FROM hospital_appointments
GROUP BY no_show_status;


-- No-show Rate by SMS Reminder
SELECT 
    sms_received,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN no_show_status = 'Yes' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(SUM(CASE WHEN no_show_status = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate
FROM hospital_appointments
GROUP BY sms_received;


--  No-show Rate by Age Group and Gender
SELECT 
    age_group,
    gender,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN no_show_status = 'Yes' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(SUM(CASE WHEN no_show_status = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS no_show_rate
FROM hospital_appointments
GROUP BY age_group, gender
ORDER BY age_group, gender;









