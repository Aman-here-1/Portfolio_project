-- total cases vs total deaths

--select location, date, population,total_cases, total_deaths, (total_death/total_cases) from Covid_death

-- total caes vs population
--% of population affetcted by covid
select location, date, population,total_cases, (total_cases/population)*100 as cases_percentage from Covid_death
where location like '%British Virgin Islands' and continent is not null
order by 1,2

--% of death over population affetcted by covid
select location, date, population,total_cases, (total_deaths/population)*100 as death_percentage from Covid_death
--where location like '%British Virgin Islands' 
where continent is not null
order by 1,2

--country with highest infected rate
select location, population,max(total_cases) highest_count, max((total_cases/population)) * 100 as highest_rate from Covid_death
where continent is not null
group by location, population
order by highest_rate desc

-- highest death count per population
select location, population, max(total_deaths) highest_death, max((total_deaths/population)) * 100 as death_rate from Covid_death
where continent is not null
group by location, population
order by highest_death desc

-- highest death count per population
select location, max(total_deaths) as highest_death from Covid_death
where continent is not null
group by location
order by highest_death desc

-- break by continent
select continent, max(total_deaths) as highest_death from Covid_death
where continent is not null
group by continent
order by highest_death desc


-- showing continent with highest death count per population

select continent, max(total_deaths) as highest_death from Covid_death
where continent is not null
group by continent
order by highest_death desc


-- global number of new cases and new deaths

select date, sum(new_cases), sum(new_deaths), (sum(new_deaths)/sum(new_cases)) from Covid_death
--where location like '%British Virgin Islands' 
where continent is not null
group by date
order by 1,2

