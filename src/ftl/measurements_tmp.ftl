delete from measurements_tmp;

COPY measurements_tmp(species, gender, trainingStatus, VO2max, tissue, fiberType, exType, exDuration_sec, exDuration_min,
                      exIntencity_VO2max, cofactor, target, targetOriginal, impactType, misc1, foldChange, activationTime_min,
                      timePoint_hours, misc2, misc3, target0, target1, measureUnit, methodOfMeasurement, commentary, ref, PMID, reference)
FROM 'C:\projects\java\be5_sites\muscle_data\measurements\SignalingPathwaysFoldChange.csv' DELIMITER ';' CSV HEADER;

 