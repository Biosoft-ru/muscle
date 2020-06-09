<#include 'common'/>

delete from series where GSE='GSE71972';

<#assign SERIES_ID=12>

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(${SERIES_ID}, 'GSE71972', 27061420, ${human}, ${rna_seq},
'Histamine footprint on the human exercise transcriptome', 

${"	Transcriptome wide analysis of the skeletal muscle response to exercise in humans. Subjects performed one 60-min bout of moderate-intensity single-leg knee-extension exercise, and samples were obtained by biopsy of the vastus lateralis muscle before, immediately after, and at 3 hr post-exercise. Eight subjects were control (no drug), and eight received combined H1/H2-histamine receptor blockade prior to exercise."?str},

${"Three time-points in each of 8 control and 8 subjects with histamine receptor-blockade. Time points are before exercise, immediately after exercise, and at 3 hrs post-exercise.

<br/><br/>Symbols in file names: 
<ul>
CON - control without histamine receptor blocade,
HIST - H1/H2-histamine receptor blockade.
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=114  code='CON_13'   sex='female' />
<@individ id=115  code='CON_16'   sex='female' />
<@individ id=116  code='CON_20'   sex='male' />
<@individ id=117  code='CON_3'    sex='male' />
<@individ id=118  code='CON_4'    sex='female' />
<@individ id=119  code='CON_5'    sex='male' />
<@individ id=120  code='CON_8'    sex='female' />
<@individ id=121  code='CON_9'    sex='male' />
<@individ id=122  code='HIST_11'  sex='male' />
<@individ id=123  code='HIST_12'  sex='female' />
<@individ id=124  code='HIST_15'  sex='male' />
<@individ id=125  code='HIST_17'  sex='male' />
<@individ id=126  code='HIST_2'   sex='male' />
<@individ id=127  code='HIST_4'   sex='male' />
<@individ id=128  code='HIST_5'   sex='male' />
<@individ id=129  code='HIST_7'   sex='female' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (53,54,55,56,57,58,59,60,61,62,63,64);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=53 title='female, control, pre_exercises'             status=untrained time=0   treatment='NULL' />
<@condition id=54 title='female, control, immediate_after_exercises' status=untrained time=60  treatment=12 />
<@condition id=55 title='female, control, 3hrs_after_exercises'      status=untrained time=240 treatment=12 />
<@condition id=56 title='female, HIST, pre_exercises'                status=untrained time=0   treatment=13 />
<@condition id=57 title='female, HIST, immediate_after_exercises'    status=untrained time=60  treatment=13 />
<@condition id=58 title='female, HIST, 3hrs_after_exercises'         status=untrained time=240 treatment=13 />
<@condition id=59 title='male, control, pre_exercises'               status=untrained time=0   treatment='NULL' />
<@condition id=60 title='male, control, immediate_after_exercises'   status=untrained time=60  treatment=12 />
<@condition id=61 title='male, control, 3hrs_after_exercises'        status=untrained time=240 treatment=12 />
<@condition id=62 title='male, HIST, pre_exercises'                  status=untrained time=0   treatment=13 />
<@condition id=63 title='male, HIST, immediate_after_exercises'      status=untrained time=60  treatment=13 />
<@condition id=64 title='male, HIST, 3hrs_after_exercises'           status=untrained time=240 treatment=13 />

-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, ${SERIES_ID}, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=55 title='female, pre_exercises, HIST vs control'                             condition1=56 condition2=53 comment='NULL' />
<@comparison id=56 title='female, immediate_after_exercises, HIST vs control'                 condition1=57 condition2=54 comment='NULL' />
<@comparison id=57 title='female, 3hrs_after exercises, HIST vs control'                      condition1=58 condition2=55 comment='NULL' />
<@comparison id=58 title='female, control, immediate_after_exercises vs pre_exercises'        condition1=54 condition2=53 comment='NULL' />
<@comparison id=59 title='female, control, 3hrs_after_exercises vs immediate_after_exercises' condition1=55 condition2=54 comment='NULL' />
<@comparison id=60 title='female, HIST, immediate_after_exercises vs pre_exercises'           condition1=57 condition2=56 comment='NULL' />
<@comparison id=61 title='female, HIST, 3hrs_after_exercises vs immediate_after_exercises'    condition1=58 condition2=57 comment='NULL' />
<@comparison id=62 title='male, pre_exercises, HIST vs control'                               condition1=62 condition2=59 comment='NULL' />
<@comparison id=63 title='male, immediate_after_exercises, HIST vs control'                   condition1=63 condition2=60 comment='NULL' />
<@comparison id=64 title='male, 3hrs_after exercises, HIST vs control'                        condition1=64 condition2=61 comment='NULL' />
<@comparison id=65 title='male, control, immediate_after_exercises vs pre_exercises'          condition1=60 condition2=59 comment='NULL' />
<@comparison id=66 title='male, control, 3hrs_after_exercises vs immediate_after_exercises'   condition1=61 condition2=60 comment='NULL' />
<@comparison id=67 title='male, HIST, immediate_after_exercises vs pre_exercises'             condition1=63 condition2=62 comment='NULL' />
<@comparison id=68 title='male, HIST, 3hrs_after_exercises vs immediate_after_exercises'      condition1=64 condition2=63 comment='NULL' />
<@comparison id=69 title='control, pre_exercises, male vs female'                             condition1=59 condition2=53 comment='NULL' />
<@comparison id=70 title='control, immediate_after_exercises, male vs female'                 condition1=60 condition2=54 comment='NULL' />
<@comparison id=71 title='control, 3hrs_after exercises, male vs female'                      condition1=61 condition2=55 comment='NULL' />
<@comparison id=72 title='HIST, pre_exercises, male vs female'                                condition1=62 condition2=56 comment='NULL' />
<@comparison id=73 title='HIST, immediate_after_exercises, male vs female'                    condition1=63 condition2=57 comment='NULL' />
<@comparison id=74 title='HIST, 3hrs_after_exercises, male vs female'                         condition1=64 condition2=58 comment='NULL' />

-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364);
delete from samples where id IN (317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364);

<#macro sample id, GSM, condition, individ, platform, SRA, SRR, avgSpotLen, biosample>
<#local title = condition + '_' + individ>
<#local platform = Illumina_HiSeq_2500 />

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, avgSpotLen, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${avgSpotLen}, ${id}, ${SERIES_ID});

</#macro>

<@sample id=317 GSM='GSM1848779' condition='female, control, immediate_after_exercises' individ=114 SRA='SRX1142615' SRR='SRR2155623' avgSpotLen=100 biosample='SAMN03981978’ />
<@sample id=318 GSM='GSM1848780' condition='female, control, 3hrs_after_exercises'      individ=114 SRA='SRX1142616' SRR='SRR2155624' avgSpotLen=100 biosample='SAMN03981979’ />
<@sample id=319 GSM='GSM1848781' condition='female, control, pre_exercises'             individ=114 SRA='SRX1142617' SRR='SRR2155625' avgSpotLen=100 biosample='SAMN03981980’ />
<@sample id=320 GSM='GSM1848782' condition='female, control, immediate_after_exercises' individ=115 SRA='SRX1142618' SRR='SRR2155626' avgSpotLen=100 biosample='SAMN03981981’ />
<@sample id=321 GSM='GSM1848783' condition='female, control, 3hrs_after_exercises'      individ=115 SRA='SRX1142619' SRR='SRR2155627' avgSpotLen=100 biosample='SAMN03981982’ />
<@sample id=322 GSM='GSM1848784' condition='female, control, pre_exercises'             individ=115 SRA='SRX1142620' SRR='SRR2155628' avgSpotLen=100 biosample='SAMN03981983’ />
<@sample id=323 GSM='GSM1848785' condition='male, control, immediate_after_exercises'   individ=116 SRA='SRX1142621' SRR='SRR2155629' avgSpotLen=100 biosample='SAMN03981955’ />
<@sample id=324 GSM='GSM1848786' condition='male, control, 3hrs_after_exercises'        individ=116 SRA='SRX1142622' SRR='SRR2155630' avgSpotLen=100 biosample='SAMN03981956’ />
<@sample id=325 GSM='GSM1848787' condition='male, control, pre_exercises'               individ=116 SRA='SRX1142623' SRR='SRR2155631' avgSpotLen=100 biosample='SAMN03981957’ />
<@sample id=326 GSM='GSM1848788' condition='male, control, immediate_after_exercises'   individ=117 SRA='SRX1142624' SRR='SRR2155632' avgSpotLen=100 biosample='SAMN03981958’ />
<@sample id=327 GSM='GSM1848789' condition='male, control, 3hrs_after_exercises'        individ=117 SRA='SRX1142625' SRR='SRR2155633' avgSpotLen=100 biosample='SAMN03981959’ />
<@sample id=328 GSM='GSM1848790' condition='male, control, pre_exercises'               individ=117 SRA='SRX1142626' SRR='SRR2155634' avgSpotLen=100 biosample='SAMN03981960’ />
<@sample id=329 GSM='GSM1848791' condition='female, control, immediate_after_exercises' individ=118 SRA='SRX1142627' SRR='SRR2155635' avgSpotLen=100 biosample='SAMN03981961’ />
<@sample id=330 GSM='GSM1848792' condition='female, control, 3hrs_after_exercises'      individ=118 SRA='SRX1142628' SRR='SRR2155636' avgSpotLen=100 biosample='SAMN03981962’ />
<@sample id=331 GSM='GSM1848793' condition='female, control, pre_exercises'             individ=118 SRA='SRX1142629' SRR='SRR2155637' avgSpotLen=100 biosample='SAMN03981963’ />
<@sample id=332 GSM='GSM1848794' condition='male, control, immediate_after_exercises'   individ=119 SRA='SRX1142630' SRR='SRR2155638' avgSpotLen=100 biosample='SAMN03981964’ />
<@sample id=333 GSM='GSM1848795' condition='male, control, 3hrs_after_exercises'        individ=119 SRA='SRX1142631' SRR='SRR2155639' avgSpotLen=100 biosample='SAMN03981965’ />
<@sample id=334 GSM='GSM1848796' condition='male, control, pre_exercises'               individ=119 SRA='SRX1142632' SRR='SRR2155640' avgSpotLen=100 biosample='SAMN03981966’ />
<@sample id=335 GSM='GSM1848797' condition='female, control, immediate_after_exercises' individ=120 SRA='SRX1142633' SRR='SRR2155641' avgSpotLen=100 biosample='SAMN03981967’ />
<@sample id=336 GSM='GSM1848798' condition='female, control, 3hrs_after_exercises'      individ=120 SRA='SRX1142634' SRR='SRR2155642' avgSpotLen=100 biosample='SAMN03981968’ />
<@sample id=337 GSM='GSM1848799' condition='female, control, pre_exercises'             individ=120 SRA='SRX1142635' SRR='SRR2155643' avgSpotLen=100 biosample='SAMN03981969’ />
<@sample id=338 GSM='GSM1848800' condition='male, control, immediate_after_exercises'   individ=121 SRA='SRX1142636' SRR='SRR2155644' avgSpotLen=100 biosample='SAMN03981970’ />
<@sample id=339 GSM='GSM1848801' condition='male, control, 3hrs_after_exercises'        individ=121 SRA='SRX1142637' SRR='SRR2155645' avgSpotLen=100 biosample='SAMN03981971’ />
<@sample id=340 GSM='GSM1848802' condition='male, control, pre_exercises'               individ=121 SRA='SRX1142638' SRR='SRR2155646' avgSpotLen=100 biosample='SAMN03981972’ />
<@sample id=341 GSM='GSM1848803' condition='male, HIST, immediate_after_exercises'      individ=122 SRA='SRX1142639' SRR='SRR2155647' avgSpotLen=100 biosample='SAMN03981973’ />
<@sample id=342 GSM='GSM1848804' condition='male, HIST, 3hrs_after_exercises'           individ=122 SRA='SRX1142640' SRR='SRR2155648' avgSpotLen=100 biosample='SAMN03981974’ />
<@sample id=343 GSM='GSM1848805' condition='male, control, pre_exercises'               individ=122 SRA='SRX1142641' SRR='SRR2155649' avgSpotLen=100 biosample='SAMN03981975’ />
<@sample id=344 GSM='GSM1848806' condition='female, HIST, immediate_after_exercises'    individ=123 SRA='SRX1142642' SRR='SRR2155650' avgSpotLen=100 biosample='SAMN03981976’ />
<@sample id=345 GSM='GSM1848807' condition='female, HIST, 3hrs_after_exercises'         individ=123 SRA='SRX1142643' SRR='SRR2155651' avgSpotLen=100 biosample='SAMN03981977’ />
<@sample id=346 GSM='GSM1848808' condition='female, HIST, pre_exercises'                individ=123 SRA='SRX1142644' SRR='SRR2155652' avgSpotLen=100 biosample='SAMN03981936’ />
<@sample id=347 GSM='GSM1848809' condition='male, HIST, immediate_after_exercises'      individ=124 SRA='SRX1142645' SRR='SRR2155653' avgSpotLen=100 biosample='SAMN03981937’ />
<@sample id=348 GSM='GSM1848810' condition='male, HIST, 3hrs_after_exercises'           individ=124 SRA='SRX1142646' SRR='SRR2155654' avgSpotLen=100 biosample='SAMN03981938’ />
<@sample id=349 GSM='GSM1848811' condition='male, HIST, pre_exercises'                  individ=124 SRA='SRX1142647' SRR='SRR2155655' avgSpotLen=100 biosample='SAMN03981939’ />
<@sample id=350 GSM='GSM1848812' condition='male, HIST, immediate_after_exercises'      individ=125 SRA='SRX1142648' SRR='SRR2155656' avgSpotLen=100 biosample='SAMN03981940’ />
<@sample id=351 GSM='GSM1848813' condition='male, HIST, 3hrs_after_exercises'           individ=125 SRA='SRX1142649' SRR='SRR2155657' avgSpotLen=100 biosample='SAMN03981941’ />
<@sample id=352 GSM='GSM1848814' condition='male, HIST, pre_exercises'                  individ=125 SRA='SRX1142650' SRR='SRR2155658' avgSpotLen=100 biosample='SAMN03981942’ />
<@sample id=353 GSM='GSM1848815' condition='male, HIST, immediate_after_exercises'      individ=126 SRA='SRX1142651' SRR='SRR2155659' avgSpotLen=100 biosample='SAMN03981943’ />
<@sample id=354 GSM='GSM1848816' condition='male, HIST, 3hrs_after_exercises'           individ=126 SRA='SRX1142652' SRR='SRR2155660' avgSpotLen=100 biosample='SAMN03981944’ />
<@sample id=355 GSM='GSM1848817' condition='male, HIST, pre_exercises'                  individ=126 SRA='SRX1142653' SRR='SRR2155661' avgSpotLen=100 biosample='SAMN03981945’ />
<@sample id=356 GSM='GSM1848818' condition='male, HIST, immediate_after_exercises'      individ=127 SRA='SRX1142654' SRR='SRR2155662' avgSpotLen=100 biosample='SAMN03981946’ />
<@sample id=357 GSM='GSM1848819' condition='male, HIST, 3hrs_after_exercises'           individ=127 SRA='SRX1142655' SRR='SRR2155663' avgSpotLen=100 biosample='SAMN03981947’ />
<@sample id=358 GSM='GSM1848820' condition='male, HIST, pre_exercises'                  individ=127 SRA='SRX1142656' SRR='SRR2155664' avgSpotLen=100 biosample='SAMN03981948’ />
<@sample id=359 GSM='GSM1848821' condition='male, HIST, immediate_after_exercises'      individ=128 SRA='SRX1142657' SRR='SRR2155665' avgSpotLen=100 biosample='SAMN03981949’ />
<@sample id=360 GSM='GSM1848822' condition='male, HIST, 3hrs_after_exercises'           individ=128 SRA='SRX1142658' SRR='SRR2155666' avgSpotLen=100 biosample='SAMN03981950’ />
<@sample id=361 GSM='GSM1848823' condition='male, HIST, pre_exercises'                  individ=128 SRA='SRX1142659' SRR='SRR2155667' avgSpotLen=100 biosample='SAMN03981951’ />
<@sample id=362 GSM='GSM1848824' condition='female, HIST, immediate_after_exercises'    individ=129 SRA='SRX1142660' SRR='SRR2155668' avgSpotLen=100 biosample='SAMN03981952’ />
<@sample id=363 GSM='GSM1848825' condition='female, HIST, 3hrs_after_exercises'         individ=129 SRA='SRX1142661' SRR='SRR2155669' avgSpotLen=100 biosample='SAMN03981953’ />
<@sample id=364 GSM='GSM1848826' condition='female, HIST, pre_exercises'                individ=129 SRA='SRX1142662' SRR='SRR2155670' avgSpotLen=100 biosample='SAMN03981954’ />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
