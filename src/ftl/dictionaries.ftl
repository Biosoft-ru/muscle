DELETE FROM organisms;
INSERT INTO organisms(id, title, latin) VALUES('1', 'human', 'Homo sapience');
INSERT INTO organisms(id, title, latin) VALUES('2', 'mouse', 'Mus musculus');
INSERT INTO organisms(id, title, latin) VALUES('3', 'rat',   'Rattus norvegicus');

DELETE FROM platforms;
INSERT INTO platforms(id, title, GPL) VALUES('1', 'Illumina HiSeq 2500',   'GPL16791');
INSERT INTO platforms(id, title, GPL) VALUES('2', 'Illumina NextSeq 500',  'GPL18573');
INSERT INTO platforms(id, title, GPL) VALUES('3', 'Illumina HiSeq 2000',   'GPL11154');
INSERT INTO platforms(id, title, GPL) VALUES('4', 'Illumina_MiSeq',        'GPL15520');

DELETE FROM tissues;
INSERT INTO tissues(id, title)         VALUES('1', 'skeletal muscle');
INSERT INTO tissues(id, title, parent) VALUES('2', 'muscle vastus lateralis', 1);

DELETE FROM treatments;

-- GSE 120862
INSERT INTO treatments(id, title, description) VALUES('1', 'aerobic training',
${'Aerobic training programme (2 month, 1 h/day, 5 sessions/week). 
An exercise session (60 min, one-legged knee extension, ~65% of maximal power in the one-legged ramp test).'?str} );

INSERT INTO treatments(id, title, description) VALUES('2', 'aerobic exercise (60 min, 65% of maximal power)',
${'An exercise session (60 min, one-legged knee extension, ~65% of maximal power in the one-legged ramp test) 
started 2 h 35 min after a standardized breakfast. The participants ate a standardized lunch 1 h 20 min after the exercise session.'?str} ); 

-- GSE86931
INSERT INTO treatments(id, title) VALUES('3', 'acute intensive cycling session (70 min, 70% V O2 max)' );

-- GSE107934
INSERT INTO treatments(id, title) VALUES('4', 'Acute Aerobic Exercise' );
INSERT INTO treatments(id, title) VALUES('5', 'Acute Resistance Exercise' );

-- GSE60591
INSERT INTO treatments(id, title, description) VALUES('6', 'training',
${'Twenty-three young, sedentary volunteers (Table 1) trained only one randomized leg during 3 months, and the other leg was used as an untrained intraindividual control leg. Two one-legged knee-extension performance tests were conducted before and after the training period. Skeletal muscle biopsies from vastus lateralis were taken before and 24h after the last training session from both legs. The post-training performance tests were conducted 3–6 d after the biopsies.'?str} );

-- GSE141827
INSERT INTO treatments(id, title, description) VALUES('7', 'unloading',
'Unloading ...' );

INSERT INTO treatments(id, title, description) VALUES('8', 'recovery after unloading during 7 days',
'Recovery after unloading during 7 days.' );

-- GSE99693
INSERT INTO treatments(id, title, description) VALUES('9', 'exercise, high-fat diet',
'Exercise; high-fat diet in combination with resistance exercise (Ex-HFD)');

INSERT INTO treatments(id, title, description) VALUES('10', 'sedentary, high-fat diet',
'Sedentary; high-fat diet alone (Sed-HFD)');

-- GSE134698
INSERT INTO treatments(id, title, description) VALUES('11', 'rehabilitation training',
'Exercise therapy in skeletal muscle from heart failure patients with reduced ejection fraction.');

