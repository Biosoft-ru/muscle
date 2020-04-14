<#include 'common'/>

delete from series where GSE='GSE99963';

<#assign SERIES_ID=10>

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(${SERIES_ID}, 'GSE99963', 29123172, ${human}, ${rna_seq},
'Transcriptomic and epigenetic responses to short-term nutrient-exercise stress in humans [RNA-seq]', 

${"High fat feeding is deleterious for skeletal muscle metabolism, while exercise has well documented beneficial effects for these same metabolic features. To identify the genomic mechanisms by which exercise ameliorates some of the deleterious effects of high fat feeding, we investigated the transcriptional and epigenetic response of human skeletal muscle to 9 days of a high-fat diet (HFD) alone (Sed-HFD) or in combination with resistance exercise (Ex-HFD), using genome-wide profiling of gene expression (by RNA-seq) and DNA methylation (by Reduced Representation Bisulfite Sequencing). HFD markedly induced expression of immune and inflammatory genes which was not attenuated by Ex. In contract, Ex markedly remodelled expression of genes associated with muscle growth and structure. We detected marked DNA methylation changes following HFD alone and in combination with Ex. Among the genes that showed significant association between DNA methylation changes and gene expression were glycogen phosphorylase, muscle associated (PYGM), which was epigenetically regulated in both groups, and angiopoiten like 4 (ANGPTL4), which was regulated only following Ex. We conclude that Short-term Ex does not prevent HFD-induced inflammatory response, but provokes a genomic response that may preserve skeletal muscle from atrophy. Epigenetic adaptation provides important mechanistic insight into the gene specific regulation of inflammatory and metabolic processes in human skeletal muscle."?str},

${"Sedentary or exercising human subjects undergo high-fat diet intervention.

<br/><br/>Symbols in file names: 
<ul>
 Post - biopsy of vastus lateralis taken after high fat diet (HFD) for 9 days,
 Pre - biopsy of vastus lateralis taken before HFD intervention, 
 Ex-HFD - HFD in combination with resistance exercises,
 Sed-HFD - Sedentary HFD, without any exercises.
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (97,98,99,100,101,102,103,104,105,106,107,108,109,110);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=97  code='Pre_S1'   sex='Male' />
<@individ id=97  code='Post_S1'  sex='Male' />
<@individ id=98  code='Pre_S2'   sex='Male' />
<@individ id=98  code='Post_S2'  sex='Male' />
<@individ id=99  code='Pre_S3'   sex='Male' />
<@individ id=99  code='Post_S3'  sex='Male' />
<@individ id=100 code='Pre_S4'   sex='Male' />
<@individ id=100 code='Post_S4'  sex='Male' />
<@individ id=101 code='Pre_S5'   sex='Male' />
<@individ id=101 code='Post_S5'  sex='Male' />
<@individ id=102 code='Pre_S6'   sex='Male' />
<@individ id=102 code='Post_S6'  sex='Male' />
<@individ id=103 code='Pre_S7'   sex='Male' />
<@individ id=103 code='Post_S7'  sex='Male' />
<@individ id=104 code='Pre_S8'   sex='Male' />
<@individ id=104 code='Post_S8'  sex='Male' />
<@individ id=105 code='Pre_S9'   sex='Male' />
<@individ id=105 code='Post_S9'  sex='Male' />
<@individ id=106 code='Pre_S10'  sex='Male' />
<@individ id=106 code='Post_S10' sex='Male' />
<@individ id=107 code='Pre_S11'  sex='Male' />
<@individ id=107 code='Post_S11' sex='Male' />
<@individ id=108 code='Pre_S12'  sex='Male' />
<@individ id=108 code='Post_S12' sex='Male' />
<@individ id=109 code='Pre_S13'  sex='Male' />
<@individ id=109 code='Post_S13' sex='Male' />
<@individ id=110 code='Pre_S14'  sex='Male' />
<@individ id=110 code='Post_S14' sex='Male' />


--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (48,49,50);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=48 title='control diet, pre-HFD' status=untrained time=0     treatment='NULL' />
<@condition id=49 title='Sed-HFD, post'         status=untrained time=15840 treatment=HFD_9d />
<@condition id=50 title='Ex-HFD, post'          status=untrained time=15840 treatment=HFD_9d_resistance_exercises_3_bouts />


-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (46,47,48);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 2, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=46 title='Sed-HFD vs Control' condition1=49 condition2=48 comment='NULL' /> 
<@comparison id=47 title='Ex-HFD vs Control' condition1=50 condition2=48 comment='NULL' /> 
<@comparison id=48 title='Ex-HFD vs Sed-HFD' condition1=50 condition2=49 comment='NULL' /> 

-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310);
delete from samples where id IN (283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310);

<#macro sample id, GSM, condition, individ, platform, SRA, SRR, avgSpotLen, biosample>
<#local title = condition + '_' + individ>
<#local platform = Illumina_HighSeq_2500 />

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, avgSpotLen, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${avgSpotLen}, ${id}, ${SERIES_ID});

</#macro>

<@sample id=283 GSM='GSM2666592' condition='Sed-HFD, post'         individ=107 SRA='SRX2914234' SRR='SRR5678739' avgSpotLen=80 biosample='SAMN07224715' />
<@sample id=284 GSM='GSM2666593' condition='Sed-HFD, post'         individ=109 SRA='SRX2914235' SRR='SRR5678740' avgSpotLen=80 biosample='SAMN07224714' />
<@sample id=285 GSM='GSM2666594' condition='Sed-HFD, post'         individ=98  SRA='SRX2914236' SRR='SRR5678741' avgSpotLen=80 biosample='SAMN07224713' />
<@sample id=286 GSM='GSM2666595' condition='Ex-HFD, post'          individ=100 SRA='SRX2914237' SRR='SRR5678742' avgSpotLen=80 biosample='SAMN07224712' />
<@sample id=287 GSM='GSM2666596' condition='Sed-HFD, post'         individ=102 SRA='SRX2914238' SRR='SRR5678743' avgSpotLen=80 biosample='SAMN07224711' />
<@sample id=288 GSM='GSM2666597' condition='Ex-HFD, post'          individ=104 SRA='SRX2914239' SRR='SRR5678744' avgSpotLen=80 biosample='SAMN07224710' />
<@sample id=289 GSM='GSM2666598' condition='Ex-HFD, post'          individ=105 SRA='SRX2914240' SRR='SRR5678745' avgSpotLen=80 biosample='SAMN07224709' />
<@sample id=290 GSM='GSM2666599' condition='control diet, pre-HFD' individ=106 SRA='SRX2914241' SRR='SRR5678746' avgSpotLen=80 biosample='SAMN07224708' />
<@sample id=291 GSM='GSM2666600' condition='control diet, pre-HFD' individ=108 SRA='SRX2914242' SRR='SRR5678747' avgSpotLen=80 biosample='SAMN07224707' />
<@sample id=292 GSM='GSM2666601' condition='control diet, pre-HFD' individ=110 SRA='SRX2914243' SRR='SRR5678748' avgSpotLen=80 biosample='SAMN07224706' />
<@sample id=293 GSM='GSM2666602' condition='control diet, pre-HFD' individ=97  SRA='SRX2914244' SRR='SRR5678749' avgSpotLen=80 biosample='SAMN07224705' />
<@sample id=294 GSM='GSM2666603' condition='control diet, pre-HFD' individ=99  SRA='SRX2914245' SRR='SRR5678750' avgSpotLen=80 biosample='SAMN07224704' />
<@sample id=295 GSM='GSM2666604' condition='control diet, pre-HFD' individ=101 SRA='SRX2914246' SRR='SRR5678751' avgSpotLen=80 biosample='SAMN07224703' />
<@sample id=296 GSM='GSM2666605' condition='control diet, pre-HFD' individ=103 SRA='SRX2914247' SRR='SRR5678752' avgSpotLen=80 biosample='SAMN07224702' />
<@sample id=297 GSM='GSM2666606' condition='Sed-HFD, post'         individ=106 SRA='SRX2914248' SRR='SRR5678753' avgSpotLen=80 biosample='SAMN07224701' />
<@sample id=298 GSM='GSM2666607' condition='Ex-HFD, post'          individ=108 SRA='SRX2914249' SRR='SRR5678754' avgSpotLen=80 biosample='SAMN07224700' />
<@sample id=299 GSM='GSM2666608' condition='Ex-HFD, post'          individ=110 SRA='SRX2914250' SRR='SRR5678755' avgSpotLen=80 biosample='SAMN07224699' />
<@sample id=300 GSM='GSM2666609' condition='Ex-HFD, post'          individ=97  SRA='SRX2914251' SRR='SRR5678756' avgSpotLen=80 biosample='SAMN07224698' />
<@sample id=301 GSM='GSM2666610' condition='Sed-HFD, post'         individ=99  SRA='SRX2914252' SRR='SRR5678757' avgSpotLen=80 biosample='SAMN07224697' />
<@sample id=302 GSM='GSM2666611' condition='Sed-HFD, post'         individ=101 SRA='SRX2914253' SRR='SRR5678758' avgSpotLen=80 biosample='SAMN07224696' />
<@sample id=303 GSM='GSM2666612' condition='Ex-HFD, post'          individ=103 SRA='SRX2914254' SRR='SRR5678759' avgSpotLen=80 biosample='SAMN07224695' />
<@sample id=304 GSM='GSM2666613' condition='control diet, pre-HFD' individ=107 SRA='SRX2914255' SRR='SRR5678760' avgSpotLen=80 biosample='SAMN07224694' />
<@sample id=305 GSM='GSM2666614' condition='control diet, pre-HFD' individ=109 SRA='SRX2914256' SRR='SRR5678761' avgSpotLen=80 biosample='SAMN07224693' />
<@sample id=306 GSM='GSM2666615' condition='control diet, pre-HFD' individ=98  SRA='SRX2914257' SRR='SRR5678762' avgSpotLen=80 biosample='SAMN07224692' />
<@sample id=307 GSM='GSM2666616' condition='control diet, pre-HFD' individ=100 SRA='SRX2914258' SRR='SRR5678763' avgSpotLen=80 biosample='SAMN07224691' />
<@sample id=308 GSM='GSM2666617' condition='control diet, pre-HFD' individ=102 SRA='SRX2914259' SRR='SRR5678764' avgSpotLen=80 biosample='SAMN07224690' />
<@sample id=309 GSM='GSM2666618' condition='control diet, pre-HFD' individ=104 SRA='SRX2914260' SRR='SRR5678765' avgSpotLen=80 biosample='SAMN07224689' />
<@sample id=310 GSM='GSM2666619' condition='control diet, pre-HFD' individ=105 SRA='SRX2914261' SRR='SRR5678766' avgSpotLen=80 biosample='SAMN07224688' />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
