DELETE FROM organisms;
INSERT INTO organisms(id, title, latin) VALUES('1', 'human', 'Homo sapience');
INSERT INTO organisms(id, title, latin) VALUES('2', 'mouse', 'Mus musculus');
INSERT INTO organisms(id, title, latin) VALUES('3', 'rat',   'Rattus norvegicus');

DELETE FROM platforms;
INSERT INTO platforms(id, title, GPL) VALUES('1', 'Illumina HiSeq 2500', 'GPL16791');
INSERT INTO platforms(id, title, GPL) VALUES('2', 'Illumina NextSeq 500', 'GPL18573');

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