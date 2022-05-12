-- choisir la DB -- 
USE wild_db_quest;

SHOW TABLES;

SELECT *
FROM school;
SELECT * 
FROM wizard;
SELECT * 
FROM team;
SELECT * 
FROM player;

-- Q1: nb de joueur par equipe --
SELECT team.name, COUNT(wizard_id) as nb_player
FROM player
INNER JOIN team ON team.id = player.team_id
GROUP BY team.name
ORDER BY nb_player DESC;


-- Q2: nom des equipes completes par ordre alphabetique --
SELECT team.name
FROM player
INNER JOIN team ON team.id = player.team_id
GROUP BY team.name
HAVING COUNT(wizard_id) >= 14
ORDER BY team.name;

-- Q3: joueur de Gryffondor enrolled on monday -- 
SELECT w.firstname, w.lastname, DATE_FORMAT(p.enrollment_date, "%a") as enrollment_day
FROM player p
INNER JOIN wizard w ON p.wizard_id = w.id
WHERE team_id = 1
HAVING enrollment_day = "Mon" 
ORDER BY enrollment_date;

-- Q3: autre solution -- 

SELECT w.firstname, w.lastname, p.enrollment_date
FROM player p
INNER JOIN wizard w ON p.wizard_id = w.id
WHERE 1 = 1
  AND team_id = 1
  AND DATE_FORMAT(p.enrollment_date, "%a") = "Mon"
ORDER BY enrollment_date;