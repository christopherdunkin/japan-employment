-- Inspect all of the data:
SELECT *
FROM employment;

-- Calculate the labour force participation rates for each year:
WITH in_data AS (
    SELECT year_of_survey, male AS male_in, female AS female_in, male + female AS in_lf
    FROM employment
    WHERE employment_status = 'in labour force'
),
not_data AS (
    SELECT year_of_survey, male AS male_not, female AS female_not, male + female AS not_lf
    FROM employment
    WHERE employment_status = 'not in labour force'
),
unknown_data AS (
    SELECT year_of_survey, male AS male_unknown, female AS female_unknown, male + female AS unknown_lf
    FROM employment
    WHERE employment_status = 'labour force status unknown'
)
SELECT i.year_of_survey,
    ROUND(male_in/(male_in + male_not + male_unknown) * 100, 2) AS male_labour_force_participation_rate,
    ROUND(female_in/(female_in + female_not + female_unknown) * 100, 2) AS female_labour_force_participation_rate,
    ROUND(in_lf/(in_lf + not_lf + unknown_lf) * 100, 2) AS labour_force_participation_rate
FROM in_data AS i
INNER JOIN not_data AS n
    ON i.year_of_survey = n.year_of_survey
INNER JOIN unknown_data AS u
    ON n.year_of_survey = u.year_of_survey;

-- Calculate the unemployment rates for each year:
WITH employed_data AS (
    SELECT year_of_survey, male AS male_employed, female AS female_employed, male + female AS employed
    FROM employment
    WHERE employment_status = 'employed'
),
unemployed_data AS (
    SELECT year_of_survey, male AS male_unemployed, female AS female_unemployed, male + female AS unemployed
    FROM employment
    WHERE employment_status = 'unemployed'
)
SELECT e.year_of_survey, 
    ROUND(male_unemployed/(male_unemployed + male_employed) * 100, 2) AS male_unemployment_rate,
    ROUND(female_unemployed/(female_unemployed + female_employed) * 100, 2) AS female_unemployment_rate,
    ROUND(unemployed/(unemployed + employed) * 100, 2) AS unemployment_rate
FROM employed_data AS e
INNER JOIN unemployed_data AS u
    ON e.year_of_survey = u.year_of_survey;
    
-- Retrieve data on men and women in all types of non-regular employment for each year:
SELECT *, male + female AS people
FROM employment
WHERE employment_status IN ('part-time worker', 'temporary worker', 'dispatched worker', 'contract employee', 'entrusted employee', 'other non-regular employee');
