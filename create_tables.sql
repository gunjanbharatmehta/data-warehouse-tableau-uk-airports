CREATE TABLE airline_dim
(
    airline_id	NUMBER(5) PRIMARY KEY,
    airline_name VARCHAR2(100) NOT NULL
)

CREATE TABLE airline_type_dim
(
    airline_type_id	NUMBER(5) PRIMARY KEY,
    scheduled_charter VARCHAR2(100) NOT NULL
)

CREATE TABLE airport_dim
(
    airport_id	NUMBER(5) PRIMARY KEY,
    reporting_airport VARCHAR2(100) NOT NULL
)

CREATE TABLE country_dim
(
    origin_destination_country_id NUMBER(5) PRIMARY KEY,
    origin_destination_country VARCHAR2(100) NOT NULL
)

CREATE TABLE city_dim
(
    origin_destination_city_id	NUMBER(5) PRIMARY KEY,
    origin_destination VARCHAR2(100) NOT NULL,
)

CREATE TABLE period_dim
(
    period_id NUMBER(5) PRIMARY KEY,
    reporting_period_month VARCHAR2(100) NOT NULL,
reporting_period_year NUMBER(5) NOT NULL
)

CREATE TABLE FACT_TABLE
(
    period_id	NUMBER(5) NOT NULL,
    airport_id	NUMBER(5) NOT NULL,
    origin_destination_country_id	NUMBER(5) NOT NULL,
    origin_destination_city_id	NUMBER(5) NOT NULL,
    airline_id	NUMBER(5) NOT NULL,
    airline_type_id	NUMBER(5) NOT NULL,
    number_flights_matched	NUMBER(5) NOT NULL,
    actual_flights_unmatched	NUMBER(5) NOT NULL,
    number_flights_cancelled	NUMBER(5) NOT NULL,
    flights_more_than_15_minutes_early_percent	NUMBER(5) NOT NULL,
    flights_15_minutes_early_to_1_minute_early_percent	NUMBER(5) NOT NULL,
    flights_0_to_15_minutes_late_percent	NUMBER(5) NOT NULL,
    flights_between_16_and_30_minutes_late_percent	NUMBER(5) NOT NULL,
    flights_between_31_and_60_minutes_late_percent	NUMBER(5) NOT NULL,
    flights_between_61_and_120_minutes_late_percent	NUMBER(5) NOT NULL,
    flights_between_121_and_180_minutes_late_percent	NUMBER(5) NOT NULL,
    flights_between_181_and_360_minutes_late_percent	NUMBER(5) NOT NULL,
    flights_more_than_360_minutes_late_percent	NUMBER(5) NOT NULL,
    flights_unmatched_percent	NUMBER(5) NOT NULL,
    flights_cancelled_percent	NUMBER(5) NOT NULL,
    average_delay_mins	NUMBER(5) NOT NULL,
    previous_year_month_flights_matched	NUMBER(5) NOT NULL,
    previous_year_month_early_to_15_mins_late_percent	NUMBER(5) NOT NULL,
    previous_year_month_average_delay NUMBER(5) NOT NULL,
    FOREIGN KEY (period_id) REFERENCES period_dim(period_id),
    FOREIGN KEY (airport_id) REFERENCES airport_dim(airport_id),
    FOREIGN KEY (origin_destination_country_id) REFERENCES country_dim(origin_destination_country_id),
    FOREIGN KEY (origin_destination_city_id) REFERENCES city_dim(origin_destination_city_id),
    FOREIGN KEY (airline_id) REFERENCES airline_dim(airline_id),
    FOREIGN KEY (airline_type_) REFERENCES airline_type_dim(airline_type_id)
)
