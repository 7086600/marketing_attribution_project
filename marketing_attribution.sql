-- #1 How many campaigns and sources does CoolTShirts use? Which source is used for each campaign?
SELECT
    *
FROM
    page_visits
LIMIT
    100;

-- inspectin the data
SELECT
    *
FROM
    page_visits
LIMIT
    3;

-- the number of distinct campaigns
SELECT
    COUNT(DISTINCT (utm_campaign)) AS 'count_campaigns'
FROM
    page_visits;

-- the number of distinct sources
SELECT
    COUNT(DISTINCT (utm_source)) AS 'count_sources'
FROM
    page_visits;

-- relation between campaigns and sources
SELECT DISTINCT
    utm_campaign,
    utm_source
FROM
    page_visits;

-- #2 What pages are on the CoolTShirts website
SELECT DISTINCT
    (page_name)
FROM
    page_visits;