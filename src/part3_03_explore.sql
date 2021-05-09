


-- 1. This query shows whether or not report id is unique
SELECT count( distinct report_id) , count(*)
FROM staging_caers_events;

--  count | count 
-- -------+-------
--  34123 | 50440

-- 2. This query shows that there could be different products in one product_code 
SELECT product_code, count(distinct product)
FROM staging_caers_events
GROUP BY product_code;

--  product_code | count 
-- --------------+-------
--  12           |   104
--  13           |   225
--  14           |    53
--  15           |    40
--  16           |   340
--  17           |    65
--  18           |    19
--  2            |    96
--  20           |   214
--  21           |   188
--  22           |    45
--  23           |   440
--  24           |   307

--3. This query shows values available for age_units 
SELECT DISTINCT age_units FROM staging_caers_events;
--  age_units 
-- -----------
--  week(s)
--  Decade(s)
--  year(s)
 
--  day(s)
--  month(s)


--4. This query tries to see the relationship between product_code and description
select product_code, description from staging_caers_events;
-- product_code |                  description                  
-- --------------+-----------------------------------------------
--  23           |  Nuts/Edible Seed
--  23           |  Nuts/Edible Seed
--  5            | Cereal Prep/Breakfast Food
--  9            | Milk/Butter/Dried Milk Prod
--  16           | Fishery/Seafood Prod
--  20           | Fruit/Fruit Prod
--  3            |  Bakery Prod/Dough/Mix/Icing
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
--  54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)

-- 5. See if product_type relies on product 
SELECT product_type,product 
FROM staging_caers_events 
WHERE product='FISH OIL';
-- product_type | product  
-- --------------+----------
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  CONCOMITANT  | FISH OIL
--  SUSPECT      | FISH OIL
--  SUSPECT      | FISH OIL


--6. See relationship between report_id, outcomes and medra_terms
SELECT sce.report_id,outcomes,medra_terms FROM staging_caers_events sce
INNER JOIN (
SELECT report_id, count(report_id) 
FROM staging_caers_events
GROUP BY report_id
HAVING count(report_id) >1 ) tmp on tmp.report_id= sce.report_id;

-- report_id    |                                                       outcomes                                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         medra_terms                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
-- -----------------+----------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  172947          | Medically Important,                                                                                                 | FOREIGN BODY TRAUMA, CHOKING
--  172947          | Medically Important,                                                                                                 | FOREIGN BODY TRAUMA, CHOKING
--  172947          | Medically Important,                                                                                                 | FOREIGN BODY TRAUMA, CHOKING
--  172964          | Hospitalization,                                                                                                     | DIZZINESS, TREMOR, DEPRESSED MOOD, ANXIETY
--  172964          | Hospitalization,                                                                                                     | DIZZINESS, TREMOR, DEPRESSED MOOD, ANXIETY
--  172967          | Disability, Patient Visited Healthcare Provider,                                                                     | VOMITING, ABDOMINAL DISCOMFORT
--  172967          | Disability, Patient Visited Healthcare Provider,                                                                     | VOMITING, ABDOMINAL DISCOMFORT
--  172969          | Disability, Patient Visited Healthcare Provider,                                                                     | ABDOMINAL DISCOMFORT, VOMITING
--  172969          | Disability, Patient Visited Healthcare Provider,                                                                     | ABDOMINAL DISCOMFORT, VOMITING
--  172980          | Medically Important, Patient Visited ER,                                                                             | PHARYNGEAL OEDEMA, HYPERSENSITIVITY, DYSPNOEA, RASH, PARAESTHESIA, SWELLING, DIZZINESS, FACE OEDEMA
--  172980          | Medically Important, Patient Visited ER,                                                                             | PHARYNGEAL OEDEMA, HYPERSENSITIVITY, DYSPNOEA, RASH, PARAESTHESIA, SWELLING, DIZZINESS, FACE OEDEMA
--  172980          | Medically Important, Patient Visited ER,                                                                             | PHARYNGEAL OEDEMA, HYPERSENSITIVITY, DYSPNOEA, RASH, PARAESTHESIA, SWELLING, DIZZINESS, FACE OEDEMA
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
--  173018          | Medically Important,                                                                                                 | BONE DISORDER, MUSCLE SPASMS, DRUG INEFFECTIVE, INCORRECT DOSE ADMINISTERED, FOOT DEFORMITY, OVERDOSE, ABASIA
--  173018          | Medically Important,                                                                                                 | BONE DISORDER, MUSCLE SPASMS, DRUG INEFFECTIVE, INCORRECT DOSE ADMINISTERED, FOOT DEFORMITY, OVERDOSE, ABASIA
--  173030          | Medically Important,                                                                                                 | BLOOD GLUCOSE FLUCTUATION, WRONG TECHNIQUE IN DRUG USAGE PROCESS
--  173030          | Medically Important,                                                                                                 | BLOOD GLUCOSE FLUCTUATION, WRONG TECHNIQUE IN DRUG USAGE PROCESS
--  173062          | Medically Important, Patient Visited ER,                                                                             | DIZZINESS, DIARRHOEA, HEART RATE INCREASED, TREMOR, NAUSEA, HYPERSENSITIVITY
--  173062          | Medically Important, Patient Visited ER,                                                                             | DIZZINESS, DIARRHOEA, HEART RATE INCREASED, TREMOR, NAUSEA, HYPERSENSITIVITY
--  173066          | Medically Important,                                                                                                 | CONFUSIONAL STATE, COMPULSIONS, BLOOD GLUCOSE INCREASED, AGITATION, NIGHTMARE, HEADACHE, INCREASED APPETITE
--  173066          | Medically Important,                                                                                                 | CONFUSIONAL STATE, COMPULSIONS, BLOOD GLUCOSE INCREASED, AGITATION, NIGHTMARE, HEADACHE, INCREASED APPETITE
--  173067          | Other Outcome                                                                                                        | CHOKING
--  173067          | Other Outcome                                            

--7. See patient_age and sex from duplicating report_id 

SELECT sce.report_id,patient_age,sex FROM staging_caers_events sce
INNER JOIN (
SELECT report_id, count(report_id) 
FROM staging_caers_events
GROUP BY report_id
HAVING count(report_id) >1 ) tmp on tmp.report_id= sce.report_id;
--     report_id    | patient_age | sex 
-- -----------------+-------------+-----
--  172947          |          64 | F
--  172947          |          64 | F
--  172947          |          64 | F
--  172964          |             | 
--  172964          |             | 
--  172967          |           4 | 
--  172967          |           4 | 
--  172969          |             | 
--  172969          |             | 
--  172980          |          21 | M
--  172980          |          21 | M
--  172980          |          21 | M
--  173015          |          79 | M
--  173015          |          79 | M
--  173015          |          79 | M
--  173015          |          79 | M
--  173015          |          79 | M
--  173015          |          79 | M
--  173015          |          79 | M
--  173015          |          79 | M
--  173015          |          79 | M
--  173015          |          79 | M
--  173015          |          79 | M
--  173018          |          71 | F
--  173018          |          71 | F
--  173030          |          47 | F
--  173030          |          47 | F
--  173062          |          50 | F
--  173062          |          50 | F
--  173066          |          94 | F
--  173066          |          94 | F
--  173067          |          71 | F
--  173067          |          71 | F




SELECT sce.report_id,count(distinct product_code) as counts FROM staging_caers_events sce
INNER JOIN (
SELECT report_id, count(report_id) 
FROM staging_caers_events
GROUP BY report_id
HAVING count(report_id) >1 ) tmp on tmp.report_id= sce.report_id
GROUP BY sce.report_id
having count(distinct product_code) >1
order by counts desc;