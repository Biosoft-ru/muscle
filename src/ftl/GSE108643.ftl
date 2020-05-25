<#include 'common'/>

delete from series where GSE='GSE108643';

<#assign SERIES_ID=13>

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(${SERIES_ID}, 'GSE108643', ${human}, ${rna_seq},
'Effects of Acute Aerobic Exercise on Skeletal Muscle Transcriptomics in Lean vs Overweight/Obese Men', 

${"Acute aerobic exercise has been shown to improve skeletal muscle mitochondrial function and completeness of fatty acid β-oxidation which contribute to improved insulin sensitivity. The effectiveness of acute exercise on improving mitochondrial adaptations, leading to improved insulin sensitivity, in overweight/obese (Ov/Ob) individuals is controversial. This study aimed to determine the effects of acute exercise on epigenetic regulation of genes involved in skeletal muscle mitochondrial adaptations in lean vs Ov/Ob men."?str},

${"29 men, aged 19-30 years, were recruited and divided into two groups: lean (BMI<25, 18.5- 24.1 kg/m2, n=14) and Ov/Ob (BMI≥25, 25.5- 36.9 kg/m2, n=15). Vastus lateralis muscle biopsy samples were collected at rest, following an overnight fast (Pre; n=14 in lean Pre and n=15 in Ov/Ob Pre). Subjects then ingested a standardized high-carbohydrate breakfast (7 kcal/kg; 60% carbohydrate, 25% fat, 15% protein). Four hours later, they performed an acute bout of cycling exercise (50% VO2max, expending ~650 kcal) and vastus lateralis muscle biopsy samples were collected immediately after the exercise bout (Post; n=15 in lean Post and in Ov/Ob Post). RNA-seq via the Illumina platform was performed. Sequences were aligned using TopHat and differential gene expression determined using Cuffdiff.

<br/><br/>Symbols in file names: 
<ul>
Lean - normal weight and BMI<25,
Ov/Ob - overweight or obesity with BMI>25
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=133  code='Lean Pre 1'    sex='male' />
<@individ id=133  code='Lean Post 1'   sex='male' />
<@individ id=134  code='Lean Pre 2'    sex='male' />
<@individ id=134  code='Lean Post 2'   sex='male' />
<@individ id=135  code='Lean Pre 3'    sex='male' />
<@individ id=135  code='Lean Post 3'   sex='male' />
<@individ id=136  code='Lean Pre 4'    sex='male' />
<@individ id=136  code='Lean Post 4'   sex='male' />
<@individ id=137  code='Lean Pre 5'    sex='male' />
<@individ id=137  code='Lean Post 5'   sex='male' />
<@individ id=138  code='Lean Pre 6'    sex='male' />
<@individ id=138  code='Lean Post 6'   sex='male' />
<@individ id=139  code='Lean Pre 7'    sex='male' />
<@individ id=139  code='Lean Post 7'   sex='male' />
<@individ id=140  code='Lean Pre 8'    sex='male' />
<@individ id=140  code='Lean Post 8'   sex='male' />
<@individ id=141  code='Lean Pre 9'    sex='male' />
<@individ id=141  code='Lean Post 9'   sex='male' />
<@individ id=142  code='Lean Pre 10'   sex='male' />
<@individ id=142  code='Lean Post 10'  sex='male' />
<@individ id=143  code='Lean Pre 11'   sex='male' />
<@individ id=143  code='Lean Post 11'  sex='male' />
<@individ id=144  code='Lean Pre 12'   sex='male' />
<@individ id=144  code='Lean Post 12'  sex='male' />
<@individ id=145  code='Lean Pre 13'   sex='male' />
<@individ id=145  code='Lean Post 13'  sex='male' />
<@individ id=146  code='Lean Pre 14'   sex='male' />
<@individ id=146  code='Lean Post 14'  sex='male' />
<@individ id=147  code='Ov/Ob Pre 1'   sex='male' />
<@individ id=147  code='Ov/Ob Post 1'  sex='male' />
<@individ id=148  code='Ov/Ob Pre 2'   sex='male' />
<@individ id=148  code='Ov/Ob Post 2'  sex='male' />
<@individ id=149  code='Ov/Ob Pre 3'   sex='male' />
<@individ id=149  code='Ov/Ob Post 3'  sex='male' />
<@individ id=150  code='Ov/Ob Pre 4'   sex='male' />
<@individ id=150  code='Ov/Ob Post 4'  sex='male' />
<@individ id=151  code='Ov/Ob Pre 5'   sex='male' />
<@individ id=151  code='Ov/Ob Post 5'  sex='male' />
<@individ id=152  code='Ov/Ob Pre 6'   sex='male' />
<@individ id=152  code='Ov/Ob Post 6'  sex='male' />
<@individ id=153  code='Ov/Ob Pre 7'   sex='male' />
<@individ id=153  code='Ov/Ob Post 7'  sex='male' />
<@individ id=154  code='Ov/Ob Pre 8'   sex='male' />
<@individ id=154  code='Ov/Ob Post 8'  sex='male' />
<@individ id=155  code='Ov/Ob Pre 9'   sex='male' />
<@individ id=155  code='Ov/Ob Post 9'  sex='male' />
<@individ id=156  code='Ov/Ob Pre 10'  sex='male' />
<@individ id=156  code='Ov/Ob Post 10' sex='male' />
<@individ id=157  code='Ov/Ob Pre 11'  sex='male' />
<@individ id=157  code='Ov/Ob Post 11' sex='male' />
<@individ id=158  code='Ov/Ob Pre 12'  sex='male' />
<@individ id=158  code='Ov/Ob Post 12' sex='male' />
<@individ id=159  code='Ov/Ob Pre 13'  sex='male' />
<@individ id=159  code='Ov/Ob Post 13' sex='male' />
<@individ id=160  code='Ov/Ob Pre 14'  sex='male' />
<@individ id=160  code='Ov/Ob Post 14' sex='male' />
<@individ id=161  code='Ov/Ob Pre 15'  sex='male' />
<@individ id=161  code='Ov/Ob Post 15' sex='male' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (65, 66, 67, 68);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=65 title='male, lean, pre_exercises'   status=untrained time=0  treatment='NULL' />
<@condition id=66 title='male, lean, post_exercises'  status=untrained time=0  treatment=exercises />
<@condition id=67 title='male, Ov/Ob, pre_exercises'  status=untrained time=0  treatment='NULL' />
<@condition id=68 title='male, Ov/Ob, post_exercises' status=untrained time=0  treatment=exercises />

-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (70,71,72,73);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 2, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=70 title='male, pre_exercises, Ov/Ob vs lean'           condition1=67 condition2=65 comment='NULL' />
<@comparison id=71 title='male, post_exercises, Ov/Ob vs lean'          condition1=68 condition2=66 comment='NULL' />
<@comparison id=72 title='male, lean, post_exercises vs pre_exercises'  condition1=66 condition2=65 comment='NULL' />
<@comparison id=73 title='male, Ov/Ob, post_exercises vs pre_exercises' condition1=68 condition2=67 comment='NULL' />

-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422);
delete from samples where id IN (365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422);

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

<@sample id=365	GSM='GSM4008561'	condition='male, lean, pre_exercises'	individ=133	SRA='SRX6657518'	SRR='SRR9906516'	avgSpotLen=100	biosample='SAMN12499912’ />
<@sample id=366	GSM='GSM4008562'	condition='male, lean, pre_exercises'	individ=134	SRA='SRX6657519'	SRR='SRR9906517'	avgSpotLen=100	biosample='SAMN12499910’ />
<@sample id=367	GSM='GSM4008563'	condition='male, lean, pre_exercises'	individ=135	SRA='SRX6657520'	SRR='SRR9906518'	avgSpotLen=100	biosample='SAMN12499909’ />
<@sample id=368	GSM='GSM4008564'	condition='male, lean, pre_exercises'	individ=136	SRA='SRX6657521'	SRR='SRR9906519'	avgSpotLen=100	biosample='SAMN12499908’ />
<@sample id=369	GSM='GSM4008565'	condition='male, lean, pre_exercises'	individ=137	SRA='SRX6657522'	SRR='SRR9906520'	avgSpotLen=100	biosample='SAMN12499907’ />
<@sample id=370	GSM='GSM4008566'	condition='male, lean, pre_exercises'	individ=138	SRA='SRX6657523'	SRR='SRR9906521'	avgSpotLen=100	biosample='SAMN12499906’ />
<@sample id=371	GSM='GSM4008567'	condition='male, lean, pre_exercises'	individ=139	SRA='SRX6657524'	SRR='SRR9906522'	avgSpotLen=100	biosample='SAMN12499904’ />
<@sample id=372	GSM='GSM4008568'	condition='male, lean, pre_exercises'	individ=140	SRA='SRX6657525'	SRR='SRR9906523'	avgSpotLen=100	biosample='SAMN12499903’ />
<@sample id=373	GSM='GSM4008569'	condition='male, lean, pre_exercises'	individ=141	SRA='SRX6657526'	SRR='SRR9906524'	avgSpotLen=100	biosample='SAMN12499901’ />
<@sample id=374	GSM='GSM4008570'	condition='male, lean, pre_exercises'	individ=142	SRA='SRX6657527'	SRR='SRR9906525'	avgSpotLen=100	biosample='SAMN12499900’ />
<@sample id=375	GSM='GSM4008571'	condition='male, lean, pre_exercises'	individ=143	SRA='SRX6657528'	SRR='SRR9906526'	avgSpotLen=100	biosample='SAMN12499920’ />
<@sample id=376	GSM='GSM4008572'	condition='male, lean, pre_exercises'	individ=144	SRA='SRX6657529'	SRR='SRR9906527'	avgSpotLen=100	biosample='SAMN12499918’ />
<@sample id=377	GSM='GSM4008573'	condition='male, lean, pre_exercises'	individ=145	SRA='SRX6657530'	SRR='SRR9906528'	avgSpotLen=100	biosample='SAMN12499917’ />
<@sample id=378	GSM='GSM4008574'	condition='male, lean, pre_exercises'	individ=146	SRA='SRX6657531'	SRR='SRR9906529'	avgSpotLen=100	biosample='SAMN12499916’ />
<@sample id=379	GSM='GSM4008575'	condition='male, Ov/Ob, pre_exercises'	individ=147	SRA='SRX6657532'	SRR='SRR9906530'	avgSpotLen=100	biosample='SAMN12499915’ />
<@sample id=380	GSM='GSM4008576'	condition='male, Ov/Ob, pre_exercises'	individ=148	SRA='SRX6657533'	SRR='SRR9906531'	avgSpotLen=100	biosample='SAMN12499913’ />
<@sample id=381	GSM='GSM4008577'	condition='male, Ov/Ob, pre_exercises'	individ=149	SRA='SRX6657534'	SRR='SRR9906532'	avgSpotLen=100	biosample='SAMN12499921’ />
<@sample id=382	GSM='GSM4008578'	condition='male, Ov/Ob, pre_exercises'	individ=150	SRA='SRX6657535'	SRR='SRR9906533'	avgSpotLen=100	biosample='SAMN12499941’ />
<@sample id=383	GSM='GSM4008579'	condition='male, Ov/Ob, pre_exercises'	individ=151	SRA='SRX6657536'	SRR='SRR9906534'	avgSpotLen=100	biosample='SAMN12499940’ />
<@sample id=384	GSM='GSM4008580'	condition='male, Ov/Ob, pre_exercises'	individ=152	SRA='SRX6657537'	SRR='SRR9906535'	avgSpotLen=100	biosample='SAMN12499938’ />
<@sample id=385	GSM='GSM4008581'	condition='male, Ov/Ob, pre_exercises'	individ=153	SRA='SRX6657538'	SRR='SRR9906536'	avgSpotLen=100	biosample='SAMN12499937’ />
<@sample id=386	GSM='GSM4008582'	condition='male, Ov/Ob, pre_exercises'	individ=154	SRA='SRX6657539'	SRR='SRR9906537'	avgSpotLen=100	biosample='SAMN12499936’ />
<@sample id=387	GSM='GSM4008583'	condition='male, Ov/Ob, pre_exercises'	individ=155	SRA='SRX6657540'	SRR='SRR9906538'	avgSpotLen=100	biosample='SAMN12499935’ />
<@sample id=388	GSM='GSM4008584'	condition='male, Ov/Ob, pre_exercises'	individ=156	SRA='SRX6657541'	SRR='SRR9906539'	avgSpotLen=100	biosample='SAMN12499934’ />
<@sample id=389	GSM='GSM4008585'	condition='male, Ov/Ob, pre_exercises'	individ=157	SRA='SRX6657542'	SRR='SRR9906540'	avgSpotLen=100	biosample='SAMN12499932’ />
<@sample id=390	GSM='GSM4008586'	condition='male, Ov/Ob, pre_exercises'	individ=158	SRA='SRX6657543'	SRR='SRR9906541'	avgSpotLen=100	biosample='SAMN12499931’ />
<@sample id=391	GSM='GSM4008587'	condition='male, Ov/Ob, pre_exercises'	individ=159	SRA='SRX6657544'	SRR='SRR9906542'	avgSpotLen=100	biosample='SAMN12499930’ />
<@sample id=392	GSM='GSM4008588'	condition='male, Ov/Ob, pre_exercises'	individ=160	SRA='SRX6657545'	SRR='SRR9906543'	avgSpotLen=100	biosample='SAMN12499929’ />
<@sample id=393	GSM='GSM4008589'	condition='male, Ov/Ob, pre_exercises'	individ=161	SRA='SRX6657546'	SRR='SRR9906544'	avgSpotLen=100	biosample='SAMN12499928’ />
<@sample id=394	GSM='GSM4008590'	condition='male, lean, post_exercises'	individ=133	SRA='SRX6657547'	SRR='SRR9906545'	avgSpotLen=100	biosample='SAMN12499927’ />
<@sample id=395	GSM='GSM4008591'	condition='male, lean, post_exercises'	individ=134	SRA='SRX6657548'	SRR='SRR9906546'	avgSpotLen=100	biosample='SAMN12499925’ />
<@sample id=396	GSM='GSM4008592'	condition='male, lean, post_exercises'	individ=135	SRA='SRX6657549'	SRR='SRR9906547'	avgSpotLen=100	biosample='SAMN12499924’ />
<@sample id=397	GSM='GSM4008593'	condition='male, lean, post_exercises'	individ=136	SRA='SRX6657550'	SRR='SRR9906548'	avgSpotLen=100	biosample='SAMN12499923’ />
<@sample id=398	GSM='GSM4008594'	condition='male, lean, post_exercises'	individ=137	SRA='SRX6657551'	SRR='SRR9906549'	avgSpotLen=100	biosample='SAMN12499922’ />
<@sample id=399	GSM='GSM4008595'	condition='male, lean, post_exercises'	individ=138	SRA='SRX6657552'	SRR='SRR9906550'	avgSpotLen=100	biosample='SAMN12499899’ />
<@sample id=400	GSM='GSM4008596'	condition='male, lean, post_exercises'	individ=139	SRA='SRX6657553'	SRR='SRR9906551'	avgSpotLen=100	biosample='SAMN12499897’ />
<@sample id=401	GSM='GSM4008597'	condition='male, lean, post_exercises'	individ=140	SRA='SRX6657554'	SRR='SRR9906552'	avgSpotLen=100	biosample='SAMN12499896’ />
<@sample id=402	GSM='GSM4008598'	condition='male, lean, post_exercises'	individ=141	SRA='SRX6657555'	SRR='SRR9906553'	avgSpotLen=100	biosample='SAMN12499895’ />
<@sample id=403	GSM='GSM4008599'	condition='male, lean, post_exercises'	individ=142	SRA='SRX6657556'	SRR='SRR9906554'	avgSpotLen=100	biosample='SAMN12499970’ />
<@sample id=404	GSM='GSM4008600'	condition='male, lean, post_exercises'	individ=143	SRA='SRX6657557'	SRR='SRR9906555'	avgSpotLen=100	biosample='SAMN12499969’ />
<@sample id=405	GSM='GSM4008601'	condition='male, lean, post_exercises'	individ=144	SRA='SRX6657558'	SRR='SRR9906556'	avgSpotLen=100	biosample='SAMN12499968’ />
<@sample id=406	GSM='GSM4008602'	condition='male, lean, post_exercises'	individ=145	SRA='SRX6657559'	SRR='SRR9906557'	avgSpotLen=100	biosample='SAMN12499967’ />
<@sample id=407	GSM='GSM4008603'	condition='male, lean, post_exercises'	individ=146	SRA='SRX6657560'	SRR='SRR9906558'	avgSpotLen=100	biosample='SAMN12499965’ />
<@sample id=408	GSM='GSM4008604'	condition='male, Ov/Ob, post_exercises'	individ=147	SRA='SRX6657561'	SRR='SRR9906559'	avgSpotLen=100	biosample='SAMN12499964’ />
<@sample id=409	GSM='GSM4008605'	condition='male, Ov/Ob, post_exercises'	individ=148	SRA='SRX6657562'	SRR='SRR9906560'	avgSpotLen=100	biosample='SAMN12499963’ />
<@sample id=410	GSM='GSM4008606'	condition='male, Ov/Ob, post_exercises'	individ=149	SRA='SRX6657563'	SRR='SRR9906561'	avgSpotLen=100	biosample='SAMN12499956’ />
<@sample id=411	GSM='GSM4008607'	condition='male, Ov/Ob, post_exercises'	individ=150	SRA='SRX6657564'	SRR='SRR9906562'	avgSpotLen=100	biosample='SAMN12499955’ />
<@sample id=412	GSM='GSM4008608'	condition='male, Ov/Ob, post_exercises'	individ=151	SRA='SRX6657565'	SRR='SRR9906563'	avgSpotLen=100	biosample='SAMN12499954’ />
<@sample id=413	GSM='GSM4008609'	condition='male, Ov/Ob, post_exercises'	individ=152	SRA='SRX6657566'	SRR='SRR9906564'	avgSpotLen=100	biosample='SAMN12499962’ />
<@sample id=414	GSM='GSM4008610'	condition='male, Ov/Ob, post_exercises'	individ=153	SRA='SRX6657567'	SRR='SRR9906565'	avgSpotLen=100	biosample='SAMN12499961’ />
<@sample id=415	GSM='GSM4008611'	condition='male, Ov/Ob, post_exercises'	individ=154	SRA='SRX6657568'	SRR='SRR9906566'	avgSpotLen=100	biosample='SAMN12499959’ />
<@sample id=416	GSM='GSM4008612'	condition='male, Ov/Ob, post_exercises'	individ=155	SRA='SRX6657569'	SRR='SRR9906567'	avgSpotLen=100	biosample='SAMN12499958’ />
<@sample id=417	GSM='GSM4008613'	condition='male, Ov/Ob, post_exercises'	individ=156	SRA='SRX6657570'	SRR='SRR9906568'	avgSpotLen=100	biosample='SAMN12499957’ />
<@sample id=418	GSM='GSM4008614'	condition='male, Ov/Ob, post_exercises'	individ=157	SRA='SRX6657571'	SRR='SRR9906569'	avgSpotLen=100	biosample='SAMN12499952’ />
<@sample id=419	GSM='GSM4008615'	condition='male, Ov/Ob, post_exercises'	individ=158	SRA='SRX6657572'	SRR='SRR9906570'	avgSpotLen=100	biosample='SAMN12499951’ />
<@sample id=420	GSM='GSM4008616'	condition='male, Ov/Ob, post_exercises'	individ=159	SRA='SRX6657573'	SRR='SRR9906571'	avgSpotLen=100	biosample='SAMN12499950’ />
<@sample id=421	GSM='GSM4008617'	condition='male, Ov/Ob, post_exercises'	individ=160	SRA='SRX6657574'	SRR='SRR9906572'	avgSpotLen=100	biosample='SAMN12499948’ />
<@sample id=422	GSM='GSM4008618'	condition='male, Ov/Ob, post_exercises'	individ=161	SRA='SRX6657575'	SRR='SRR9906573'	avgSpotLen=100	biosample='SAMN12499947’ />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
