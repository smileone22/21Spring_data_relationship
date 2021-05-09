## part3-3 Exploring the Data


1. Shows that report_id is not unique.
``` 
 count | count 
-------+-------
 34123 | 50440
(1 row)
```

2. There are many different products in one product code. Thus, we cannot know product_code from product.  
```
 product_code | count 
--------------+-------
 12           |   104
 13           |   225
 14           |    53
 15           |    40
 16           |   340
 17           |    65
 18           |    19
 2            |    96
 20           |   214
 21           |   188
 22           |    45
 23           |   440
 24           |   307
 ...
```

3. For age_units, ages are not only described as years but also other units including, months, days.. etc

```
  age_units 
  -----------
  week(s)
  Decade(s)
  year(s)

  day(s)
  month(s)
```

4. Below output is partial from output table. However, from the full output table, we can notice that description comes from product_code. In other words, description depends on the product_code. 
```
product_code |                  description                  
--------------+-----------------------------------------------
 23           |  Nuts/Edible Seed
 23           |  Nuts/Edible Seed
 5            | Cereal Prep/Breakfast Food
 9            | Milk/Butter/Dried Milk Prod
 16           | Fishery/Seafood Prod
 20           | Fruit/Fruit Prod
 3            |  Bakery Prod/Dough/Mix/Icing
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 54           |  Vit/Min/Prot/Unconv Diet(Human/Animal)
 ```

 5. product_type does not rely on product. Even though it is the same product, it may have different product_type.
 ```
 product_type | product  
--------------+----------
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 CONCOMITANT  | FISH OIL
 SUSPECT      | FISH OIL
 SUSPECT      | FISH OIL
 ```


 6. outcomes and medra_terms depend on report_id. 
 ```
 report_id    |                                                       outcomes                                                       |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         medra_terms                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
-----------------+----------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 172947          | Medically Important,                                                                                                 | FOREIGN BODY TRAUMA, CHOKING
 172947          | Medically Important,                                                                                                 | FOREIGN BODY TRAUMA, CHOKING
 172947          | Medically Important,                                                                                                 | FOREIGN BODY TRAUMA, CHOKING
 172964          | Hospitalization,                                                                                                     | DIZZINESS, TREMOR, DEPRESSED MOOD, ANXIETY
 172964          | Hospitalization,                                                                                                     | DIZZINESS, TREMOR, DEPRESSED MOOD, ANXIETY
 172967          | Disability, Patient Visited Healthcare Provider,                                                                     | VOMITING, ABDOMINAL DISCOMFORT
 172967          | Disability, Patient Visited Healthcare Provider,                                                                     | VOMITING, ABDOMINAL DISCOMFORT
 172969          | Disability, Patient Visited Healthcare Provider,                                                                     | ABDOMINAL DISCOMFORT, VOMITING
 172969          | Disability, Patient Visited Healthcare Provider,                                                                     | ABDOMINAL DISCOMFORT, VOMITING
 172980          | Medically Important, Patient Visited ER,                                                                             | PHARYNGEAL OEDEMA, HYPERSENSITIVITY, DYSPNOEA, RASH, PARAESTHESIA, SWELLING, DIZZINESS, FACE OEDEMA
 172980          | Medically Important, Patient Visited ER,                                                                             | PHARYNGEAL OEDEMA, HYPERSENSITIVITY, DYSPNOEA, RASH, PARAESTHESIA, SWELLING, DIZZINESS, FACE OEDEMA
 172980          | Medically Important, Patient Visited ER,                                                                             | PHARYNGEAL OEDEMA, HYPERSENSITIVITY, DYSPNOEA, RASH, PARAESTHESIA, SWELLING, DIZZINESS, FACE OEDEMA
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173015          | Disability, Patient Visited Healthcare Provider,                                                                     | HYPERSOMNIA, AMNESIA, HALLUCINATION, CONFUSIONAL STATE, INCONTINENCE, ACTIVITIES OF DAILY LIVING IMPAIRED, CRYING, ABNORMAL BEHAVIOUR, RESTLESSNESS
 173018          | Medically Important,                                                                                                 | BONE DISORDER, MUSCLE SPASMS, DRUG INEFFECTIVE, INCORRECT DOSE ADMINISTERED, FOOT DEFORMITY, OVERDOSE, ABASIA
 173018          | Medically Important,                                                                                                 | BONE DISORDER, MUSCLE SPASMS, DRUG INEFFECTIVE, INCORRECT DOSE ADMINISTERED, FOOT DEFORMITY, OVERDOSE, ABASIA
 173030          | Medically Important,                                                                                                 | BLOOD GLUCOSE FLUCTUATION, WRONG TECHNIQUE IN DRUG USAGE PROCESS
 173030          | Medically Important,                                                                                                 | BLOOD GLUCOSE FLUCTUATION, WRONG TECHNIQUE IN DRUG USAGE PROCESS
 173062          | Medically Important, Patient Visited ER,                                                                             | DIZZINESS, DIARRHOEA, HEART RATE INCREASED, TREMOR, NAUSEA, HYPERSENSITIVITY
 173062          | Medically Important, Patient Visited ER,                                                                             | DIZZINESS, DIARRHOEA, HEART RATE INCREASED, TREMOR, NAUSEA, HYPERSENSITIVITY
 173066          | Medically Important,                                                                                                 | CONFUSIONAL STATE, COMPULSIONS, BLOOD GLUCOSE INCREASED, AGITATION, NIGHTMARE, HEADACHE, INCREASED APPETITE
 173066          | Medically Important,                                                                                                 | CONFUSIONAL STATE, COMPULSIONS, BLOOD GLUCOSE INCREASED, AGITATION, NIGHTMARE, HEADACHE, INCREASED APPETITE
 173067          | Other Outcome                                                                                                        | CHOKING
 173067          | Other Outcome                                            
 ```

 7. Age and Sex depend on report_id 
```
    report_id    | patient_age | sex 
-----------------+-------------+-----
 172947          |          64 | F
 172947          |          64 | F
 172947          |          64 | F
 172964          |             | 
 172964          |             | 
 172967          |           4 | 
 172967          |           4 | 
 172969          |             | 
 172969          |             | 
 172980          |          21 | M
 172980          |          21 | M
 172980          |          21 | M
 173015          |          79 | M
 173015          |          79 | M
 173015          |          79 | M
 173015          |          79 | M
 173015          |          79 | M
 173015          |          79 | M
 173015          |          79 | M
 173015          |          79 | M
 173015          |          79 | M
 173015          |          79 | M
 173015          |          79 | M
 173018          |          71 | F
 173018          |          71 | F
 173030          |          47 | F
 173030          |          47 | F
 173062          |          50 | F
 173062          |          50 | F
 173066          |          94 | F
 173066          |          94 | F
 173067          |          71 | F
 173067          |          71 | F
```