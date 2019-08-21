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

<#macro individ id, code, age>
INSERT INTO individuals(ID, code, age, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${age}, ${human}, ${male}, ${adult}, ${healthy} );
</#macro>

<@individ id=1 code=1 age=21 />
 

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

delete from biosamples where id < 84;
delete from samples where id < 84;

<#macro sample id, GSM, condition, individ, platform, SRA, biosample>

<#local title = condition + '_' + individ>

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${id}, 1);

</#macro>


<@sample id=1 GSM='GSM3417304' condition='untrained_baseline_NE' individ=1  platform=Illumina_HiSeq_2500 SRA='SRX4801195' biosample='SAMN10180041' />
