<#include 'common'/>

delete from series where GSE='GSE120862';

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design)
VALUES(1, 'GSE120862', 30779632, ${human}, ${rna_seq},
'Contractile activity-specific transcriptome response to acute endurance exercise and training in human skeletal muscle', 

${"In our study, we investigated for contractile activity-specific changes in the transcriptome in untrained and trained 
(after an aerobic training programme) human skeletal muscle. The second goal was to examine effect of aerobic training on 
gene expression in muscle at baseline (after long term training). Seven untrained males performed the one-legged knee 
extension exercise (for 60 min) with the same relative intensity before and after a 2 month aerobic training programme (1 h/day, 5/week). 
Biopsy samples were taken at rest (baseline condition, 48 h after exercise), 1 and 4 h after the one-legged exercise from m. vastus 
lateralis of either leg. Comparison of gene expression in exercised leg with that in non-exercised [control] 
leg allowed us to identify contractile activity-specific genes in both untrained and trained skeletal muscle, 
i.e., genes that play a key role in adapting to acute exercise, regardless of the level of fitness. 
RNA-sequencing (84 samples in total; ~47 million reads/sample) was performed by NextSeq 500 and HiSeq 2500 (Illumina). 
Two months aerobic training increased the aerobic capacity of the knee-extensor muscles (power at anaerobic threshold 
in the incremental one-legged and cycling tests), the maximum rate of ADP-stimulated mitochondrial respiration 
in permeabilized muscle fibres and amounts of oxidative phosphorylation proteins. Contractile activity-specific changes 
in the transcriptome in untrained and trained human skeletal muscle were revealed for the first time. 
After 2 month aerobic training, transcriptome responses specific for contractile activity in trained muscle substantially 
decreased relative to those in untrained muscle. We found out that adaptation of skeletal muscle to regular exercise 
is associated not only with a transient change in the transcriptome after each stress (acute exercise), 
but also with a marked change in baseline expression of many genes after repeated stress (e.g., long term training)."?str},

${"Seven untrained males performed the one-legged knee extension exercise (for 60 min) with the same 
relative intensity (at ~65% of the maximal power determined in the one-legged knee extension ramp test) 
before and after a 2 month aerobic training programme (1 h/day, 5/week). Biopsy samples were taken at rest 
(baseline condition, 48 h after exercise), 1 and 4 h after the one-legged exercise from m. vastus lateralis 
of either leg. Comparison of gene expression in exercised leg with that in non-exercised leg allowed us 
to identify genes that are directly related to contractile activity in human skeletal muscle, regardless 
of the level of fitness as well as a change in baseline transcriptome after long term training. 
RNA-sequencing (84 samples in total; ~47 million reads/sample) was performed by NextSeq 500 and HiSeq 2500 (Illumina).

<br/><br/>Symbols in file names: 
<ul>
 <li>Ex – exercised leg;</li> 
 <li>NE – non-exercised leg;</li> 
 <li>baseline – prior to the one-legged exercise;</li> 
 <li>+1 h – 1 h after the one-legged exercise;</li> 
 <li>+4 h – 4 h after the one-legged exercise;</li> 
 <li>untrained – before a 2 month aerobic training programme;</li> 
 <li>trained – after a 2 month aerobic training programme;</li> 
 <li>the last symbol in file name – subject’s ID.</li>
 </ul>
 "?str}
 );
 
 -- ---------------------------------------------------------------------------
 -- individuals

delete from individuals where ID IN (1,2,3,4,5,6,7);

<#macro individ id, code, age, sex>
INSERT INTO individuals(ID, code, age, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${age}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=1 code=1 age=21 sex='male' />
<@individ id=2 code=2 age=33 sex='male' />
<@individ id=3 code=3 age=21 sex='male' />
<@individ id=4 code=4 age=21 sex='male' />
<@individ id=5 code=5 age=21 sex='male' />
<@individ id=6 code=6 age=22 sex='male' />
<@individ id=7 code=7 age=29 sex='male' />
 

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID <= 12;

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=1  title='untrained_baseline_NE' status=untrained time=  0 treatment='NULL' />
<@condition id=2  title='untrained_+1h_NE'      status=untrained time= 60 treatment=aerobic_exercise_60m /> 
<@condition id=3  title='untrained_+4h_NE'      status=untrained time=240 treatment=aerobic_exercise_60m /> 
<@condition id=4  title='untrained_baseline_Ex' status=untrained time=  0 treatment='NULL' /> 
<@condition id=5  title='untrained_+1h_Ex'      status=untrained time= 60 treatment=aerobic_exercise_60m /> 
<@condition id=6  title='untrained_+4h_Ex'      status=untrained time=240 treatment=aerobic_exercise_60m /> 
<@condition id=7  title='trained_baseline_NE'   status=trained   time=  0 treatment=aerobic_training_4w  /> 
<@condition id=8  title='trained_+1h_NE'        status=trained   time= 60 treatment=aerobic_exercise_60m /> 
<@condition id=9  title='trained_+4h_NE'        status=trained   time=240 treatment=aerobic_exercise_60m /> 
<@condition id=10 title='trained_baseline_Ex'   status=trained   time=  0 treatment=aerobic_training_4w  /> 
<@condition id=11 title='trained_+1h_Ex'        status=trained   time= 60 treatment=aerobic_exercise_60m /> 
<@condition id=12 title='trained_+4h_Ex'        status=trained   time= 60 treatment=aerobic_exercise_60m /> 


-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id <= 84;
delete from samples where id <= 84;

<#macro sample id, GSM, condition, individ, platform, SRA, SRR, biosample>

<#local title = condition + '_' + individ>

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${id}, 1);

</#macro>

<@sample id=1 GSM='GSM3417304' condition='untrained_baseline_NE' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801195' SRR='SRR7967699' biosample='SAMN10180041' />
<@sample id=2 GSM='GSM3417305' condition='untrained_+1h_NE' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801196' SRR='SRR7967700' biosample='SAMN10180040' />
<@sample id=3 GSM='GSM3417306' condition='untrained_+4h_NE' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801197' SRR='SRR7967701' biosample='SAMN10180039' />
<@sample id=4 GSM='GSM3417307' condition='untrained_baseline_Ex' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801198' SRR='SRR7967702' biosample='SAMN10180038' />
<@sample id=5 GSM='GSM3417308' condition='untrained_+1h_Ex' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801199' SRR='SRR7967703' biosample='SAMN10180037' />
<@sample id=6 GSM='GSM3417309' condition='untrained_+4h_Ex' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801200' SRR='SRR7967704' biosample='SAMN10180036' />
<@sample id=7 GSM='GSM3417310' condition='trained_baseline_NE' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801201' SRR='SRR7967705' biosample='SAMN10180035' />
<@sample id=8 GSM='GSM3417311' condition='trained_+1h_NE' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801202' SRR='SRR7967706' biosample='SAMN10180034' />
<@sample id=9 GSM='GSM3417312' condition='trained_+4h_NE' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801203' SRR='SRR7967707' biosample='SAMN10180033' />
<@sample id=10 GSM='GSM3417313' condition='trained_baseline_Ex' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801204' SRR='SRR7967708' biosample='SAMN10180032' />
<@sample id=11 GSM='GSM3417314' condition='trained_+1h_Ex' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801205' SRR='SRR7967709' biosample='SAMN10180031' />
<@sample id=12 GSM='GSM3417315' condition='trained_+4h_Ex' individ=1 platform=Illumina_HiSeq_2500 SRA='SRX4801206' SRR='SRR7967710' biosample='SAMN10180030' />
<@sample id=13 GSM='GSM3417316' condition='untrained_baseline_NE' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801207' SRR='SRR7967711' biosample='SAMN10180029' />
<@sample id=14 GSM='GSM3417317' condition='untrained_+1h_NE' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801208' SRR='SRR7967712' biosample='SAMN10180028' />
<@sample id=15 GSM='GSM3417318' condition='untrained_+4h_NE' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801209' SRR='SRR7967713' biosample='SAMN10180027' />
<@sample id=16 GSM='GSM3417319' condition='untrained_baseline_Ex' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801210' SRR='SRR7967714' biosample='SAMN10180026' />
<@sample id=17 GSM='GSM3417320' condition='untrained_+1h_Ex' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801211' SRR='SRR7967715' biosample='SAMN10180025' />
<@sample id=18 GSM='GSM3417321' condition='untrained_+4h_Ex' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801212' SRR='SRR7967716' biosample='SAMN10180024' />
<@sample id=19 GSM='GSM3417322' condition='trained_baseline_NE' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801213' SRR='SRR7967717' biosample='SAMN10180023' />
<@sample id=20 GSM='GSM3417323' condition='trained_+1h_NE' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801214' SRR='SRR7967718' biosample='SAMN10180022' />
<@sample id=21 GSM='GSM3417324' condition='trained_+4h_NE' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801215' SRR='SRR7967719' biosample='SAMN10180021' />
<@sample id=22 GSM='GSM3417325' condition='trained_baseline_Ex' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801216' SRR='SRR7967720' biosample='SAMN10180020' />
<@sample id=23 GSM='GSM3417326' condition='trained_+1h_Ex' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801217' SRR='SRR7967721' biosample='SAMN10180103' />
<@sample id=24 GSM='GSM3417327' condition='trained_+4h_Ex' individ=2 platform=Illumina_HiSeq_2500 SRA='SRX4801218' SRR='SRR7967722' biosample='SAMN10180102' />
<@sample id=25 GSM='GSM3417328' condition='untrained_baseline_NE' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801219' SRR='SRR7967723' biosample='SAMN10180101' />
<@sample id=26 GSM='GSM3417329' condition='untrained_+1h_NE' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801220' SRR='SRR7967724' biosample='SAMN10180100' />
<@sample id=27 GSM='GSM3417330' condition='untrained_+4h_NE' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801221' SRR='SRR7967725' biosample='SAMN10180099' />
<@sample id=28 GSM='GSM3417331' condition='untrained_baseline_Ex' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801222' SRR='SRR7967726' biosample='SAMN10180098' />
<@sample id=29 GSM='GSM3417332' condition='untrained_+1h_Ex' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801223' SRR='SRR7967727' biosample='SAMN10180092' />
<@sample id=30 GSM='GSM3417333' condition='untrained_+4h_Ex' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801224' SRR='SRR7967728' biosample='SAMN10180091' />
<@sample id=31 GSM='GSM3417334' condition='trained_baseline_NE' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801225' SRR='SRR7967729' biosample='SAMN10180097' />
<@sample id=32 GSM='GSM3417335' condition='trained_+1h_NE' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801226' SRR='SRR7967730' biosample='SAMN10180096' />
<@sample id=33 GSM='GSM3417336' condition='trained_+4h_NE' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801227' SRR='SRR7967731' biosample='SAMN10180095' />
<@sample id=34 GSM='GSM3417337' condition='trained_baseline_Ex' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801228' SRR='SRR7967732' biosample='SAMN10180094' />
<@sample id=35 GSM='GSM3417338' condition='trained_+1h_Ex' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801229' SRR='SRR7967733' biosample='SAMN10180093' />
<@sample id=36 GSM='GSM3417339' condition='trained_+4h_Ex' individ=3 platform=Illumina_HiSeq_2500 SRA='SRX4801230' SRR='SRR7967734' biosample='SAMN10180090' />
<@sample id=37 GSM='GSM3417340' condition='untrained_baseline_NE' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801231' SRR='SRR7967735' biosample='SAMN10180089' />
<@sample id=38 GSM='GSM3417341' condition='untrained_+1h_NE' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801232' SRR='SRR7967736' biosample='SAMN10180088' />
<@sample id=39 GSM='GSM3417342' condition='untrained_+4h_NE' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801233' SRR='SRR7967737' biosample='SAMN10180087' />
<@sample id=40 GSM='GSM3417343' condition='untrained_baseline_Ex' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801234' SRR='SRR7967738' biosample='SAMN10180086' />
<@sample id=41 GSM='GSM3417344' condition='untrained_+1h_Ex' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801235' SRR='SRR7967739' biosample='SAMN10180085' />
<@sample id=42 GSM='GSM3417345' condition='untrained_+4h_Ex' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801236' SRR='SRR7967740' biosample='SAMN10180084' />
<@sample id=43 GSM='GSM3417346' condition='trained_baseline_NE' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801237' SRR='SRR7967741' biosample='SAMN10180083' />
<@sample id=44 GSM='GSM3417347' condition='trained_+1h_NE' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801238' SRR='SRR7967742' biosample='SAMN10180082' />
<@sample id=45 GSM='GSM3417348' condition='trained_+4h_NE' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801239' SRR='SRR7967743' biosample='SAMN10180081' />
<@sample id=46 GSM='GSM3417349' condition='trained_baseline_Ex' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801240' SRR='SRR7967744' biosample='SAMN10180080' />
<@sample id=47 GSM='GSM3417350' condition='trained_+1h_Ex' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801241' SRR='SRR7967745' biosample='SAMN10180079' />
<@sample id=48 GSM='GSM3417351' condition='trained_+4h_Ex' individ=4 platform=Illumina_HiSeq_2500 SRA='SRX4801242' SRR='SRR7967746' biosample='SAMN10180078' />
<@sample id=49 GSM='GSM3417352' condition='untrained_baseline_NE' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801243' SRR='SRR7967747' biosample='SAMN10180077' />
<@sample id=50 GSM='GSM3417353' condition='untrained_+1h_NE' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801244' SRR='SRR7967748' biosample='SAMN10180076' />
<@sample id=51 GSM='GSM3417354' condition='untrained_+4h_NE' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801245' SRR='SRR7967749' biosample='SAMN10180075' />
<@sample id=52 GSM='GSM3417355' condition='untrained_baseline_Ex' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801246' SRR='SRR7967750' biosample='SAMN10180074' />
<@sample id=53 GSM='GSM3417356' condition='untrained_+1h_Ex' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801247' SRR='SRR7967751' biosample='SAMN10180073' />
<@sample id=54 GSM='GSM3417357' condition='untrained_+4h_Ex' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801248' SRR='SRR7967752' biosample='SAMN10180072' />
<@sample id=55 GSM='GSM3417358' condition='trained_baseline_NE' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801249' SRR='SRR7967753' biosample='SAMN10180071' />
<@sample id=56 GSM='GSM3417359' condition='trained_+1h_NE' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801250' SRR='SRR7967754' biosample='SAMN10180070' />
<@sample id=57 GSM='GSM3417360' condition='trained_+4h_NE' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801251' SRR='SRR7967755' biosample='SAMN10180069' />
<@sample id=58 GSM='GSM3417361' condition='trained_baseline_Ex' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801252' SRR='SRR7967756' biosample='SAMN10180068' />
<@sample id=59 GSM='GSM3417362' condition='trained_+1h_Ex' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801253' SRR='SRR7967757' biosample='SAMN10180067' />
<@sample id=60 GSM='GSM3417363' condition='trained_+4h_Ex' individ=5 platform=Illumina_NextSeq_500 SRA='SRX4801254' SRR='SRR7967758' biosample='SAMN10180066' />
<@sample id=61 GSM='GSM3417364' condition='untrained_baseline_NE' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801255' SRR='SRR7967759' biosample='SAMN10180065' />
<@sample id=62 GSM='GSM3417365' condition='untrained_+1h_NE' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801256' SRR='SRR7967760' biosample='SAMN10180064' />
<@sample id=63 GSM='GSM3417366' condition='untrained_+4h_NE' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801257' SRR='SRR7967761' biosample='SAMN10180063' />
<@sample id=64 GSM='GSM3417367' condition='untrained_baseline_Ex' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801258' SRR='SRR7967762' biosample='SAMN10180062' />
<@sample id=65 GSM='GSM3417368' condition='untrained_+1h_Ex' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801259' SRR='SRR7967763' biosample='SAMN10180061' />
<@sample id=66 GSM='GSM3417369' condition='untrained_+4h_Ex' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801260' SRR='SRR7967764' biosample='SAMN10180060' />
<@sample id=67 GSM='GSM3417370' condition='trained_baseline_NE' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801261' SRR='SRR7967765' biosample='SAMN10180059' />
<@sample id=68 GSM='GSM3417371' condition='trained_+1h_NE' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801262' SRR='SRR7967766' biosample='SAMN10180058' />
<@sample id=69 GSM='GSM3417372' condition='trained_+4h_NE' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801263' SRR='SRR7967767' biosample='SAMN10180057' />
<@sample id=70 GSM='GSM3417373' condition='trained_baseline_Ex' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801264' SRR='SRR7967768' biosample='SAMN10180056' />
<@sample id=71 GSM='GSM3417374' condition='trained_+1h_Ex' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801265' SRR='SRR7967769' biosample='SAMN10180055' />
<@sample id=72 GSM='GSM3417375' condition='trained_+4h_Ex' individ=6 platform=Illumina_NextSeq_500 SRA='SRX4801266' SRR='SRR7967770' biosample='SAMN10180054' />
<@sample id=73 GSM='GSM3417376' condition='untrained_baseline_NE' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801267' SRR='SRR7967771' biosample='SAMN10180053' />
<@sample id=74 GSM='GSM3417377' condition='untrained_+1h_NE' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801268' SRR='SRR7967772' biosample='SAMN10180052' />
<@sample id=75 GSM='GSM3417378' condition='untrained_+4h_NE' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801269' SRR='SRR7967773' biosample='SAMN10180051' />
<@sample id=76 GSM='GSM3417379' condition='untrained_baseline_Ex' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801270' SRR='SRR7967774' biosample='SAMN10180050' />
<@sample id=77 GSM='GSM3417380' condition='untrained_+1h_Ex' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801271' SRR='SRR7967775' biosample='SAMN10180049' />
<@sample id=78 GSM='GSM3417381' condition='untrained_+4h_Ex' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801272' SRR='SRR7967776' biosample='SAMN10180048' />
<@sample id=79 GSM='GSM3417382' condition='trained_baseline_NE' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801273' SRR='SRR7967777' biosample='SAMN10180047' />
<@sample id=80 GSM='GSM3417383' condition='trained_+1h_NE' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801274' SRR='SRR7967778' biosample='SAMN10180046' />
<@sample id=81 GSM='GSM3417384' condition='trained_+4h_NE' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801275' SRR='SRR7967779' biosample='SAMN10180045' />
<@sample id=82 GSM='GSM3417385' condition='trained_baseline_Ex' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801276' SRR='SRR7967780' biosample='SAMN10180044' />
<@sample id=83 GSM='GSM3417386' condition='trained_+1h_Ex' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801277' SRR='SRR7967781' biosample='SAMN10180043' />
<@sample id=84 GSM='GSM3417387' condition='trained_+4h_Ex' individ=7 platform=Illumina_NextSeq_500 SRA='SRX4801278' SRR='SRR7967782' biosample='SAMN10180042' />
