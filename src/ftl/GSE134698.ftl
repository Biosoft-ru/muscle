<#include 'common'/>

delete from series where GSE='GSE134698';

<#assign SERIES_ID=11>

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(${SERIES_ID}, 'GSE134698', 31694310, ${human}, ${rna_seq},
'Signaling response to personalized exercise therapy in skeletal muscle from heart failure patients with reduced ejection fraction.', 

${"	In chronic heart failure (CHF), functional and metabolic alterations are detected not only in cardiac muscle but also in skeletal muscle tissue. The molecular mechanisms responsible for muscle dysfunction in patients with CHF remain unknown as well as the biological processes responsible for the positive effect of physical exercise training. In this work, using the results of transcriptome sequencing (3' mRNA-Seq), authors identify the molecular mechanisms responsible for reducing muscle dysfunctions in patients with CHF undergoing a personalized program of physical rehabilitation. 3 patients with CHF were enrolled in the study, biopsies of gastrocnemius muscle were taken before and after 12 weeks of individual training program (intensity was determined at 90% of lactate inflection point). Analysis of RNA-Seq data shows the strong upregulation of pathways that control skeletal muscle cell differentiation, muscle contraction, recovery of membrane potential."?str},

${"To understand the effect of exercise therapy on gene expression in skeletal muscle tissue of heart failure patients, we profiled the transcriptomes (using 3' mRNA-seq), of gastrocnemius muscle tissue biopsies taken from patients before and after 12 weeks of physical rehabilitation program. The individual training intensity was determined at 90% of lactate inflection point.

<br/><br/>Symbols in file names: 
<ul>
 P1, P4, P5 - patient number, 
 before - prior to training,
 after - after training.
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (111,112,113);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=111  code='P1_before'   sex='Male' />
<@individ id=111  code='P1_after'    sex='Male' />
<@individ id=112  code='P4_before'   sex='Male' />
<@individ id=112  code='P4_after'    sex='Male' />
<@individ id=113  code='P5_before'   sex='Male' />
<@individ id=113  code='P5_after'    sex='Male' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (51,52);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=51 title='before_exercises' status=untrained time=0      treatment='NULL' />
<@condition id=52 title='after_exercises'  status=untrained time=120060 treatment=rehabilitation_training />

-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (49);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 2, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=49 title='after_exercises vs before_exercises' condition1=52 condition2=51 comment='NULL' /> 

-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (311, 312, 313, 314, 315, 316);
delete from samples where id IN (311, 312, 313, 314, 315, 316);

<#macro sample id, GSM, condition, individ, platform, SRA, SRR, avgSpotLen, biosample>
<#local title = condition + '_' + individ>
<#local platform = Illumina_MiSeq />

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, avgSpotLen, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${avgSpotLen}, ${id}, ${SERIES_ID});

</#macro>

<@sample id=311 GSM='GSM3963767' condition='before_exercises' individ=111 SRA='SRX6491013' SRR='SRR9733999' avgSpotLen=150 biosample='SAMN12341984' />
<@sample id=312 GSM='GSM3963768' condition='after_exercises'  individ=111 SRA='SRX6491014' SRR='SRR9734000' avgSpotLen=150 biosample='SAMN12341983' />
<@sample id=313 GSM='GSM3963769' condition='before_exercises' individ=112 SRA='SRX6491015' SRR='SRR9734001' avgSpotLen=150 biosample='SAMN12341982' />
<@sample id=314 GSM='GSM3963770' condition='after_exercises'  individ=112 SRA='SRX6491016' SRR='SRR9734002' avgSpotLen=150 biosample='SAMN12341981' />
<@sample id=315 GSM='GSM3963771' condition='before_exercises' individ=113 SRA='SRX6491017' SRR='SRR9734003' avgSpotLen=150 biosample='SAMN12341980' />
<@sample id=316 GSM='GSM3963772' condition='after_exercises'  individ=113 SRA='SRX6491018' SRR='SRR9734004' avgSpotLen=150 biosample='SAMN12341979' />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
