
-- accounts table
CREATE TABLE public.accounts (
    id integer PRIMARY KEY,
    name varchar(255),
    website varchar(255),
    lat numeric(11,8),
    long numeric(11,8),
    primary_poc varchar(255),
    sales_rep_id integer);
	

ALTER TABLE public.accounts OWNER TO airflow;

-- region table
CREATE TABLE public.region (
    id integer PRIMARY KEY,
    name varchar(255)
);

ALTER TABLE public.region OWNER TO airflow;

-- sales_reps table
CREATE TABLE public.sales_reps (
    id integer PRIMARY KEY,
    name varchar(255),
    region_id integer
);

ALTER TABLE public.sales_reps OWNER TO airflow;

-- web_events table
CREATE TABLE public.web_events (
    id integer PRIMARY KEY,
    account_id integer,
    occurred_at timestamp without time zone,
    channel varchar(50)
);

ALTER TABLE public.web_events OWNER TO airflow;

-- orders table
CREATE TABLE public.orders (
    id integer PRIMARY KEY,
    account_id integer,
    occurred_at timestamp without time zone,
    standard_qty integer,
    gloss_qty integer,
    poster_qty integer,
    total integer,
    standard_amt_usd numeric(10,2),
    gloss_amt_usd numeric(10,2),
    poster_amt_usd numeric(10,2),
    total_amt_usd numeric(10,2)
);

ALTER TABLE public.orders OWNER TO airflow;



