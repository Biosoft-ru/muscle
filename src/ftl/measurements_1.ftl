delete from measurements_1;

INSERT INTO measurements_1(id, species, gender, trainingStatus, VO2max, tissue, fiberType, 
                           exType, exDuration_sec, exDuration_min, exIntencity_VO2max, 
                           cofactor, target, value, 
                           measureUnit, methodOfMeasurement, commentary, ref, reference, PMID)

    SELECT                             
                           id, species, gender, trainingStatus, VO2max, tissue, fiberType, 
                           exType, exDuration_sec, exDuration_min, exIntencity_VO2max, 
                           cofactor, target, target0, 
                           measureUnit, methodOfMeasurement, commentary, ref, reference, PMID
	FROM measurements_tmp
    WHERE  target0 IS NOT NULL;

INSERT INTO measurements_1(id, species, gender, trainingStatus, VO2max, tissue, fiberType, 
                           cofactor, target, value, 
                           measureUnit, methodOfMeasurement, commentary, ref, reference, PMID)

    SELECT                             
                      1000+id, species, gender, trainingStatus, VO2max, tissue, fiberType, 
                           cofactor, target, target1, 
                           measureUnit, methodOfMeasurement, commentary, ref, reference, PMID
	FROM measurements_tmp
    WHERE  target0 IS NOT NULL;


delete from measurements_1_targets;
INSERT INTO measurements_1_targets(title, target)
    SELECT target, target 
    FROM  measurements_1
    GROUP BY 1
