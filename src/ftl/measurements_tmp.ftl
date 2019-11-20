delete from measurements_tmp;

COPY measurements_tmp(species, gender, trainingStatus, VO2max, tissue, fiberType, exType, exDuration_sec, exDuration_min,
                      exIntencity_VO2max, cofactor, target, targetOriginal, impactType, foldChange, activationTime_min,
                      timePoint_hours, target0, target1, measureUnit, methodOfMeasurement, commentary, ref, reference)
FROM 'C:\projects\java\be5_sites\muscle_data\measurements\SignalingPathwaysFoldChange.csv' DELIMITER ';' CSV HEADER;

 