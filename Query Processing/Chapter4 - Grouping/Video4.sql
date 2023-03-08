-------------------------------------
-- LinkedIn Learning ----------------
-- Advanced SQL - Query Processing --
-- Ami Levin 2020 -------------------
-- .\Chapter4\Video4.sql ------------
-------------------------------------

/*
Animal vaccination report
--------------------------

Write a query to report the number of vaccinations each animal has received.
Include animals that were never adopted.
Exclude all rabbits.
Exclude all Rabies vaccinations.
Exclude all animals that were last vaccinated on or after October first, 2019.

The report should return the following attributes:
Animals Name, Species, Primary Color, Breed,
and the number of vaccinations this animal has received,

-- Guidelines
Use the correct logical join types and force order if needed.
Use the  correct logical group by expressions.
*/


use Animal_Shelter;

         select a.Name,
                a.Species,
                MAX(a.Primary_Color),
                MAX(a.Breed),
                COUNT(v.Vaccine)
           from Animals a
left outer join Vaccinations v
             on v.Name = a.Name
            and v.Species = a.Species
          where v.Species <> 'Rabbit' 
            and (v.Vaccine <> 'Rabies' 
                or v.Vaccine IS NULL)  
       group by a.Species, a.Name
         having max(v.Vaccination_Time) < '20191001' or max(v.Vaccination_Time) is null
       order by a.Species, a.Name 