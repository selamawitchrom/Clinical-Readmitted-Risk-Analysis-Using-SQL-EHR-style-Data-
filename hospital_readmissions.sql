
select * from dbo.hospital_readmissions

--- Data Quality Assesment 

select 
SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END ) as missing_age,
SUM (CASE WHEN medication_count IS NULL THEN 1 ELSE 0 END) as missing_med,
SUM(CASE WHEN length_of_stay IS NULL THEN 1 ELSE 0 END ) As missing_los,
SUM (CASE WHEN readmitted_30_days is null THEN 1 ELSE 0 END ) as missing_readmitted
from hospital_readmissions;

----- Readmission Rate
select 
round(avg(cast(readmitted_30_days as float)) * 100, 2) as readmission_rate
from hospital_readmissions


---Length of Stay vs readmitted

select readmitted_30_days,
AVG(medication_count) as avg_meds,
avg(length_of_stay) as length_in_hospital
from dbo.hospital_readmissions
group by readmitted_30_days

----discharge destination analysis---- discharge planning & care transition 
--- which discharge destination have the highest 30days readmission

select discharge_destination, 
  count(*) as total_discharge,
  Round(avg(cast(readmitted_30_days as float)) * 100,2 ) as readmission_rate
from hospital_readmissions
group by discharge_destination
order by readmission_rate desc;


---- Medication Reconcilation Analyst---

With med_group as (
     select readmitted_30_days,
case 
     When medication_count < 5 Then 'Low'
     When medication_count Between 5 AND 8 Then 'Medium'
     else 'High (9+)'
 end as med_group
 from hospital_readmissions)
select med_group, 
 count(*) as total_patients, 
 Round(avg(cast(readmitted_30_days as float)) * 100,2) as readmission_rate
  from med_group
  group by med_group;


   --- Risk Factors to Identify Patient High Risk----

   select patient_id,
   (case when medication_count > 5 then 1 else 0 end +
   case when length_of_stay > 5 then 1 else 0 end +
    case when age > 67 then 1 else 0 end +
    case when discharge_destination <> 'Home' then 1 else 0 end ) as risk_score, readmitted_30_days
    from hospital_readmissions
    order by risk_score

    ----- Which Age Group Has The Highest Readmission----?

select 
  case 
    when age < 40 then 'under 40 '
    when age BETWEEN 45 and 60 THEN '45-60'
    else '60+'
  end as age_group, 
 Count(*) as total_patients 
from hospital_readmissions
 group by 
  case 
      when age <40 then 'under 40 '
      when age BETWEEN 45 and 60 THEN '45-60'
  else '60+'
  end
    order by age_group 

    ---------Identified Patiensts with Long Stays and High Medication Burdn Who Were not Readmiitted

  select top 20 patient_id, age, medication_count, discharge_destination
  from hospital_readmissions
  where length_of_stay >=7 AND medication_count >= 10 
  AND readmitted_30_days =0;

  ----
  select discharge_destination, count(*) as record_count
  from hospital_readmissions
  group by discharge_destination
  order by record_count desc

  ---High Risk Potential List 

  select patient_id, age, medication_count, discharge_destination
  from hospital_readmissions
  where age >= 65
  AND medication_count >= 10
  AND discharge_destination <> 'Home'

  ---- Compare Readmission Rate by Individual Condition

  select 
  'hypertension' as condition,
  round(avg(cast(readmitted_30_days as float)) * 100,2) as readmission_rate
  from hospital_readmissions
  where hypertension= 1

  UNION ALL 

  select 'diabetes', 
  round(AVG(CASt(readmitted_30_days as float)) * 100,2) as readmission_rate
  from hospital_readmissions
  where diabetes = 1
  UNION ALL

  select 'cholesterol', 
  round(AVG(CASt(readmitted_30_days as float)) * 100,2) as readmission_rate
  from hospital_readmissions
  where cholesterol = 1


  