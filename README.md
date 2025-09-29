# Marketing Attribution
***

## Overview
CoolTShirts sells shirts of all kinds, as long as they are T-shaped and cool. Recently, CTS started a few marketing campaigns to increase website visits and purchases. Using touch attribution, they’d like to map their customers’ journey: from initial visit to purchase. They can use that information to optimize their marketing campaigns.
In this project, we’ll be helping them analyze the performance of their campaigns.

## Project Goals

The purpose of the project is in practice to use SQL, UTM parameters for draw insights from data about first- and last-touch attribution.

Here are the few questions we want to answer:

1. Get familiar with the company.
* How many campaigns and sources does CoolTShirts use and how are they related?
* To explain the difference between `utm_campaign` and `utm_source`.
* What pages are on their website?

2. What is the user journey?
* How many first touches is each campaign responsible for?
* How many last touches is each campaign responsible for?
* How many visitors make a purchase?
* How many last touches on the purchase page is each campaign responsible for?
* What is the typical user journey?

3. Optimize the campaign budget.
* CoolTShirts can re-invest in 5 campaigns. Which should they pick and why?

## Actions
Analyze data with SQL queries to answer the questions above.

## Data

The dataset provided to you contains one SQL table, `page_visits`. Within the table, there are 5 columns:

 - `user_id` - a unique identifier for each visitor to a page
 - `timestamp` - the time at which the visitor came to the page
 - `page_name` - the title of the section of the page that was visited
 - `utm_source` - identifies which site sent the traffic (i.e., google, newsletter, or facebook_ad)
 - `utm_campaign` - Identifies the specific ad or email blast (i.e., june-21-newsletter or memorial-day-sale)