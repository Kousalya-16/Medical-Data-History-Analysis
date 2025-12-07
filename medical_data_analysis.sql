
-- Medical Data History Analysis
-- Database: project_medical_data_history
-- Description: Analysis of patients, admissions, diagnoses, and demographics


Use project_medical_data_history;
select * from admissions;
select * from doctors;
select * from patients;
select * from province_names;

select first_name, last_name, gender from patients where gender = 'M';
select first_name, last_name from patients where allergies is null;
select first_name from patients where first_name like 'c%';
select first_name, last_name from patients where weight between 100 and 120;
SELECT allergies, CASE WHEN allergies IS NULL THEN 'NKA' ELSE allergies END AS allergies FROM patients;
select concat(first_name, ' ', last_name) as full_name, first_name, last_name from patients;
select p.first_name, p.last_name, pr.province_name as full_province_name from patients p join province_names pr on p.province_id = pr.province_id;
select count(*) as total_patients from patients where year(birth_date) = 2010;
select * from patients where year(birth_date) = 2010;
select first_name, last_name, height from patients order by height desc limit 1;
select * from patients where patient_id in (1, 45, 534, 879, 1000);
select count(*) as total_admissions from admissions;
select * from admissions where admission_date = discharge_date;
select count(*) as total_admissions from admissions where patient_id = 579;
select distinct city from patients where province_id = 'NS';
select first_name, last_name, birth_date from patients where height > 160 and weight > 70;
select distinct year(birth_date) as birth_year from patients order by birth_year asc;
select first_name from patients group by first_name having count(*)=1;
select patient_id, first_name from patients where first_name like 's____%s';
select p.patient_id, p.first_name, p.last_name from patients p join admissions a on p.patient_id = a.patient_id where a.diagnosis = 'dementia';
select first_name from patients order by length(first_name) asc, first_name asc;
select count(case when gender = 'M' then 1 end) as total_male_patients, count(case when gender = 'F' then 1 end) as total_female_patients from patients;
select count(*) as No_of_times_admitted, patient_id, diagnosis from admissions group by patient_id, diagnosis having count(*) > 1;
select city, count(*) as total_patients from patients group by city order by total_patients desc, city asc;
select first_name, last_name, 'Patient' as Role from patients UNION ALL select first_name, last_name, 'Doctor' as role from doctors;
select allergies, count(*) as popularity from patients where allergies is not null group by allergies order by popularity desc;
select first_name, last_name, birth_date from patients where birth_date between '1970-01-01' and '1970-12-31' order by birth_date asc;
select concat(upper(last_name), ',', lower(first_name)) as full_name from patients order by first_name desc;
select province_id, sum(height) as total_height from patients group by province_id having sum(height)>=7000;
select max(weight) - min(weight) as weight_diff from patients where last_name = 'Maroni';
select day(admission_date) as day_of_month, count(*) as admission_count from admissions group by day_of_month order by admission_count desc;
select floor((weight/10)*10) as weight_group, count(*) as total_patients from patients group by weight_group order by weight_group desc;
select patient_id, weight, height, case when (weight / (height/100 * height/100))>=30 then 1 else 0 end as isobese from patients;
select p.patient_id, p.first_name, p.last_name, d.specialty from patients p join (select patient_id, attending_doctor_id as doctor_id, diagnosis from admissions) a on p.patient_id = a.patient_id join doctors d on a.doctor_id = d.doctor_id where a.diagnosis = 'Epilepsy'and d.first_name = 'Lisa';
select p.patient_id, concat(p.patient_id, length(p.last_name), year(p.birth_date)) as temp_password from patients p join admissions a on a.patient_id = p.patient_id group by p.patient_id, p.last_name, p.birth_date;

