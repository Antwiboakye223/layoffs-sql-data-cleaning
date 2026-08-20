select *
from layoffs ;

create table layoffs_staging 
like  layoffs
;

select *
from layoffs_staging ;


insert layoffs_staging 
select *
from layoffs;


select *,
ROW_NUMBER () OVER (
partition by company,industry,total_laid_off,percentage_laid_off,`date`) as row_num
from layoffs_staging ;


WITH DUPLICATE_CTE AS
(
select *,
ROW_NUMBER () OVER (
partition by company,location ,industry,total_laid_off,percentage_laid_off,`date`,
stage,country,funds_raised_millions) as row_num
from layoffs_staging 
)
SELECT*
FROM DUPLICATE_CTE
WHERE row_num > 1;




WITH DUPLICATE_CTE AS
(
select *,
ROW_NUMBER () OVER (
partition by company,location ,industry,total_laid_off,percentage_laid_off,`date`,
stage,country,funds_raised_millions) as row_num
from layoffs_staging 
)
Delete 
FROM DUPLICATE_CTE
WHERE row_num > 1;



CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from layoffs_staging2
where row_num >1;


insert into layoffs_staging2 
select *,
ROW_NUMBER () OVER (
partition by company,location ,industry,total_laid_off,percentage_laid_off,`date`,
stage,country,funds_raised_millions) as row_num
from layoffs_staging
where row_num > 1;


delete
from layoffs_staging2
where row_num >1;


select*
from layoffs_staging2;
   
   
   
   
   
   
   
   
   
   
   
   

-- standardizing data 
select company, Trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company );

select *
from layoffs_staging2
where industry like 'crypto%';



update layoffs_staging2
set industry ='crypto'
where industry like 'crypto%';

select distinct country, trim(trailing '.' from country) 
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'united states%';





select `date`
from layoffs_staging2;



update layoffs_staging2
set `date` = str_to_date(`date`,'%m/%d/%Y');


Alter table layoffs_staging2
modify column `date` DATE;



update layoffs_staging2
set industry = null 
where industry = '';


select*
from layoffs_staging2
where total_laid_off IS NULL;

Select *
from layoffs_staging2  t1
join  layoffs_staging2 t2
    on t1.company =t2.company 
     and t1.location = t2.location 
where (t1.industry is null or t1.industry = '')
and t2.industry is not null ;




update layoffs_staging2  t1
join  layoffs_staging2 t2
    on t1.company =t2.company 
set t1.industry= t2.industry 
where t1.industry is null 
and t2.industry is not null;


select *
from layoffs_staging2
where company = 'bally%';



select*
from layoffs_staging2
where total_laid_off IS NULL
and percentage_laid_off is null ;


delete
from layoffs_staging2
where total_laid_off IS NULL
and percentage_laid_off is null ;



select*
from layoffs_staging2;


alter table layoffs_staging2
drop column row_num;