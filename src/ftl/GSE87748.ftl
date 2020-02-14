<#include 'common'/>

delete from series where GSE='GSE87748';

<#assign SERIES_ID=8>

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(${SERIES_ID}, 'GSE87748', 28066330, ${human}, ${rna_seq},
'An electrical pulse stimulation protocol to study acute epigenetic response to muscle cell contraction uncovers acute hydroxymethylation of the exercise-responsive gene Nr4a3 [RNA-Seq]', 

${"Physical exercise triggers numerous positive adaptations through the regulation of genes controlling muscle structure and function. Epigenetic factors like DNA methylation participate in transcriptional activation by allowing the recruitment of the transcription machinery to gene promoters. Exercise induces dynamic DNA demethylation at gene promoters, but the contribution of the demethylation precursor hydroxymethylcytosine is unknown. Given the evanescent nature of hydroxymethylcytosine, a model of muscle contraction amenable to collection of repeated and acute time series is requested to determine if contraction-induced demethylation is preceded by increased hydroxymethylcytosine levels. Here, we aimed to establish an acute skeletal muscle contraction model that could, at least partly, mimic the effect of acute exercise on gene expression, in order to investigate the effect of muscle contraction in DNA demethylation and hydroxymethylation. We refined an Electrical Pulse Stimulation (EPS) protocol in C2C12 myotubes that we benchmarked to the nuclear receptor subfamily 4 group A member 3 (Nr4a3) gene, a gene selected for having the highest increase in expression in response to acute exercise in humans. Using targeted bisulfite sequencing, we found that a region of the Nr4a3 promoter is rapidly demethylated 60 minutes after EPS and subsequently re-methylated after 120 minutes. Of interest, hydroxymethylation of the differentially methylated region of Nr4a3 promoter after EPS was elevated at 0 minutes and reached lowest levels at 60 minutes after EPS. We established a cell culture-based protocol to mimic acute transcriptional responses to exercise and provide insight into the mechanism by which exercise-responsive genes are demethylated after muscle contraction."?str},

${"Ten human subjects sampled pre and post exercise.

<br/><br/>Symbols in file names: 
<ul>
 240 - muscle biopsy 240 min after 15-minute exercise bout,
 Basal - muscle biopsy before exercise.
 
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (66,67,68,69,70,71,72,73,74,75);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=66 code=4 sex='male' />
<@individ id=67 code=5 sex='male' />
<@individ id=68 code=7 sex='male' />
<@individ id=69 code=8 sex='male' />
<@individ id=70 code=9 sex='male' />
<@individ id=71 code=11 sex='male' />
<@individ id=72 code=13 sex='male' />
<@individ id=73 code=14 sex='male' />
<@individ id=74 code=15 sex='male' />
<@individ id=75 code=16 sex='male' />


--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (34,35);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=34  title='Male, leg, non-treated'   status=untrained time=0 treatment='NULL' />
<@condition id=35  title='Male, leg, treated'       status=untrained time=240 treatment=15 />

-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (29);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 2, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=29 title='Male leg, treated vs non-treated'   condition1=35 condition2=34 comment='NULL' /> 

-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240);
delete from samples where id IN (221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240);

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

<@sample id=221 GSM='GSM2339828' condition='Male, leg, treated'     individ=66 SRA='SRX2229360' SRR='SRR4381395' avgSpotLen=100 biosample='SAMN05879201' />
<@sample id=222 GSM='GSM2339829' condition='Male, leg, non-treated' individ=66 SRA='SRX2229361' SRR='SRR4381396' avgSpotLen=100 biosample='SAMN05879219' />
<@sample id=223 GSM='GSM2339830' condition='Male, leg, treated'     individ=67 SRA='SRX2229362' SRR='SRR4381397' avgSpotLen=100 biosample='SAMN05879200' />
<@sample id=224 GSM='GSM2339831' condition='Male, leg, non-treated' individ=67 SRA='SRX2229363' SRR='SRR4381398' avgSpotLen=100 biosample='SAMN05879199' />
<@sample id=225 GSM='GSM2339832' condition='Male, leg, treated'     individ=68 SRA='SRX2229364' SRR='SRR4381399' avgSpotLen=100 biosample='SAMN05879198' />
<@sample id=226 GSM='GSM2339833' condition='Male, leg, non-treated' individ=68 SRA='SRX2229365' SRR='SRR4381400' avgSpotLen=100 biosample='SAMN05879197' />
<@sample id=227 GSM='GSM2339834' condition='Male, leg, treated'     individ=69 SRA='SRX2229366' SRR='SRR4381401' avgSpotLen=100 biosample='SAMN05879221' />
<@sample id=228 GSM='GSM2339835' condition='Male, leg, non-treated' individ=69 SRA='SRX2229367' SRR='SRR4381402' avgSpotLen=100 biosample='SAMN05879220' />
<@sample id=229 GSM='GSM2339836' condition='Male, leg, treated'     individ=70 SRA='SRX2229368' SRR='SRR4381403' avgSpotLen=100 biosample='SAMN05879211' />
<@sample id=230 GSM='GSM2339837' condition='Male, leg, non-treated' individ=70 SRA='SRX2229369' SRR='SRR4381404' avgSpotLen=100 biosample='SAMN05879218' />
<@sample id=231 GSM='GSM2339838' condition='Male, leg, treated'     individ=71 SRA='SRX2229370' SRR='SRR4381405' avgSpotLen=100 biosample='SAMN05879217' />
<@sample id=232 GSM='GSM2339839' condition='Male, leg, non-treated' individ=71 SRA='SRX2229371' SRR='SRR4381406' avgSpotLen=100 biosample='SAMN05879216' />
<@sample id=233 GSM='GSM2339840' condition='Male, leg, treated'     individ=72 SRA='SRX2229372' SRR='SRR4381407' avgSpotLen=100 biosample='SAMN05879215' />
<@sample id=234 GSM='GSM2339841' condition='Male, leg, non-treated' individ=72 SRA='SRX2229373' SRR='SRR4381408' avgSpotLen=100 biosample='SAMN05879214' />
<@sample id=235 GSM='GSM2339842' condition='Male, leg, treated'     individ=73 SRA='SRX2229374' SRR='SRR4381409' avgSpotLen=100 biosample='SAMN05879213' />
<@sample id=236 GSM='GSM2339843' condition='Male, leg, non-treated' individ=73 SRA='SRX2229375' SRR='SRR4381410' avgSpotLen=100 biosample='SAMN05879212' />
<@sample id=237 GSM='GSM2339844' condition='Male, leg, treated'     individ=74 SRA='SRX2229376' SRR='SRR4381411' avgSpotLen=100 biosample='SAMN05879245' />
<@sample id=238 GSM='GSM2339845' condition='Male, leg, non-treated' individ=74 SRA='SRX2229377' SRR='SRR4381412' avgSpotLen=100 biosample='SAMN05879244' />
<@sample id=239 GSM='GSM2339846' condition='Male, leg, treated'     individ=75 SRA='SRX2229378' SRR='SRR4381413' avgSpotLen=100 biosample='SAMN05879243' />
<@sample id=240 GSM='GSM2339847' condition='Male, leg, non-treated' individ=75 SRA='SRX2229379' SRR='SRR4381414' avgSpotLen=100 biosample='SAMN05879242' />


-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
