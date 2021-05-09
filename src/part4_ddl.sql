DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS outcome_list;
DROP TABLE IF EXISTS event_outcome;
DROP TABLE IF EXISTS symptoms_terms;
DROP TABLE IF EXISTS symptoms;
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_info;


CREATE TABLE product_info(
  product_code TEXT,
  description TEXT,
  PRIMARY KEY (product_code) 
);


CREATE TABLE products(
  product_id SERIAL,
  product TEXT,
  product_type TEXT,
  product_code TEXT,
  PRIMARY KEY (product_id) ,
  CONSTRAINT product_code FOREIGN KEY (product_code) REFERENCES product_info (product_code)
);

CREATE TABLE patient (
  report_id TEXT,
  patient_age NUMERIC,
  age_units TEXT,
  SEX VARCHAR(2),
  PRIMARY KEY (report_id)
) ;

CREATE TABLE symptoms (
  report_id TEXT,
  symptom_id SERIAL,
  PRIMARY KEY(report_id)
) ;


CREATE TABLE symptoms_terms (
  symptom_id NUMERIC,
  terms TEXT
) ;



CREATE TABLE event_outcome (
  caers_event_id NUMERIC,
  outcome_id SERIAL UNIQUE,
  PRIMARY KEY(caers_event_id)
) ;


CREATE TABLE outcome_list (
  outcome_id SERIAL,
  outcomes TEXT,
  CONSTRAINT outcome_fk FOREIGN KEY (outcome_id) REFERENCES event_outcome(outcome_id)
) ;


CREATE TABLE event (
  caers_event_id SERIAL UNIQUE,
  report_id TEXT,
  created_date DATE,
  event_date DATE,
  product_id SERIAL,
  PRIMARY KEY (caers_event_id) ,
  CONSTRAINT product_id_fk FOREIGN KEY (product_id) REFERENCES products (product_id),
  CONSTRAINT report_id_fk FOREIGN KEY (report_id) REFERENCES patient (report_id),
  CONSTRAINT caers_event_id_fk FOREIGN KEY (caers_event_id) REFERENCES event_outcome (caers_event_id)
) ;











