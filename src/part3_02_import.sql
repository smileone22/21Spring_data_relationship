copy staging_caers_events (
	report_id, CAERS_created_date, date_of_event,
	product_type, product, product_code,
	description, patient_age, age_units,
	sex, medra_terms, outcomes)
    from '/Users/heewon/Documents/GitHub/jjanggu25-homework07/data/CAERS_ASCII_11_14_to_12_17.csv'
    (format csv, header, encoding 'LATIN1');

