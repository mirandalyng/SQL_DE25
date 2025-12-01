--LEFT JOIN 
--works in ui VSC not in Dudkdb ui 
SELECT
    *
FROM
    plants p
    LEFT JOIN plant_care pc ON p.plant_id = pc.plant_id;

--this works 
SELECT
    *
FROM
    plants p
    LEFT JOIN plant_care pc USING (plant_id);

SELECT
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM
    plants p
    LEFT JOIN plant_care pc ON p.plant_id = pc.plant_id;

--RIGHT JOIN 
--specifiy columns 
SELECT
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM
    plants p
    RIGHT JOIN plant_care pc ON p.plant_id = pc.plant_id;

--FULL JOIN   
SELECT
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM
    plants p
    FULL JOIN plant_care pc ON p.plant_id = pc.plant_id;

--CROSS JOIN 
SELECT
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM
    plants p
    CROSS JOIN plant_care pc;