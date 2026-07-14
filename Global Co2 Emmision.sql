CREATE DATABASE globalCo2db;
USE globalco2db;

SHOW GLOBAL VARIABLES LIKE 'local_infile';
  
SHOW TABLES;

CREATE TABLE globalco2_stage (
    country VARCHAR(100),
    `year` VARCHAR(20),
    iso_code VARCHAR(10),

    population VARCHAR(100),
    gdp VARCHAR(100),

    cement_co2 VARCHAR(100),
    cement_co2_per_capita VARCHAR(100),
    co2 VARCHAR(100),
    co2_growth_abs VARCHAR(100),
    co2_growth_prct VARCHAR(100),

    co2_including_luc VARCHAR(100),
    co2_including_luc_growth_abs VARCHAR(100),
    co2_including_luc_growth_prct VARCHAR(100),
    co2_including_luc_per_capita VARCHAR(100),
    co2_including_luc_per_gdp VARCHAR(100),
    co2_including_luc_per_unit_energy VARCHAR(100),

    co2_per_capita VARCHAR(100),
    co2_per_gdp VARCHAR(100),
    co2_per_unit_energy VARCHAR(100),

    coal_co2 VARCHAR(100),
    coal_co2_per_capita VARCHAR(100),

    consumption_co2 VARCHAR(100),
    consumption_co2_per_capita VARCHAR(100),
    consumption_co2_per_gdp VARCHAR(100),

    cumulative_cement_co2 VARCHAR(100),
    cumulative_co2 VARCHAR(100),
    cumulative_co2_including_luc VARCHAR(100),
    cumulative_coal_co2 VARCHAR(100),
    cumulative_flaring_co2 VARCHAR(100),
    cumulative_gas_co2 VARCHAR(100),
    cumulative_luc_co2 VARCHAR(100),
    cumulative_oil_co2 VARCHAR(100),
    cumulative_other_co2 VARCHAR(100),

    energy_per_capita VARCHAR(100),
    energy_per_gdp VARCHAR(100),

    flaring_co2 VARCHAR(100),
    flaring_co2_per_capita VARCHAR(100),

    gas_co2 VARCHAR(100),
    gas_co2_per_capita VARCHAR(100),

    ghg_excluding_lucf_per_capita VARCHAR(100),
    ghg_per_capita VARCHAR(100),

    land_use_change_co2 VARCHAR(100),
    land_use_change_co2_per_capita VARCHAR(100),

    methane VARCHAR(100),
    methane_per_capita VARCHAR(100),

    nitrous_oxide VARCHAR(100),
    nitrous_oxide_per_capita VARCHAR(100),

    oil_co2 VARCHAR(100),
    oil_co2_per_capita VARCHAR(100),

    other_co2_per_capita VARCHAR(100),
    other_industry_co2 VARCHAR(100),

    primary_energy_consumption VARCHAR(100),

    share_global_cement_co2 VARCHAR(100),
    share_global_co2 VARCHAR(100),
    share_global_co2_including_luc VARCHAR(100),
    share_global_coal_co2 VARCHAR(100),

    share_global_cumulative_cement_co2 VARCHAR(100),
    share_global_cumulative_co2 VARCHAR(100),
    share_global_cumulative_co2_including_luc VARCHAR(100),
    share_global_cumulative_coal_co2 VARCHAR(100),
    share_global_cumulative_flaring_co2 VARCHAR(100),
    share_global_cumulative_gas_co2 VARCHAR(100),
    share_global_cumulative_luc_co2 VARCHAR(100),
    share_global_cumulative_oil_co2 VARCHAR(100),
    share_global_cumulative_other_co2 VARCHAR(100),

    share_global_flaring_co2 VARCHAR(100),
    share_global_gas_co2 VARCHAR(100),
    share_global_luc_co2 VARCHAR(100),
    share_global_oil_co2 VARCHAR(100),
    share_global_other_co2 VARCHAR(100),

    share_of_temperature_change_from_ghg VARCHAR(100),
    temperature_change_from_ch4 VARCHAR(100),
    temperature_change_from_co2 VARCHAR(100),
    temperature_change_from_ghg VARCHAR(100),
    temperature_change_from_n2o VARCHAR(100),

    total_ghg VARCHAR(100),
    total_ghg_excluding_lucf VARCHAR(100),

    trade_co2 VARCHAR(100),
    trade_co2_share VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/visualizing_global_co2_database.csv'
INTO TABLE globalco2_stage
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
country, `year`, iso_code, population, gdp, cement_co2, cement_co2_per_capita,
co2, co2_growth_abs, co2_growth_prct, co2_including_luc, co2_including_luc_growth_abs,
co2_including_luc_growth_prct, co2_including_luc_per_capita, co2_including_luc_per_gdp,
co2_including_luc_per_unit_energy, co2_per_capita, co2_per_gdp, co2_per_unit_energy,
coal_co2, coal_co2_per_capita, consumption_co2, consumption_co2_per_capita,
consumption_co2_per_gdp, cumulative_cement_co2, cumulative_co2, cumulative_co2_including_luc,
cumulative_coal_co2, cumulative_flaring_co2, cumulative_gas_co2, cumulative_luc_co2,
cumulative_oil_co2, cumulative_other_co2, energy_per_capita, energy_per_gdp, flaring_co2,
flaring_co2_per_capita, gas_co2, gas_co2_per_capita, ghg_excluding_lucf_per_capita,
ghg_per_capita, land_use_change_co2, land_use_change_co2_per_capita, methane,
methane_per_capita, nitrous_oxide, nitrous_oxide_per_capita, oil_co2, oil_co2_per_capita,
other_co2_per_capita, other_industry_co2, primary_energy_consumption, share_global_cement_co2,
share_global_co2, share_global_co2_including_luc, share_global_coal_co2,
share_global_cumulative_cement_co2, share_global_cumulative_co2,
share_global_cumulative_co2_including_luc, share_global_cumulative_coal_co2,
share_global_cumulative_flaring_co2, share_global_cumulative_gas_co2,
share_global_cumulative_luc_co2, share_global_cumulative_oil_co2,
share_global_cumulative_other_co2, share_global_flaring_co2, share_global_gas_co2,
share_global_luc_co2, share_global_oil_co2, share_global_other_co2,
share_of_temperature_change_from_ghg, temperature_change_from_ch4, temperature_change_from_co2,
temperature_change_from_ghg, temperature_change_from_n2o, total_ghg,
total_ghg_excluding_lucf, trade_co2, trade_co2_share
);


-- Data Cleaning --------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM globalco2_stage;

-- Find duplicates

SELECT country,year,COUNT(*)
FROM globalco2_stage
GROUP BY country,year
HAVING COUNT(*)>1;

-- Missing values
SELECT *
FROM globalco2_stage
WHERE country IS NULL;

--   Total Records --------------------------------------------------------------------------------
SELECT COUNT(*)
FROM globalco2_stage;

-- Distinct Countries  ---------------------------------------------
SELECT COUNT(DISTINCT country)
FROM globalco2_stage ;

-- Year Range ------------------------------------------------
SELECT
MIN(year),
MAX(year)
FROM globalco2_stage ;

-- Global CO₂ by Year
SELECT
year,
SUM(co2) Global_CO2
FROM globalco2_stage
GROUP BY year
ORDER BY year;

-- Average CO₂ Growth
SELECT
country,
AVG(co2_growth_prct) Avg_Growth
FROM globalco2_stage
GROUP BY country
ORDER BY Avg_Growth DESC;
-- Top 10 -------------------------------------------------------------------------------------------------
-- Top 10 Countries by Total CO₂
SELECT
country,
ROUND(SUM(co2),2) Total_CO2
FROM globalco2_stage
GROUP BY country
ORDER BY Total_CO2 DESC
LIMIT 10;

-- Top Population
SELECT
country,
MAX(population) Population
FROM globalco2_stage
GROUP BY country
ORDER BY Population DESC
LIMIT 10;

--  Top GDP
SELECT
country,
MAX(gdp) GDP
FROM globalco2_stage
GROUP BY country
ORDER BY GDP DESC
LIMIT 10;

-- Highest CO₂ Per Capita
SELECT
country,
AVG(co2_per_capita) Avg_CO2
FROM globalco2_stage
GROUP BY country
ORDER BY Avg_CO2 DESC
LIMIT 10;

-- -------------------------------------------------------------------------------------------------------------------------------
		-- 	-----------------------------------------	DETAIL ANALYSIS ----------------------------------------------------  --
-- ------------------------------------------------------------------------------------------------------------------------------


-- Top 10 Countries by Total CO₂ Emissions (1971–2021)
SELECT
    country,
    ROUND(SUM(co2),2) AS Total_CO2_Emission
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_CO2_Emission DESC
LIMIT 10;
-- Year-wise CO₂ Emissions for Top 10 Countries
SELECT
    country,
    year,
    ROUND(co2,2) AS CO2_Emission
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN (
    SELECT country
    FROM (
        SELECT
            country,
            SUM(co2) AS Total_CO2
        FROM globalco2_stage
        WHERE year BETWEEN 1971 AND 2021
        GROUP BY country
        ORDER BY Total_CO2 DESC
        LIMIT 10
    ) AS TopCountries
)
ORDER BY country, year;
--  Top 10 Countries with Average Annual CO₂
SELECT
    country,
    ROUND(AVG(co2),2) AS Avg_CO2_Emission
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Avg_CO2_Emission DESC
LIMIT 10;
-- Top 10 Countries by CO₂ in 2021
SELECT
    country,
    ROUND(co2,2) AS CO2_Emission_2021
FROM globalco2
WHERE year = 2021
ORDER BY co2 DESC
LIMIT 10;
--  Year-wise CO₂ Trend for Fixed 10 Major Countries
SELECT
    year,
    country,
    ROUND(co2,2) AS CO2_Emission
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN (
    'China',
    'United States',
    'India',
    'Russia',
    'Japan',
    'Germany',
    'United Kingdom',
    'Canada',
    'Brazil',
    'South Korea'
)
ORDER BY year, country;

-- Population 

-- Top 10 Most Populated Countries 
SELECT
    country,
    MAX(population) AS Population
FROM globalco2_stage
WHERE population IS NOT NULL
GROUP BY country
ORDER BY Population DESC
LIMIT 10;

--  Population Trend (1971–2021)
SELECT
    year,
    SUM(population) AS Global_Population
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;
--  Top 10 Countries by Population in 2021
SELECT
    country,
    population
FROM globalco2_stage
WHERE year = 2021
AND population IS NOT NULL
ORDER BY population DESC
LIMIT 10;

--  Population Growth by Country
SELECT
    country,
    MIN(population) AS Population_1971,
    MAX(population) AS Population_2021,
    MAX(population)-MIN(population) AS Population_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Population_Growth DESC
LIMIT 10;

--  Average Population by Country
SELECT
    country,
    ROUND(AVG(population),0) AS Avg_Population
FROM globalco2_stage
GROUP BY country
ORDER BY Avg_Population DESC
LIMIT 10;

--  Top 10 Countries Population Trend (1971–2021)
SELECT
    year,
    country,
    population
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
country,
MAX(population) AS Population
FROM globalco2_stage
GROUP BY country
ORDER BY Population DESC
LIMIT 10
) t
)
ORDER BY year,country;
--   Rank Countries by Population
SELECT
    country,
    MAX(population) AS Population,
    RANK() OVER(ORDER BY MAX(population) DESC) AS Population_Rank
FROM globalco2_stage
GROUP BY country;

--  Population Share of Top 10 Countries
SELECT
    country,
    ROUND(MAX(population)*100/
    (SELECT SUM(population)
     FROM globalco2_stage
     WHERE year=2021),2) AS Population_Percentage
FROM globalco2_stage
WHERE year=2021
GROUP BY country
ORDER BY Population_Percentage DESC
LIMIT 10;

--  Countries with Population Above Global Average
SELECT
    country,
    MAX(population) AS Population
FROM globalco2_stage
GROUP BY country
HAVING Population >
(
SELECT AVG(population)
FROM globalco2
)
ORDER BY Population DESC;

--  Year with Highest Global Population
SELECT
    year,
    SUM(population) AS Global_Population
FROM globalco2_stage
GROUP BY year
ORDER BY Global_Population DESC
LIMIT 1;



















































--  Co2 Trend Country Wise ***********************************************************

-- India's CO₂ Trend
SELECT
year,
co2
FROM globalco2_stage
WHERE country='India'
ORDER BY year;

-- China's CO₂ Trend
SELECT
year,
co2
FROM globalco2_stage
WHERE country='China'
ORDER BY year;

-- GDP ***********************************************************************
-- Top 10 Countries by GDP
SELECT
    country,
    ROUND(MAX(gdp),2) AS GDP
FROM globalco2_stage
WHERE gdp IS NOT NULL
GROUP BY country
ORDER BY GDP DESC
LIMIT 10;

--  GDP Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(gdp),2) AS Global_GDP
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

--  Top 10 Countries by GDP in 2021
SELECT
    country,
    ROUND(gdp,2) AS GDP_2021
FROM globalco2_stage
WHERE year = 2021
AND gdp IS NOT NULL
ORDER BY gdp DESC
LIMIT 10;

--  GDP Growth by Country (1971–2021)
SELECT
    country,
    MIN(gdp) AS GDP_1971,
    MAX(gdp) AS GDP_2021,
    ROUND(MAX(gdp)-MIN(gdp),2) AS GDP_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY GDP_Growth DESC
LIMIT 10;

--  Average GDP by Country
SELECT
    country,
    ROUND(AVG(gdp),2) AS Avg_GDP
FROM globalco2_stage
WHERE gdp IS NOT NULL
GROUP BY country
ORDER BY Avg_GDP DESC
LIMIT 10;

--  GDP Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(gdp,2) AS GDP
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    MAX(gdp) AS GDP
FROM globalco2_stage
GROUP BY country
ORDER BY GDP DESC
LIMIT 10
) t
)
ORDER BY year, country;

--  Rank Countries by GDP
SELECT
    country,
    MAX(gdp) AS GDP,
    RANK() OVER(ORDER BY MAX(gdp) DESC) AS GDP_Rank
FROM globalco2_stage
GROUP BY country;

--  Countries Above Average GDP
SELECT
    country,
    MAX(gdp) AS GDP
FROM globalco2_stage
GROUP BY country
HAVING GDP >
(
SELECT AVG(gdp)
FROM globalco2_stage
)
ORDER BY GDP DESC;

--  GDP vs CO₂ Emissions
SELECT
    country,
    ROUND(MAX(gdp),2) AS GDP,
    ROUND(SUM(co2),2) AS Total_CO2
FROM globalco2_stage
GROUP BY country
ORDER BY GDP DESC
LIMIT 10;
--  Top 10 Countries by GDP Per Unit CO₂
SELECT
    country,
    ROUND(AVG(co2_per_gdp),4) AS CO2_Per_GDP
FROM globalco2_stage
WHERE co2_per_gdp IS NOT NULL
GROUP BY country
ORDER BY CO2_Per_GDP DESC
LIMIT 10;

-- Coal CO₂ ***************************************************************

-- Top 10 Countries by Total Coal CO₂ Emissions
SELECT
    country,
    ROUND(SUM(coal_co2),2) AS Total_Coal_CO2
FROM globalco2_stage
WHERE coal_co2 IS NOT NULL
GROUP BY country
ORDER BY Total_Coal_CO2 DESC
LIMIT 10;

--  Coal CO₂ Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(coal_co2),2) AS Global_Coal_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

-- Top 10 Countries by Coal CO₂ in 2021
SELECT
    country,
    ROUND(coal_co2,2) AS Coal_CO2_2021
FROM globalco2_stage
WHERE year = 2021
AND coal_co2 IS NOT NULL
ORDER BY coal_co2 DESC
LIMIT 10;

--  Coal CO₂ Growth by Country (1971–2021)
SELECT
    country,
    MIN(coal_co2) AS Coal_CO2_1971,
    MAX(coal_co2) AS Coal_CO2_2021,
    ROUND(MAX(coal_co2)-MIN(coal_co2),2) AS Coal_CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Coal_CO2_Growth DESC
LIMIT 10;

--  Average Coal CO₂ by Country
SELECT
    country,
    ROUND(AVG(coal_co2),2) AS Avg_Coal_CO2
FROM globalco2_stage
WHERE coal_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Coal_CO2 DESC
LIMIT 10;

--  Coal CO₂ Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(coal_co2,2) AS Coal_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    SUM(coal_co2) AS Total_Coal_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_Coal_CO2 DESC
LIMIT 10
) t
)
ORDER BY year, country;

-- Rank Countries by Coal CO₂
SELECT
    country,
    ROUND(SUM(coal_co2),2) AS Total_Coal_CO2,
    RANK() OVER (ORDER BY SUM(coal_co2) DESC) AS Coal_Rank
FROM globalco2_stage
GROUP BY country; 

--  Top Coal CO₂ Emitting Country Each Year
WITH CoalRank AS
(
    SELECT
        year,
        country,
        coal_co2,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY coal_co2 DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    coal_co2
FROM CoalRank
WHERE rnk = 1
ORDER BY year;

--  --- Total Coal CO₂ by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(coal_co2),2) AS Total_Coal_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

-- Coal CO₂ Per Capita (Top 10 Countries)
SELECT
    country,
    ROUND(AVG(coal_co2_per_capita),3) AS Avg_Coal_CO2_Per_Capita
FROM globalco2_stage
WHERE coal_co2_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Coal_CO2_Per_Capita DESC
LIMIT 10;

-- Gas CO₂
-- Top 10 Countries by Total Gas CO₂ Emissions
SELECT
    country,
    ROUND(SUM(gas_co2),2) AS Total_Gas_CO2
FROM globalco2_stage
WHERE gas_co2 IS NOT NULL
GROUP BY country
ORDER BY Total_Gas_CO2 DESC
LIMIT 10;

--  Gas CO₂ Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(gas_co2),2) AS Global_Gas_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

--  Top 10 Countries by Gas CO₂ in 2021
SELECT
    country,
    ROUND(gas_co2,2) AS Gas_CO2_2021
FROM globalco2_stage
WHERE year = 2021
AND gas_co2 IS NOT NULL
ORDER BY gas_co2 DESC
LIMIT 10;

--  Gas CO₂ Growth by Country (1971–2021)
SELECT
    country,
    MIN(gas_co2) AS Gas_CO2_1971,
    MAX(gas_co2) AS Gas_CO2_2021,
    ROUND(MAX(gas_co2)-MIN(gas_co2),2) AS Gas_CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Gas_CO2_Growth DESC
LIMIT 10;

--  Average Gas CO₂ by Country
SELECT
    country,
    ROUND(AVG(gas_co2),2) AS Avg_Gas_CO2
FROM globalco2_stage
WHERE gas_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Gas_CO2 DESC
LIMIT 10;

--  Gas CO₂ Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(gas_co2,2) AS Gas_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    SUM(gas_co2) AS Total_Gas_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_Gas_CO2 DESC
LIMIT 10
) t
)
ORDER BY year, country;

--  Rank Countries by Gas CO₂
SELECT
    country,
    ROUND(SUM(gas_co2),2) AS Total_Gas_CO2,
    RANK() OVER (ORDER BY SUM(gas_co2) DESC) AS Gas_Rank
FROM globalco2_stage
GROUP BY country;

--  Top Gas CO₂ Emitting Country Each Year
WITH GasRank AS
(
    SELECT
        year,
        country,
        gas_co2,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY gas_co2 DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    gas_co2
FROM GasRank
WHERE rnk = 1
ORDER BY year;

--  Total Gas CO₂ by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(gas_co2),2) AS Total_Gas_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

-- Top 10 Countries by Gas CO₂ Per Capita
SELECT
    country,
    ROUND(AVG(gas_co2_per_capita),3) AS Avg_Gas_CO2_Per_Capita
FROM globalco2_stage
WHERE gas_co2_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Gas_CO2_Per_Capita DESC
LIMIT 10;

-- Oil CO₂ *********************
-- Top 10 Countries by Total Oil CO₂ Emissions
SELECT
    country,
    ROUND(SUM(oil_co2),2) AS Total_Oil_CO2
FROM globalco2_stage
WHERE oil_co2 IS NOT NULL
GROUP BY country
ORDER BY Total_Oil_CO2 DESC
LIMIT 10;

-- Global Oil CO₂ Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(oil_co2),2) AS Global_Oil_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

-- Top 10 Countries by Oil CO₂ in 2021
SELECT
    country,
    ROUND(oil_co2,2) AS Oil_CO2_2021
FROM globalco2_stage
WHERE year = 2021
AND oil_co2 IS NOT NULL
ORDER BY oil_co2 DESC
LIMIT 10;

-- Oil CO₂ Growth by Country (1971–2021)
SELECT
    country,
    MIN(oil_co2) AS Oil_CO2_1971,
    MAX(oil_co2) AS Oil_CO2_2021,
    ROUND(MAX(oil_co2)-MIN(oil_co2),2) AS Oil_CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Oil_CO2_Growth DESC
LIMIT 10;

-- Average Oil CO₂ by Country
SELECT
    country,
    ROUND(AVG(oil_co2),2) AS Avg_Oil_CO2
FROM globalco2_stage
WHERE oil_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Oil_CO2 DESC
LIMIT 10;

-- Oil CO₂ Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(oil_co2,2) AS Oil_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    SUM(oil_co2) AS Total_Oil_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_Oil_CO2 DESC
LIMIT 10
) t
)
ORDER BY year, country;

--  Rank Countries by Oil CO₂
SELECT
    country,
    ROUND(SUM(oil_co2),2) AS Total_Oil_CO2,
    RANK() OVER(ORDER BY SUM(oil_co2) DESC) AS Oil_Rank
FROM globalco2_stage
GROUP BY country;

-- Top Oil CO₂ Emitting Country Each Year
WITH OilRank AS
(
    SELECT
        year,
        country,
        oil_co2,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY oil_co2 DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    oil_co2
FROM OilRank
WHERE rnk = 1
ORDER BY year;

-- Total Oil CO₂ by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(oil_co2),2) AS Total_Oil_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

--  Top 10 Countries by Oil CO₂ Per Capita
SELECT
    country,
    ROUND(AVG(oil_co2_per_capita),3) AS Avg_Oil_CO2_Per_Capita
FROM globalco2_stage
WHERE oil_co2_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Oil_CO2_Per_Capita DESC
LIMIT 10;

--  Methane Trend 

-- Top 10 Countries with Highest Total Methane Emissions
SELECT
    country,
    ROUND(SUM(methane),2) AS Total_Methane
FROM globalco2_stage
WHERE methane IS NOT NULL
GROUP BY country
ORDER BY Total_Methane DESC
LIMIT 10;

-- Top 10 Countries with Highest Average Methane Emissions
SELECT
    country,
    ROUND(AVG(methane),2) AS Avg_Methane
FROM globalco2_stage
WHERE methane IS NOT NULL
GROUP BY country
ORDER BY Avg_Methane DESC
LIMIT 10;

--  Top 10 Countries with Highest Methane Per Capita
SELECT
    country,
    ROUND(AVG(methane_per_capita),2) AS Avg_Methane_Per_Capita
FROM globalco2_stage
WHERE methane_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Methane_Per_Capita DESC
LIMIT 10;

--  Top 10 Countries by Methane Emissions in 2021
SELECT
    country,
    ROUND(methane,2) AS Methane_Emission
FROM globalco2_stage
WHERE year = 2021
AND methane IS NOT NULL
ORDER BY methane DESC
LIMIT 10;
--  Year-wise Methane Trend for Top 10 Countries (1971–2021)
SELECT
    year,
    country,
    ROUND(methane,2) AS Methane_Emission
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN (
    SELECT country
    FROM (
        SELECT
            country,
            SUM(methane) AS Total_Methane
        FROM globalco2_stage
        WHERE year BETWEEN 1971 AND 2021
        GROUP BY country
        ORDER BY Total_Methane DESC
        LIMIT 10
    ) AS TopCountries
)
ORDER BY year, country;
--  Rank Countries by Methane Emissions
SELECT
    country,
    ROUND(SUM(methane),2) AS Total_Methane,
    RANK() OVER (ORDER BY SUM(methane) DESC) AS Methane_Rank
FROM globalco2_stage
WHERE methane IS NOT NULL
GROUP BY country;

--  Top Methane Emitting Country in Each Year
WITH RankedMethane AS (
    SELECT
        year,
        country,
        methane,
        DENSE_RANK() OVER (
            PARTITION BY year
            ORDER BY methane DESC
        ) AS rnk
    FROM globalco2_stage
    WHERE methane IS NOT NULL
)
SELECT
    year,
    country,
    methane
FROM RankedMethane
WHERE rnk = 1
ORDER BY year;

-- Cement CO₂ Emissions ******************************************************************************************************************

-- Top 10 Countries by Total Cement CO₂ Emissions
SELECT
    country,
    ROUND(SUM(cement_co2),2) AS Total_Cement_CO2
FROM globalco2_stage
WHERE cement_co2 IS NOT NULL
GROUP BY country
ORDER BY Total_Cement_CO2 DESC
LIMIT 10;

--  Top 10 Countries by Cement CO₂ in 2021
SELECT
    country,
    ROUND(cement_co2,2) AS Cement_CO2_2021
FROM globalco2_stage
WHERE year = 2021
AND cement_co2 IS NOT NULL
ORDER BY cement_co2 DESC
LIMIT 10;

--  Year-wise Cement CO₂ Emissions (1971–2021)
SELECT
    year,
    ROUND(SUM(cement_co2),2) AS Global_Cement_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

--  Top 10 Countries' Cement CO₂ Trend (1971–2021)
SELECT
    year,
    country,
    ROUND(cement_co2,2) AS Cement_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN (
    SELECT country
    FROM (
        SELECT
            country,
            SUM(cement_co2) AS Total_Cement_CO2
        FROM globalco2_stage
        WHERE year BETWEEN 1971 AND 2021
        GROUP BY country
        ORDER BY Total_Cement_CO2 DESC
        LIMIT 10
    ) AS TopCountries
)
ORDER BY year, country;
--  Average Cement CO₂ by Country
SELECT
    country,
    ROUND(AVG(cement_co2),2) AS Avg_Cement_CO2
FROM globalco2_stage
WHERE cement_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Cement_CO2 DESC
LIMIT 10;

--  Highest Cement CO₂ Per Capita
SELECT
    country,
    ROUND(AVG(cement_co2_per_capita),3) AS Avg_Cement_CO2_Per_Capita
FROM globalco2_stage
WHERE cement_co2_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Cement_CO2_Per_Capita DESC
LIMIT 10;

--  Rank Countries by Cement CO₂
SELECT
    country,
    ROUND(SUM(cement_co2),2) AS Total_Cement_CO2,
    RANK() OVER (ORDER BY SUM(cement_co2) DESC) AS Cement_Rank
FROM globalco2_stage
WHERE cement_co2 IS NOT NULL
GROUP BY country;
-- Top Cement CO₂ Emitting Country Each Year
WITH CementRank AS
(
    SELECT
        year,
        country,
        cement_co2,
        DENSE_RANK() OVER(
            PARTITION BY year
            ORDER BY cement_co2 DESC
        ) AS rnk
    FROM globalco2_stage
    WHERE cement_co2 IS NOT NULL
)
SELECT
    year,
    country,
    cement_co2
FROM CementRank
WHERE rnk = 1
ORDER BY year;
-- Total Cement CO₂ by Decade ----- 
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(cement_co2),2) AS Total_Cement_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

-- Cement CO₂ Contribution (%) by Country
SELECT
    country,
    ROUND(
        SUM(cement_co2) * 100 /
        (SELECT SUM(cement_co2) FROM globalco2_stage),
        2
    ) AS Contribution_Percentage
FROM globalco2_stage
WHERE cement_co2 IS NOT NULL
GROUP BY country
ORDER BY Contribution_Percentage DESC
LIMIT 10;

-- Nitrous Oxide Trend ***************
-- Top 10 Countries by Total Nitrous Oxide Emissions
SELECT
    country,
    ROUND(SUM(nitrous_oxide),2) AS Total_Nitrous_Oxide
FROM globalco2_stage
WHERE nitrous_oxide IS NOT NULL
GROUP BY country
ORDER BY Total_Nitrous_Oxide DESC
LIMIT 10;

--  Global Nitrous Oxide Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(nitrous_oxide),2) AS Global_Nitrous_Oxide
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

-- Top 10 Countries by Nitrous Oxide Emissions in 2021
SELECT
    country,
    ROUND(nitrous_oxide,2) AS Nitrous_Oxide_2021
FROM globalco2_stage
WHERE year = 2021
AND nitrous_oxide IS NOT NULL
ORDER BY nitrous_oxide DESC
LIMIT 10;

--  Nitrous Oxide Growth by Country (1971–2021)
SELECT
    country,
    MIN(nitrous_oxide) AS Nitrous_Oxide_1971,
    MAX(nitrous_oxide) AS Nitrous_Oxide_2021,
    ROUND(MAX(nitrous_oxide)-MIN(nitrous_oxide),2) AS Nitrous_Oxide_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Nitrous_Oxide_Growth DESC
LIMIT 10;

-- Average Nitrous Oxide Emissions by Country
SELECT
    country,
    ROUND(AVG(nitrous_oxide),2) AS Avg_Nitrous_Oxide
FROM globalco2_stage
WHERE nitrous_oxide IS NOT NULL
GROUP BY country
ORDER BY Avg_Nitrous_Oxide DESC
LIMIT 10;

--  Nitrous Oxide Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(nitrous_oxide,2) AS Nitrous_Oxide
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    SUM(nitrous_oxide) AS Total_Nitrous_Oxide
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_Nitrous_Oxide DESC
LIMIT 10
) t
)
ORDER BY year, country;
--  Rank Countries by Nitrous Oxide Emissions
SELECT
    country,
    ROUND(SUM(nitrous_oxide),2) AS Total_Nitrous_Oxide,
    RANK() OVER(ORDER BY SUM(nitrous_oxide) DESC) AS Nitrous_Oxide_Rank
FROM globalco2_stage
GROUP BY country;

-- Top Nitrous Oxide Emitting Country Each Year
WITH NitrousRank AS
(
    SELECT
        year,
        country,
        nitrous_oxide,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY nitrous_oxide DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    nitrous_oxide
FROM NitrousRank
WHERE rnk = 1
ORDER BY year;

--  Total Nitrous Oxide Emissions by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(nitrous_oxide),2) AS Total_Nitrous_Oxide
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

-- Top 10 Countries by Nitrous Oxide Per Capita
SELECT
    country,
    ROUND(AVG(nitrous_oxide_per_capita),3) AS Avg_Nitrous_Oxide_Per_Capita
FROM globalco2_stage
WHERE nitrous_oxide_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Nitrous_Oxide_Per_Capita DESC
LIMIT 10;

-- Total Greenhouse Gas (GHG)

-- Top 10 Countries by Total GHG Emissions
SELECT
    country,
    ROUND(SUM(total_ghg),2) AS Total_GHG
FROM globalco2_stage
WHERE total_ghg IS NOT NULL
GROUP BY country
ORDER BY Total_GHG DESC
LIMIT 10;

-- Global Total GHG Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(total_ghg),2) AS Global_Total_GHG
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

-- Top 10 Countries by Total GHG in 2021
SELECT
    country,
    ROUND(total_ghg,2) AS Total_GHG_2021
FROM globalco2_stage
WHERE year = 2021
AND total_ghg IS NOT NULL
ORDER BY total_ghg DESC
LIMIT 10;

-- Total GHG Growth by Country (1971–2021)
SELECT
    country,
    MIN(total_ghg) AS GHG_1971,
    MAX(total_ghg) AS GHG_2021,
    ROUND(MAX(total_ghg)-MIN(total_ghg),2) AS GHG_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY GHG_Growth DESC
LIMIT 10;

-- Average Total GHG by Country
SELECT
    country,
    ROUND(AVG(total_ghg),2) AS Avg_Total_GHG
FROM globalco2_stage
WHERE total_ghg IS NOT NULL
GROUP BY country
ORDER BY Avg_Total_GHG DESC
LIMIT 10;

-- Total GHG Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(total_ghg,2) AS Total_GHG
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    SUM(total_ghg) AS Total_GHG
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_GHG DESC
LIMIT 10
) t
)
ORDER BY year, country;

--  Rank Countries by Total GHG
SELECT
    country,
    ROUND(SUM(total_ghg),2) AS Total_GHG,
    RANK() OVER (ORDER BY SUM(total_ghg) DESC) AS GHG_Rank
FROM globalco2_stage
GROUP BY country;

--  Top Total GHG Emitting Country Each Year
WITH GHGRank AS
(
    SELECT
        year,
        country,
        total_ghg,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY total_ghg DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    total_ghg
FROM GHGRank
WHERE rnk = 1
ORDER BY year;

-- Total GHG Emissions by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(total_ghg),2) AS Total_GHG
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

-- Top 10 Countries by GHG Per Capita
SELECT
    country,
    ROUND(AVG(ghg_per_capita),3) AS Avg_GHG_Per_Capita
FROM globalco2_stage
WHERE ghg_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_GHG_Per_Capita DESC
LIMIT 10;

-- Primary Energy Consumption ****************************************
-- Top 10 Countries by Total Primary Energy Consumption
SELECT
    country,
    ROUND(SUM(primary_energy_consumption),2) AS Total_Primary_Energy
FROM globalco2_stage
WHERE primary_energy_consumption IS NOT NULL
GROUP BY country
ORDER BY Total_Primary_Energy DESC
LIMIT 10;

--  Global Primary Energy Consumption Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(primary_energy_consumption),2) AS Global_Primary_Energy
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

-- Top 10 Countries by Primary Energy Consumption in 2021
SELECT
    country,
    ROUND(primary_energy_consumption,2) AS Primary_Energy_2021
FROM globalco2_stage
WHERE year = 2021
AND primary_energy_consumption IS NOT NULL
ORDER BY primary_energy_consumption DESC
LIMIT 10;

-- Primary Energy Consumption Growth by Country (1971–2021)
SELECT
    country,
    MIN(primary_energy_consumption) AS Energy_1971,
    MAX(primary_energy_consumption) AS Energy_2021,
    ROUND(MAX(primary_energy_consumption)-MIN(primary_energy_consumption),2) AS Energy_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Energy_Growth DESC
LIMIT 10;

--  Average Primary Energy Consumption by Country
SELECT
    country,
    ROUND(AVG(primary_energy_consumption),2) AS Avg_Primary_Energy
FROM globalco2_stage
WHERE primary_energy_consumption IS NOT NULL
GROUP BY country
ORDER BY Avg_Primary_Energy DESC
LIMIT 10;

-- Primary Energy Consumption Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(primary_energy_consumption,2) AS Primary_Energy
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    SUM(primary_energy_consumption) AS Total_Primary_Energy
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_Primary_Energy DESC
LIMIT 10
) t
)
ORDER BY year, country;

-- Rank Countries by Primary Energy Consumption
SELECT
    country,
    ROUND(SUM(primary_energy_consumption),2) AS Total_Primary_Energy,
    RANK() OVER (ORDER BY SUM(primary_energy_consumption) DESC) AS Energy_Rank
FROM globalco2_stage
GROUP BY country;

--  Top Primary Energy Consuming Country Each Year
WITH EnergyRank AS
(
    SELECT
        year,
        country,
        primary_energy_consumption,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY primary_energy_consumption DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    primary_energy_consumption
FROM EnergyRank
WHERE rnk = 1
ORDER BY year;

--  Total Primary Energy Consumption by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(primary_energy_consumption),2) AS Total_Primary_Energy
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;
--  Top 10 Countries by Energy Per Capita
SELECT
    country,
    ROUND(AVG(energy_per_capita),2) AS Avg_Energy_Per_Capita
FROM globalco2_stage
WHERE energy_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Energy_Per_Capita DESC
LIMIT 10;

-- Energy Per Capita ***************************************************
--  Top 10 Countries by Average Energy Per Capita
SELECT
    country,
    ROUND(AVG(energy_per_capita),2) AS Avg_Energy_Per_Capita
FROM globalco2_stage
WHERE energy_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Energy_Per_Capita DESC
LIMIT 10;

--  Global Average Energy Per Capita Trend (1971–2021)
SELECT
    year,
    ROUND(AVG(energy_per_capita),2) AS Global_Avg_Energy_Per_Capita
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

--    Top 10 Countries by Energy Per Capita in 2021
SELECT
    country,
    ROUND(energy_per_capita,2) AS Energy_Per_Capita_2021
FROM globalco2_stage
WHERE year = 2021
AND energy_per_capita IS NOT NULL
ORDER BY energy_per_capita DESC
LIMIT 10;

--  Energy Per Capita Growth by Country (1971–2021)
SELECT
    country,
    MIN(energy_per_capita) AS Energy_1971,
    MAX(energy_per_capita) AS Energy_2021,
    ROUND(MAX(energy_per_capita)-MIN(energy_per_capita),2) AS Energy_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Energy_Growth DESC
LIMIT 10;

--  Top 10 Countries by Maximum Energy Per Capita
SELECT
    country,
    ROUND(MAX(energy_per_capita),2) AS Max_Energy_Per_Capita
FROM globalco2_stage
WHERE energy_per_capita IS NOT NULL
GROUP BY country
ORDER BY Max_Energy_Per_Capita DESC
LIMIT 10;

--  Energy Per Capita Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(energy_per_capita,2) AS Energy_Per_Capita
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    AVG(energy_per_capita) AS Avg_Energy
FROM globalco2_stage
GROUP BY country
ORDER BY Avg_Energy DESC
LIMIT 10
) t
)
ORDER BY year, country;

--  Rank Countries by Energy Per Capita
SELECT
    country,
    ROUND(AVG(energy_per_capita),2) AS Avg_Energy_Per_Capita,
    RANK() OVER(ORDER BY AVG(energy_per_capita) DESC) AS Energy_Rank
FROM globalco2_stage
GROUP BY country;

--  Country with Highest Energy Per Capita Each Year
WITH EnergyRank AS
(
    SELECT
        year,
        country,
        energy_per_capita,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY energy_per_capita DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    energy_per_capita
FROM EnergyRank
WHERE rnk = 1
ORDER BY year;

-- Average Energy Per Capita by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(AVG(energy_per_capita),2) AS Avg_Energy_Per_Capita
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

--   Compare Energy Per Capita and CO₂ Per Capita
SELECT
    country,
    ROUND(AVG(energy_per_capita),2) AS Avg_Energy_Per_Capita,
    ROUND(AVG(co2_per_capita),2) AS Avg_CO2_Per_Capita
FROM globalco2_stage
WHERE energy_per_capita IS NOT NULL
AND co2_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Energy_Per_Capita DESC
LIMIT 10;

-- CO₂ Per Capita (co2_per_capita) ******************************************

-- Top 10 Countries by Average CO₂ Per Capita
SELECT
    country,
    ROUND(AVG(co2_per_capita),2) AS Avg_CO2_Per_Capita
FROM globalco2_stage
WHERE co2_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_CO2_Per_Capita DESC
LIMIT 10;

-- Global Average CO₂ Per Capita Trend (1971–2021)
SELECT
    year,
    ROUND(AVG(co2_per_capita),2) AS Global_Avg_CO2_Per_Capita
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

-- Top 10 Countries by CO₂ Per Capita in 2021
SELECT
    country,
    ROUND(co2_per_capita,2) AS CO2_Per_Capita_2021
FROM globalco2_stage
WHERE year = 2021
AND co2_per_capita IS NOT NULL
ORDER BY co2_per_capita DESC
LIMIT 10;

-- CO₂ Per Capita Growth by Country (1971–2021)
SELECT
    country,
    MIN(co2_per_capita) AS CO2_1971,
    MAX(co2_per_capita) AS CO2_2021,
    ROUND(MAX(co2_per_capita)-MIN(co2_per_capita),2) AS CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY CO2_Growth DESC
LIMIT 10;

-- Top 10 Countries by Maximum CO₂ Per Capita
SELECT
    country,
    ROUND(MAX(co2_per_capita),2) AS Max_CO2_Per_Capita
FROM globalco2_stage
WHERE co2_per_capita IS NOT NULL
GROUP BY country
ORDER BY Max_CO2_Per_Capita DESC
LIMIT 10;

-- CO₂ Per Capita Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(co2_per_capita,2) AS CO2_Per_Capita
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    AVG(co2_per_capita) AS Avg_CO2
FROM globalco2_stage
GROUP BY country
ORDER BY Avg_CO2 DESC
LIMIT 10
) t
)
ORDER BY year, country;

-- Rank Countries by CO₂ Per Capita
SELECT
    country,
    ROUND(AVG(co2_per_capita),2) AS Avg_CO2_Per_Capita,
    RANK() OVER(ORDER BY AVG(co2_per_capita) DESC) AS CO2_Rank
FROM globalco2_stage
GROUP BY country;

-- Country with Highest CO₂ Per Capita Each Year
WITH CO2Rank AS
(
    SELECT
        year,
        country,
        co2_per_capita,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY co2_per_capita DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    co2_per_capita
FROM CO2Rank
WHERE rnk = 1
ORDER BY year;

--  Average CO₂ Per Capita by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(AVG(co2_per_capita),2) AS Avg_CO2_Per_Capita
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

-- Compare CO₂ Per Capita and Energy Per Capita
SELECT
    country,
    ROUND(AVG(co2_per_capita),2) AS Avg_CO2_Per_Capita,
    ROUND(AVG(energy_per_capita),2) AS Avg_Energy_Per_Capita
FROM globalco2_stage
WHERE co2_per_capita IS NOT NULL
AND energy_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_CO2_Per_Capita DESC
LIMIT 10;

-- Consumption CO₂ ******************************************

-- Top 10 Countries by Total Consumption CO₂
SELECT
    country,
    ROUND(SUM(consumption_co2),2) AS Total_Consumption_CO2
FROM globalco2_stage
WHERE consumption_co2 IS NOT NULL
GROUP BY country
ORDER BY Total_Consumption_CO2 DESC
LIMIT 10;

-- Global Consumption CO₂ Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(consumption_co2),2) AS Global_Consumption_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

--  Top 10 Countries by Consumption CO₂ in 2021
SELECT
    country,
    ROUND(consumption_co2,2) AS Consumption_CO2_2021
FROM globalco2_stage
WHERE year = 2021
AND consumption_co2 IS NOT NULL
ORDER BY consumption_co2 DESC
LIMIT 10;

-- Consumption CO₂ Growth by Country (1971–2021)
SELECT
    country,
    MIN(consumption_co2) AS Consumption_CO2_1971,
    MAX(consumption_co2) AS Consumption_CO2_2021,
    ROUND(MAX(consumption_co2)-MIN(consumption_co2),2) AS Consumption_CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Consumption_CO2_Growth DESC
LIMIT 10;

--  Average Consumption CO₂ by Country
SELECT
    country,
    ROUND(AVG(consumption_co2),2) AS Avg_Consumption_CO2
FROM globalco2_stage
WHERE consumption_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Consumption_CO2 DESC
LIMIT 10;

-- Consumption CO₂ Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(consumption_co2,2) AS Consumption_CO2
FROM globalco2
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    SUM(consumption_co2) AS Total_Consumption_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_Consumption_CO2 DESC
LIMIT 10
) t
)
ORDER BY year, country;

--  Rank Countries by Consumption CO₂
SELECT
    country,
    ROUND(SUM(consumption_co2),2) AS Total_Consumption_CO2,
    RANK() OVER(ORDER BY SUM(consumption_co2) DESC) AS Consumption_CO2_Rank
FROM globalco2_stage
GROUP BY country;

-- Top Consumption CO₂ Emitting Country Each Year
WITH ConsumptionRank AS
(
    SELECT
        year,
        country,
        consumption_co2,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY consumption_co2 DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    consumption_co2
FROM ConsumptionRank
WHERE rnk = 1
ORDER BY year;

-- Total Consumption CO₂ by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(consumption_co2),2) AS Total_Consumption_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

-- Top 10 Countries by Consumption CO₂ Per Capita
SELECT
    country,
    ROUND(AVG(consumption_co2_per_capita),3) AS Avg_Consumption_CO2_Per_Capita
FROM globalco2_stage
WHERE consumption_co2_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Consumption_CO2_Per_Capita DESC
LIMIT 10;

-- Land Use Change CO₂ *************************************************************
-- Top 10 Countries by Total Land Use Change CO₂
SELECT
    country,
    ROUND(SUM(land_use_change_co2),2) AS Total_Land_Use_CO2
FROM globalco2_stage
WHERE land_use_change_co2 IS NOT NULL
GROUP BY country
ORDER BY Total_Land_Use_CO2 DESC
LIMIT 10;
--  Global Land Use Change CO₂ Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(land_use_change_co2),2) AS Global_Land_Use_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

--  Top 10 Countries by Land Use Change CO₂ in 2021
SELECT
    country,
    ROUND(land_use_change_co2,2) AS Land_Use_CO2_2021
FROM globalco2_stage
WHERE year = 2021
AND land_use_change_co2 IS NOT NULL
ORDER BY land_use_change_co2 DESC
LIMIT 10;
--  Land Use Change CO₂ Growth by Country (1971–2021)
SELECT
    country,
    MIN(land_use_change_co2) AS Land_Use_CO2_1971,
    MAX(land_use_change_co2) AS Land_Use_CO2_2021,
    ROUND(MAX(land_use_change_co2)-MIN(land_use_change_co2),2) AS Land_Use_CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Land_Use_CO2_Growth DESC
LIMIT 10;
--  Average Land Use Change CO₂ by Country
SELECT
    country,
    ROUND(AVG(land_use_change_co2),2) AS Avg_Land_Use_CO2
FROM globalco2_stage
WHERE land_use_change_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Land_Use_CO2 DESC
LIMIT 10;
--  Land Use Change CO₂ Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(land_use_change_co2,2) AS Land_Use_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    SUM(land_use_change_co2) AS Total_Land_Use_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_Land_Use_CO2 DESC
LIMIT 10
) t
)
ORDER BY year, country;
--  Rank Countries by Land Use Change CO₂
SELECT
    country,
    ROUND(SUM(land_use_change_co2),2) AS Total_Land_Use_CO2,
    RANK() OVER (ORDER BY SUM(land_use_change_co2) DESC) AS Land_Use_CO2_Rank
FROM globalco2_stage
GROUP BY country;
--  Top Land Use Change CO₂ Emitting Country Each Year
WITH LandUseRank AS
(
    SELECT
        year,
        country,
        land_use_change_co2,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY land_use_change_co2 DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    land_use_change_co2
FROM LandUseRank
WHERE rnk = 1
ORDER BY year;
--  Total Land Use Change CO₂ by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(land_use_change_co2),2) AS Total_Land_Use_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;
-- Top 10 Countries by Land Use Change CO₂ Per Capita
SELECT
    country,
    ROUND(AVG(land_use_change_co2_per_capita),3) AS Avg_Land_Use_CO2_Per_Capita
FROM globalco2_stage
WHERE land_use_change_co2_per_capita IS NOT NULL
GROUP BY country
ORDER BY Avg_Land_Use_CO2_Per_Capita DESC
LIMIT 10;

-- Trade CO₂ ***************************************
-- Top 10 Countries by Total Trade CO₂
SELECT
    country,
    ROUND(SUM(trade_co2),2) AS Total_Trade_CO2
FROM globalco2_stage
WHERE trade_co2 IS NOT NULL
GROUP BY country
ORDER BY Total_Trade_CO2 DESC
LIMIT 10;
--  Global Trade CO₂ Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(trade_co2),2) AS Global_Trade_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

-- Top 10 Countries by Trade CO₂ in 2021
SELECT
    country,
    ROUND(trade_co2,2) AS Trade_CO2_2021
FROM globalco2
WHERE year = 2021
AND trade_co2 IS NOT NULL
ORDER BY trade_co2 DESC
LIMIT 10;

-- Trade CO₂ Growth by Country (1971–2021)
SELECT
    country,
    MIN(trade_co2) AS Trade_CO2_1971,
    MAX(trade_co2) AS Trade_CO2_2021,
    ROUND(MAX(trade_co2)-MIN(trade_co2),2) AS Trade_CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Trade_CO2_Growth DESC
LIMIT 10;

-- Average Trade CO₂ by Country
SELECT
    country,
    ROUND(AVG(trade_co2),2) AS Avg_Trade_CO2
FROM globalco2_stage
WHERE trade_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Trade_CO2 DESC
LIMIT 10;

-- Trade CO₂ Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(trade_co2,2) AS Trade_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    SUM(trade_co2) AS Total_Trade_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_Trade_CO2 DESC
LIMIT 10
) t
)
ORDER BY year, country;

--  Rank Countries by Trade CO₂
SELECT
    country,
    ROUND(SUM(trade_co2),2) AS Total_Trade_CO2,
    RANK() OVER(ORDER BY SUM(trade_co2) DESC) AS Trade_CO2_Rank
FROM globalco2_stage
GROUP BY country;

-- Top Trade CO₂ Emitting Country Each Year
WITH TradeRank AS
(
    SELECT
        year,
        country,
        trade_co2,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY trade_co2 DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    trade_co2
FROM TradeRank
WHERE rnk = 1
ORDER BY year;

--  Total Trade CO₂ by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(trade_co2),2) AS Total_Trade_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

--  Top 10 Countries by Trade CO₂ Share
SELECT
    country,
    ROUND(AVG(trade_co2_share),2) AS Avg_Trade_CO2_Share
FROM globalco2_stage
WHERE trade_co2_share IS NOT NULL
GROUP BY country
ORDER BY Avg_Trade_CO2_Share DESC
LIMIT 10;

-- Global CO₂ Share (share_global_co2) in the same format as your SQL project.

-- Top 10 Countries by Average Global CO₂ Share
SELECT
    country,
    ROUND(AVG(share_global_co2),2) AS Avg_Global_CO2_Share
FROM globalco2_stage
WHERE share_global_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Global_CO2_Share DESC
LIMIT 10;

--  Global CO₂ Share Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(share_global_co2),2) AS Global_CO2_Share
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

--  Top 10 Countries by Global CO₂ Share in 2021
SELECT
    country,
    ROUND(share_global_co2,2) AS Global_CO2_Share_2021
FROM globalco2_stage
WHERE year = 2021
AND share_global_co2 IS NOT NULL
ORDER BY share_global_co2 DESC
LIMIT 10;

--  Global CO₂ Share Growth by Country (1971–2021)
SELECT
    country,
    MIN(share_global_co2) AS Share_1971,
    MAX(share_global_co2) AS Share_2021,
    ROUND(MAX(share_global_co2)-MIN(share_global_co2),2) AS Share_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Share_Growth DESC
LIMIT 10;

-- Average Global CO₂ Share by Country
SELECT
    country,
    ROUND(AVG(share_global_co2),2) AS Avg_Global_CO2_Share
FROM globalco2_stage
WHERE share_global_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Global_CO2_Share DESC
LIMIT 10;

-- Global CO₂ Share Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(share_global_co2,2) AS Global_CO2_Share
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    AVG(share_global_co2) AS Avg_Share
FROM globalco2_stage
GROUP BY country
ORDER BY Avg_Share DESC
LIMIT 10
) t
)
ORDER BY year, country;

--  Rank Countries by Global CO₂ Share
SELECT
    country,
    ROUND(AVG(share_global_co2),2) AS Avg_Global_CO2_Share,
    RANK() OVER(ORDER BY AVG(share_global_co2) DESC) AS Share_Rank
FROM globalco2_stage
GROUP BY country;

--  Country with Highest Global CO₂ Share Each Year
WITH ShareRank AS
(
    SELECT
        year,
        country,
        share_global_co2,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY share_global_co2 DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    share_global_co2
FROM ShareRank
WHERE rnk = 1
ORDER BY year;

--  Average Global CO₂ Share by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(AVG(share_global_co2),2) AS Avg_Global_CO2_Share
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;
-- Compare Global CO₂ Share with Total CO₂ Emissions
SELECT
    country,
    ROUND(AVG(share_global_co2),2) AS Avg_Global_CO2_Share,
    ROUND(SUM(co2),2) AS Total_CO2
FROM globalco2_stage
WHERE share_global_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Global_CO2_Share DESC
LIMIT 10;

-- Global Coal CO₂ Share  **********************************************

--  Top 10 Countries by Average Global Coal CO₂ Share
SELECT
    country,
    ROUND(AVG(share_global_coal_co2),2) AS Avg_Global_Coal_Share
FROM globalco2_stage
WHERE share_global_coal_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Global_Coal_Share DESC
LIMIT 10;

--  Global Coal CO₂ Share Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(share_global_coal_co2),2) AS Global_Coal_Share
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;

-- Top 10 Countries by Global Coal CO₂ Share in 2021
SELECT
    country,
    ROUND(share_global_coal_co2,2) AS Global_Coal_Share_2021
FROM globalco2_stage
WHERE year = 2021
AND share_global_coal_co2 IS NOT NULL
ORDER BY share_global_coal_co2 DESC
LIMIT 10;

--  Global Coal CO₂ Share Growth by Country (1971–2021)
SELECT
    country,
    MIN(share_global_coal_co2) AS Share_1971,
    MAX(share_global_coal_co2) AS Share_2021,
    ROUND(MAX(share_global_coal_co2)-MIN(share_global_coal_co2),2) AS Share_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Share_Growth DESC
LIMIT 10;

-- Average Global Coal CO₂ Share by Country
SELECT
    country,
    ROUND(AVG(share_global_coal_co2),2) AS Avg_Global_Coal_Share
FROM globalco2_stage
WHERE share_global_coal_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Global_Coal_Share DESC
LIMIT 10;

--  Global Coal CO₂ Share Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(share_global_coal_co2,2) AS Global_Coal_Share
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    AVG(share_global_coal_co2) AS Avg_Share
FROM globalco2_stage
GROUP BY country
ORDER BY Avg_Share DESC
LIMIT 10
) t
)
ORDER BY year, country;

-- Rank Countries by Global Coal CO₂ Share
SELECT
    country,
    ROUND(AVG(share_global_coal_co2),2) AS Avg_Global_Coal_Share,
    RANK() OVER(ORDER BY AVG(share_global_coal_co2) DESC) AS Coal_Share_Rank
FROM globalco2_stage
GROUP BY country;
-- Country with Highest Global Coal CO₂ Share Each Year
WITH CoalShareRank AS
(
    SELECT
        year,
        country,
        share_global_coal_co2,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY share_global_coal_co2 DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    share_global_coal_co2
FROM CoalShareRank
WHERE rnk = 1
ORDER BY year;

--  Average Global Coal CO₂ Share by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(AVG(share_global_coal_co2),2) AS Avg_Global_Coal_Share
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;

--  Compare Global Coal CO₂ Share with Coal CO₂ Emissions
SELECT
    country,
    ROUND(AVG(share_global_coal_co2),2) AS Avg_Global_Coal_Share,
    ROUND(SUM(coal_co2),2) AS Total_Coal_CO2
FROM globalco2_stage
WHERE share_global_coal_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Global_Coal_Share DESC
LIMIT 10;

-- Global Coal CO₂ Share 

--  Top 10 Countries by Average Global Coal CO₂ Share
SELECT
    country,
    ROUND(AVG(share_global_coal_co2),2) AS Avg_Global_Coal_Share
FROM globalco2_stage
WHERE share_global_coal_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Global_Coal_Share DESC
LIMIT 10;
-- Global Coal CO₂ Share Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(share_global_coal_co2),2) AS Global_Coal_Share
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;
-- Top 10 Countries by Global Coal CO₂ Share in 2021
SELECT
    country,
    ROUND(share_global_coal_co2,2) AS Global_Coal_Share_2021
FROM globalco2_stage
WHERE year = 2021
AND share_global_coal_co2 IS NOT NULL
ORDER BY share_global_coal_co2 DESC
LIMIT 10;
-- Global Coal CO₂ Share Growth by Country (1971–2021)
SELECT
    country,
    MIN(share_global_coal_co2) AS Share_1971,
    MAX(share_global_coal_co2) AS Share_2021,
    ROUND(MAX(share_global_coal_co2)-MIN(share_global_coal_co2),2) AS Share_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Share_Growth DESC
LIMIT 10;
--  Average Global Coal CO₂ Share by Country
SELECT
    country,
    ROUND(AVG(share_global_coal_co2),2) AS Avg_Global_Coal_Share
FROM globalco2_stage
WHERE share_global_coal_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Global_Coal_Share DESC
LIMIT 10;
-- Global Coal CO₂ Share Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(share_global_coal_co2,2) AS Global_Coal_Share
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    AVG(share_global_coal_co2) AS Avg_Share
FROM globalco2_stage
GROUP BY country
ORDER BY Avg_Share DESC
LIMIT 10
) t
)
ORDER BY year, country;
--  Rank Countries by Global Coal CO₂ Share
SELECT
    country,
    ROUND(AVG(share_global_coal_co2),2) AS Avg_Global_Coal_Share,
    RANK() OVER(ORDER BY AVG(share_global_coal_co2) DESC) AS Coal_Share_Rank
FROM globalco2_stage
GROUP BY country;
--  Country with Highest Global Coal CO₂ Share Each Year
WITH CoalShareRank AS
(
    SELECT
        year,
        country,
        share_global_coal_co2,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY share_global_coal_co2 DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    share_global_coal_co2
FROM CoalShareRank
WHERE rnk = 1
ORDER BY year;
-- Average Global Coal CO₂ Share by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(AVG(share_global_coal_co2),2) AS Avg_Global_Coal_Share
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY FLOOR(year/10)*10
ORDER BY Decade;
-- Compare Global Coal CO₂ Share with Coal CO₂ Emissions
SELECT
    country,
    ROUND(AVG(share_global_coal_co2),2) AS Avg_Global_Coal_Share,
    ROUND(SUM(coal_co2),2) AS Total_Coal_CO2
FROM globalco2_stage
WHERE share_global_coal_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Global_Coal_Share DESC
LIMIT 10;

-- Temperature Change using the columns:         ********************************************************
-- temperature_change_from_co2
-- temperature_change_from_ch4
-- temperature_change_from_n2o
-- temperature_change_from_ghg  ((( IN EXCEL )))
--  Top 10 Countries by Average Temperature Change (GHG)
SELECT
    country,
    ROUND(AVG(temperature_change_from_ghg),3) AS Avg_Temperature_Change
FROM globalco2_stage
WHERE temperature_change_from_ghg IS NOT NULL
GROUP BY country
ORDER BY Avg_Temperature_Change DESC
LIMIT 10;
-- Global Temperature Change Trend (1971–2021)
SELECT
    year,
    ROUND(AVG(temperature_change_from_ghg),3) AS Global_Temperature_Change
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;
--  Top 10 Countries by Temperature Change in 2021
SELECT
    country,
    ROUND(temperature_change_from_ghg,3) AS Temperature_Change_2021
FROM globalco2_stage
WHERE year = 2021
AND temperature_change_from_ghg IS NOT NULL
ORDER BY temperature_change_from_ghg DESC
LIMIT 10;
--  Temperature Change Growth (1971–2021)
SELECT
    country,
    MIN(temperature_change_from_ghg) AS Temp_1971,
    MAX(temperature_change_from_ghg) AS Temp_2021,
    ROUND(MAX(temperature_change_from_ghg)-MIN(temperature_change_from_ghg),3) AS Temperature_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Temperature_Growth DESC
LIMIT 10;
-- Average CO₂ Temperature Change
SELECT
    country,
    ROUND(AVG(temperature_change_from_co2),3) AS Avg_CO2_Temp_Change
FROM globalco2_stage
WHERE temperature_change_from_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_CO2_Temp_Change DESC
LIMIT 10;
--  Average Methane Temperature Change
SELECT
    country,
    ROUND(AVG(temperature_change_from_ch4),3) AS Avg_CH4_Temp_Change
FROM globalco2_stage
WHERE temperature_change_from_ch4 IS NOT NULL
GROUP BY country
ORDER BY Avg_CH4_Temp_Change DESC
LIMIT 10;
-- Average Nitrous Oxide Temperature Change
SELECT
    country,
    ROUND(AVG(temperature_change_from_n2o),3) AS Avg_N2O_Temp_Change
FROM globalco2_stage
WHERE temperature_change_from_n2o IS NOT NULL
GROUP BY country
ORDER BY Avg_N2O_Temp_Change DESC
LIMIT 10;
-- Rank Countries by Temperature Change
SELECT
    country,
    ROUND(AVG(temperature_change_from_ghg),3) AS Avg_Temperature,
    RANK() OVER(
        ORDER BY AVG(temperature_change_from_ghg) DESC
    ) AS Temperature_Rank
FROM globalco2_stage
GROUP BY country;
-- Country with Highest Temperature Change Each Year
WITH TempRank AS
(
    SELECT
        year,
        country,
        temperature_change_from_ghg,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY temperature_change_from_ghg DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    temperature_change_from_ghg
FROM TempRank
WHERE rnk = 1
ORDER BY year;


-- Temperature Change by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(AVG(temperature_change_from_ghg),3) AS Avg_Temperature
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY Decade
ORDER BY Decade;
--  Compare CO₂, CH₄, and N₂O Temperature Contributions
SELECT
    country,
    ROUND(AVG(temperature_change_from_co2),3) AS CO2,
    ROUND(AVG(temperature_change_from_ch4),3) AS CH4,
    ROUND(AVG(temperature_change_from_n2o),3) AS N2O
FROM globalco2_stage
GROUP BY country
ORDER BY CO2 DESC
LIMIT 10;

-- Cumulative CO₂ 

--  Top 10 Countries by Total Cumulative CO₂
SELECT
    country,
    ROUND(MAX(cumulative_co2),2) AS Total_Cumulative_CO2
FROM globalco2_stage
WHERE cumulative_co2 IS NOT NULL
GROUP BY country
ORDER BY Total_Cumulative_CO2 DESC
LIMIT 10;
-- Global Cumulative CO₂ Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(cumulative_co2),2) AS Global_Cumulative_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;
-- Top 10 Countries by Cumulative CO₂ in 2021
SELECT
    country,
    ROUND(cumulative_co2,2) AS Cumulative_CO2_2021
FROM globalco2_stage
WHERE year = 2021
AND cumulative_co2 IS NOT NULL
ORDER BY cumulative_co2 DESC
LIMIT 10;
-- Cumulative CO₂ Growth by Country (1971–2021)
SELECT
    country,
    MIN(cumulative_co2) AS CO2_1971,
    MAX(cumulative_co2) AS CO2_2021,
    ROUND(MAX(cumulative_co2)-MIN(cumulative_co2),2) AS Cumulative_CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Cumulative_CO2_Growth DESC
LIMIT 10;
--  Average Cumulative CO₂ by Country
SELECT
    country,
    ROUND(AVG(cumulative_co2),2) AS Avg_Cumulative_CO2
FROM globalco2_stage
WHERE cumulative_co2 IS NOT NULL
GROUP BY country
ORDER BY Avg_Cumulative_CO2 DESC
LIMIT 10;
-- Cumulative CO₂ Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(cumulative_co2,2) AS Cumulative_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    MAX(cumulative_co2) AS Total_Cumulative_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_Cumulative_CO2 DESC
LIMIT 10
) t
)
ORDER BY year, country;
-- Rank Countries by Cumulative CO₂
SELECT
    country,
    ROUND(MAX(cumulative_co2),2) AS Total_Cumulative_CO2,
    RANK() OVER(ORDER BY MAX(cumulative_co2) DESC) AS Cumulative_CO2_Rank
FROM globalco2_stage
GROUP BY country;
--  Country with Highest Cumulative CO₂ Each Year
WITH CumulativeRank AS
(
    SELECT
        year,
        country,
        cumulative_co2,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY cumulative_co2 DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    cumulative_co2
FROM CumulativeRank
WHERE rnk = 1
ORDER BY year;
-- Cumulative CO₂ by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(MAX(cumulative_co2),2) AS Cumulative_CO2
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY Decade
ORDER BY Decade;
-- Compare Cumulative CO₂ with Annual CO₂
SELECT
    country,
    ROUND(MAX(cumulative_co2),2) AS Cumulative_CO2,
    ROUND(SUM(co2),2) AS Annual_CO2
FROM globalco2_stage
WHERE cumulative_co2 IS NOT NULL
GROUP BY country
ORDER BY Cumulative_CO2 DESC
LIMIT 10;

-- CO₂ Growth (co2_growth_abs and co2_growth_prct)

-- Top 10 Countries by Total CO₂ Growth (Absolute)
SELECT
    country,
    ROUND(SUM(co2_growth_abs),2) AS Total_CO2_Growth
FROM globalco2_stage
WHERE co2_growth_abs IS NOT NULL
GROUP BY country
ORDER BY Total_CO2_Growth DESC
LIMIT 10;
-- Global CO₂ Growth Trend (1971–2021)
SELECT
    year,
    ROUND(SUM(co2_growth_abs),2) AS Global_CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY year
ORDER BY year;
--  Top 10 Countries by CO₂ Growth in 2021
SELECT
    country,
    ROUND(co2_growth_abs,2) AS CO2_Growth_2021
FROM globalco2_stage
WHERE year = 2021
AND co2_growth_abs IS NOT NULL
ORDER BY co2_growth_abs DESC
LIMIT 10;
-- Top 10 Countries by CO₂ Growth Percentage
SELECT
    country,
    ROUND(AVG(co2_growth_prct),2) AS Avg_CO2_Growth_Percentage
FROM globalco2_stage
WHERE co2_growth_prct IS NOT NULL
GROUP BY country
ORDER BY Avg_CO2_Growth_Percentage DESC
LIMIT 10;
--  Average CO₂ Growth by Country
SELECT
    country,
    ROUND(AVG(co2_growth_abs),2) AS Avg_CO2_Growth
FROM globalco2_stage
WHERE co2_growth_abs IS NOT NULL
GROUP BY country
ORDER BY Avg_CO2_Growth DESC
LIMIT 10;
-- CO₂ Growth Trend for Top 10 Countries
SELECT
    year,
    country,
    ROUND(co2_growth_abs,2) AS CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
AND country IN
(
SELECT country
FROM
(
SELECT
    country,
    SUM(co2_growth_abs) AS Total_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY country
ORDER BY Total_Growth DESC
LIMIT 10
) t
)
ORDER BY year, country;
-- Rank Countries by CO₂ Growth
SELECT
    country,
    ROUND(SUM(co2_growth_abs),2) AS Total_CO2_Growth,
    RANK() OVER (ORDER BY SUM(co2_growth_abs) DESC) AS Growth_Rank
FROM globalco2_stage
GROUP BY country;
-- Country with Highest CO₂ Growth Each Year
WITH GrowthRank AS
(
    SELECT
        year,
        country,
        co2_growth_abs,
        DENSE_RANK() OVER
        (
            PARTITION BY year
            ORDER BY co2_growth_abs DESC
        ) AS rnk
    FROM globalco2_stage
)
SELECT
    year,
    country,
    co2_growth_abs
FROM GrowthRank
WHERE rnk = 1
ORDER BY year;
--  CO₂ Growth by Decade
SELECT
    FLOOR(year/10)*10 AS Decade,
    ROUND(SUM(co2_growth_abs),2) AS Total_CO2_Growth
FROM globalco2_stage
WHERE year BETWEEN 1971 AND 2021
GROUP BY Decade
ORDER BY Decade;
--  Compare CO₂ Growth and Total CO₂
SELECT
    country,
    ROUND(SUM(co2_growth_abs),2) AS Total_CO2_Growth,
    ROUND(SUM(co2),2) AS Total_CO2
FROM globalco2_stage
GROUP BY country
ORDER BY Total_CO2_Growth DESC
LIMIT 10;

-- Average ******************
-- Average GDP by Country
SELECT country,
       AVG(gdp) AS avg_gdp
FROM globalco2_stage
GROUP BY country;
-- Average Population
SELECT AVG(population) AS avg_population
FROM globalco2_stage;
-- Total Oil CO₂
SELECT SUM(oil_co2) AS total_oil_co2
FROM globalco2_stage;
-- Maximum Methane Emission
SELECT MAX(methane) AS highest_methane
FROM globalco2_stage;
-- Minimum Energy Consumption
SELECT MIN(primary_energy_consumption) AS minimum_energy
FROM globalco2_stage;
-- Count Countries
SELECT COUNT(DISTINCT country) AS total_countries
FROM globalco2_stage;
-- Average CO₂ Per Capita
SELECT AVG(co2_per_capita) AS avg_co2_per_capita
FROM globalco2_stage;
-- Total Population by Year
SELECT year,
       SUM(population) AS world_population
FROM globalco2_stage
GROUP BY year
ORDER BY year;
-- Top 5 Countries by GDP in 2022
SELECT country, gdp
FROM globalco2_stage
WHERE year = 2022
ORDER BY gdp DESC
LIMIT 5;
-- Countries with CO₂ Per Capita > 10
SELECT country, year, co2_per_capita
FROM globalco2_stage
WHERE co2_per_capita > 10;

-- ---------------------------------------------------------------------------------------------------------------------
--        ---------------------- END -----------------
--  -------------------------------------------------------------------------------------------------------------------------
