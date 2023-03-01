-------------------------------------
-- LinkedIn Learning ----------------
-- Advanced SQL - Query Processing --
-- Ami Levin 2020 -------------------
-- .\Chapter2\Video4.sql ------------
-------------------------------------

/*
Animal vaccinations report.
---------------------------
Write a query to report all animals and their vaccinations.
Animals that have not been vaccinated should be included.
The report should include the following attributes:
Animal's name, species, breed, and primary color,
vaccination time and the vaccine name,
the staff member's first name, last name, and role.

Guidelines:
-----------
Use the minimal number of tables required.
Use the correct logical join types and force join order as needed.
*/

USE Animal_Shelter; 

select  A.Name, A.Species, A.Breed, A.Primary_Color, V.Vaccination_Time, V.Vaccine, P.First_Name, P.Last_Name, SA.Role
from    Animals A
        left outer join 
        (Vaccinations V
            INNER JOIN Staff S
                on S.Email = V.Email
            inner join Persons P
                on S.Email = P.Email
            inner join Staff_Assignments SA
                on S.Email = SA.Email
        )
            on A.Name = V.Name
            and 
            A.Species = V.Species;