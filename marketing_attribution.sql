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

-- What is the user journey?
-- #3 the number of  first touches is each campaign
WITH
    first_touch AS (
        SELECT
            user_id,
            MIN(timestamp) as first_touch_at
        FROM
            page_visits
        GROUP BY
            user_id
    ),
    ft_attr AS (
        SELECT
            ft.user_id,
            ft.first_touch_at,
            pv.utm_source,
            pv.utm_campaign
        FROM
            first_touch AS 'ft'
            JOIN page_visits AS 'pv' ON ft.user_id = pv.user_id
            AND ft.first_touch_at = pv.timestamp
    )
SELECT
    ft_attr.utm_source,
    ft_attr.utm_campaign,
    COUNT(*)
FROM
    ft_attr
GROUP BY
    1,
    2
ORDER BY
    3 DESC;

-- #4 the number of last touches is each campaign
WITH
    last_touch AS (
        SELECT
            user_id,
            MAX(timestamp) AS 'last_touch_at'
        FROM
            page_visits
        GROUP BY
            1
    ),
    lt_atrr AS (
        SELECT
            lt.user_id,
            lt.last_touch_at,
            pv.utm_campaign,
            pv.utm_source,
            pv.page_name
        FROM
            last_touch AS 'lt'
            JOIN page_visits AS 'pv' ON lt.user_id = pv.user_id
            AND lt.last_touch_at = pv.timestamp
    )
SELECT
    lt_atrr.utm_campaign,
    lt_atrr.utm_source,
    COUNT(*)
FROM
    lt_atrr
GROUP BY
    1,
    2
ORDER BY
    3 DESC;

-- #5 count visitors making a purchase
SELECT
    COUNT(DISTINCT (user_id)) AS 'count_purchase'
FROM
    page_visits
WHERE
    page_name = '4 - purchase';