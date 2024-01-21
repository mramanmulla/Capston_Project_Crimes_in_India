select * from crimes_against_women;

--Write SQL Query to find higest number of rapes and kidnapping happend in which state, district and year--

select STATE_UT, DISTRICT, Year,Rape,Kidnapping_and_Abduction,SUM(Rape + Kidnapping_and_Abduction) as total_cases from crimes_against_women
where DISTRICT != 'TOTAL' and DISTRICT !='DELHI UT TOTAL'
group by STATE_UT, DISTRICT, Year,Rape,Kidnapping_and_Abduction
order by total_cases desc;

--Write SQL Query to find all lowest number of rapes and kidnapping in which state, disrict and year--

select STATE_UT, DISTRICT, Year,Rape,Kidnapping_and_Abduction,SUM(Rape + Kidnapping_and_Abduction) as total_cases from crimes_against_women
where DISTRICT != 'TOTAL' and DISTRICT !='DELHI UT TOTAL' and Rape = (SELECT MIN(Rape) from crimes_against_women) 
and Kidnapping_and_Abduction = (SELECT MIN(Kidnapping_and_Abduction) from crimes_against_women) 
group by STATE_UT, DISTRICT, Year,Rape,Kidnapping_and_Abduction
order by total_cases;


--3.4--

select * from District_wise_crimes;

--3.5 Write SQL Query to find highest number of dacoity/robbery in which district

select district,Dacoity, Robbery, SUM(Dacoity+Robbery) as total_cases from District_wise_crimes
where district != 'TOTAL'
group by Dacoity,Robbery,district,Year
order by total_cases desc;

--3.6 Write SQL Query to find in which district lowest murderds happend

select district, Murder from District_wise_crimes
where district != 'TOTAL'
group by district,Murder
order by Murder

--3.7 Write SQL Query to find number of murders in ascending order in district and yearwise

SELECT
    DISTRICT,
    Year,
    Murder
FROM
    District_wise_crimes
ORDER BY
    DISTRICT ASC, Year ASC, Murder ASC;

--3.8 STATE/UT, DISTRICT,YEAR,MURDER,ATTEMPED TO MURDER and RAPE--

select * from IPC_2001_2012;

--Write SQL query to find which district in each state/UT has higest murder yearwise. output 
--should show STATE/UT, DISTRICT,YEAR,MURDER--

select STATE_UT, DISTRICT,YEAR,MAX(Murder) as Murder_cases from IPC_2001_2012
where district != 'TOTAL' and DISTRICT !='DELHI UT TOTAL'
group by YEAR,STATE_UT,DISTRICT
order by YEAR , Murder_cases desc