<#include 'common'/>

delete from series where GSE='GSE63887';

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(5, 'GSE63887', 28545587, ${human}, ${rna_seq},
'RNA-sequencing of healthy human skeletal myocytes', 

${"Skeletal myocytes are metabolically active and susceptible to insulin resistance, thus implicated in type 2 diabetes (T2D). This complex disease involves systemic metabolic changes and their elucidation at the systems level requires genome-wide data and biological networks. Genome-scale metabolic models (GEMs) provide a network-context to integrate high-throughput data. We generated myocyte-specific RNA-seq data and investigated their correlation with proteome data. These data were then used to reconstruct a comprehensive myocyte GEM. Next, we performed a meta-analysis of six studies comparing muscle transcription in T2D versus healthy subjects. Transcriptional changes were mapped on the myocyte GEM, revealing extensive transcriptional regulation in T2D, particularly around pyruvate oxidation, branched-chain amino acid catabolism, and tetrahydrofolate metabolism, connected through the down-regulated dihydrolipoamide dehydrogenase. Strikingly, the gene signature underlying this metabolic regulation successfully classifies the disease state of individual samples, suggesting that regulation of these pathways is a ubiquitous feature of myocytes in response to T2D.."?str},

${"Isolated skeletal muscle precursor cells from six normal glucose tolerant and non-obese males and females were differentiated in vitro. RNA from fully differentiated myotubes was sequenced using RNA-seq.

<br/><br/>Symbols in file names: 
<ul>
 Male1 - man,
 Female - woman,
 ngt - normal glucose tolerant.
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (39, 40, 41, 42, 43, 44);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=39 code=34a sex='male' stage='differentiated myotubes' />
<@individ id=40 code=32a sex='male' stage='differentiated myotubes' />
<@individ id=41 code=35a sex='male' stage='differentiated myotubes' />
<@individ id=42 code=23a sex='female' stage='differentiated myotubes' />
<@individ id=43 code=13a sex='female' stage='differentiated myotubes' />
<@individ id=44 code=2a sex='female' stage='differentiated myotubes' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (29, 30);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=29  title='Male, vastus lateralis muscle, non-treated' status=untrained time=  0 treatment='none' />
<@condition id=30  title='Female, vastus lateralis muscle, non-treated' status=untrained time=  0 treatment='none' />


-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (25);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 2, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=25 title='Non-treated skeletal muscle, male vs female' condition1=29 condition2=30 comment='NULL' /> 

-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (177, 178, 179, 180, 181, 182);
delete from samples where id IN (177, 178, 179, 180, 181, 182);


<#macro sample id, GSM, condition, individ, platform, SRA, SRR, avgSpotLen, biosample>

<#local title = condition + '_' + individ>

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, avgSpotLen, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${avgSpotLen}, ${id}, 3);

</#macro>

<@sample id=177 GSM='GSM1559439' condition='Male, vastus lateralis muscle, non-treated' individ=39 platform=Illumina_HiSeq_2500 SRA='SRX796615' SRR='SRR1693845' avgSpotLen=200 biosample='SAMN03253151' />
<@sample id=178 GSM='GSM1559440' condition='Male, vastus lateralis muscle, non-treated' individ=40 platform=Illumina_HiSeq_2500 SRA='SRX796616' SRR='SRR1693846' avgSpotLen=200 biosample='SAMN03253150' />
<@sample id=179 GSM='GSM1559441' condition='Male, vastus lateralis muscle, non-treated' individ=41 platform=Illumina_HiSeq_2500 SRA='SRX796617' SRR='SRR1693847' avgSpotLen=200 biosample='SAMN03253149' />
<@sample id=180 GSM='GSM1559442' condition='Female, vastus lateralis muscle, non-treated' individ=42 platform=Illumina_HiSeq_2000 SRA='SRX796618' SRR='SRR1693849' avgSpotLen=200 biosample='SAMN03253146' />
<@sample id=181 GSM='GSM1559443' condition='Female, vastus lateralis muscle, non-treated' individ=43 platform=Illumina_HiSeq_2000 SRA='SRX796619' SRR='SRR1693850' avgSpotLen=200 biosample='SAMN03253148' />
<@sample id=182 GSM='GSM1559444' condition='Female, vastus lateralis muscle, non-treated' individ=44 platform=Illumina_HiSeq_2000 SRA='SRX796620' SRR='SRR1693851' avgSpotLen=200 biosample='SAMN03253147' />


<#macro srr2 id, SRR>
UPDATE samples SET srr2=${SRR?str} WHERE samples.id=${id};
</#macro>

<@srr2 id=179 SRR='SRR1693848' />


-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
