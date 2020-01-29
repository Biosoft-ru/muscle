<#include 'common'/>

delete from series where GSE='GSE123878';

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(5, 'GSE123878', 31589602, ${mouse}, ${rna_seq},
'Enhancer Profiling Reveals Regulators of Skeletal Muscle Identity and Reprogramming [RNA-seq]', 

${"Chromatin immunoprecipitation sequencing of H3K4me2, H3K27ac as well as, ATACseq and RNA-seq reveals regulatory landscapes across different muscle groups, as well as in response to chronic exercise or muscle PGC1a overexpression. This work defines the unique enhancer repetoire of skeletal muscle in vivo and reveals that highly divergent exercise-induced or PGC1a-driven epigenomic programs direct partially convergent transcriptional networks."?str},

${"Genome-wide maps of chromatin state in skeletal muscle in exercise, sedentary and transgenic PGC1a conditions.

<br/><br/>Symbols in file names: 
<ul>
 <li>ControlQuad – quadriceps, control;</li> 
 <li>ExerciseQuad – quadriceps, after exercise;</li> 
 <li>PGC1transgenic - quadriceps from mice that constitutively express Pgc1a under control of the muscle creatine kinase promoter, without exercises;</li> 
  <li>rep1, ..., rep5 - replicate 1, ..., replicate 5;</li>
  </ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${mouse}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=1 code=1 sex='male' />
<@individ id=2 code=2 sex='male' />
<@individ id=3 code=3 sex='male' />
<@individ id=4 code=4 sex='male' />
<@individ id=5 code=5 sex='male' />
<@individ id=6 code=6 sex='male' />
<@individ id=7 code=7 sex='male' />
<@individ id=8 code=8 sex='male' />
<@individ id=9 code=9 sex='male' />
<@individ id=10 code=10 sex='male' />
<@individ id=11 code=11 sex='male' />
<@individ id=12 code=12 sex='male' />
<@individ id=13 code=13 sex='male' />
<@individ id=14 code=14 sex='male' />
<@individ id=15 code=15 sex='male' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (1,2,3);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=1  title='Control' status=untrained time=  0 treatment='none'?str />
<@condition id=2  title='Exercise' status=untrained time= 0 treatment='none'?str/> 
<@condition id=3  title='PGC1a-transgenic' status=untrained time= 0 treatment='none'?str/>

-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (1, 2, 3);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 1, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=1 title='Untrained quadriceps after exercises' condition1=2 condition2=1 comment='NULL' /> 
<@comparison id=2 title='Untrained quadriceps, exercises vs transgene' condition1=2 condition2=3 comment='NULL' /> 
<@comparison id=3 title='Untrained quadriceps, transgene effect' condition1=3 condition2=1 comment='NULL' /> 
-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
delete from samples where id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);

<#macro sample id, GSM, condition, individ, platform, SRA, SRR, avgSpotLen, biosample>

<#local title = condition + '_' + individ>

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, avgSpotLen, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${avgSpotLen}, ${id}, 5);

</#macro>

<@sample id=1 GSM='GSM3515061' condition='control_quadriceps' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131601' SRR='SRR8319144;SRR8319145;SRR8319146;SRR8319147' avgSpotLen=75 biosample='SAMN10596284' />
<@sample id=2 GSM='GSM3515062' condition='control_quadriceps' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131602' SRR='SRR8319148;SRR8319149;SRR8319150;SRR8319151' avgSpotLen=75 biosample='SAMN10596283' />
<@sample id=3 GSM='GSM3515063' condition='control_quadriceps' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131603' SRR='SRR8319152;SRR8319153;SRR8319154;SRR8319155' avgSpotLen=75 biosample='SAMN10596282' />
<@sample id=4 GSM='GSM3515064' condition='control_quadriceps' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131604' SRR='SRR8319156;SRR8319157;SRR8319158;SRR8319159' avgSpotLen=75 biosample='SAMN10596281' />
<@sample id=5 GSM='GSM3515065' condition='control_quadriceps' individ=1 platform=Illumina_NextSeq_500 SRA='	SRX5131605' SRR='SRR8319160;SRR8319161;SRR8319162;SRR8319163' avgSpotLen=75 biosample='SAMN10596280' />
<@sample id=6 GSM='GSM3515066' condition='exercise_quadriceps' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131606' SRR='SRR8319164;SRR8319165;SRR8319166;SRR8319167' avgSpotLen=75 biosample='SAMN10596279' />
<@sample id=7 GSM='GSM3515067' condition='exercise_quadriceps' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131607' SRR='SRR8319168;SRR8319169;SRR8319170;SRR8319171' avgSpotLen=75 biosample='SAMN10596278' />
<@sample id=8 GSM='GSM3515068' condition='exercise_quadriceps' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131608' SRR='SRR8319172;SRR8319173;SRR8319174;SRR8319175' avgSpotLen=75 biosample='SAMN10596277' />
<@sample id=9 GSM='GSM3515069' condition='exercise_quadriceps' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131609' SRR='SRR8319176;SRR8319177;SRR8319178;SRR8319179' avgSpotLen=75 biosample='SAMN10595913' />
<@sample id=10 GSM='GSM3515070' condition='exercise_quadriceps' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131610' SRR='SRR8319180;SRR8319181;SRR8319182;SRR8319183' avgSpotLen=75 biosample='SAMN10595912' />
<@sample id=11 GSM='GSM3515071' condition='PGC1transgenic' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131611' SRR='SRR8319184;SRR8319185;SRR8319186;SRR8319187' avgSpotLen=75 biosample='SAMN10595911' />
<@sample id=12 GSM='GSM3515072' condition='PGC1transgenic' individ=1 platform=Illumina_NextSeq_500 SRA='SRX5131612' SRR='SRR8319188;SRR8319189;SRR83191890;SRR8319191' avgSpotLen=75 biosample='SAMN10595910' />
<@sample id=13 GSM='GSM3515073' condition='PGC1transgenic' individ=2 platform=Illumina_NextSeq_500 SRA='SRX5131613' SRR='SRR8319192;SRR8319193;SRR8319194;SRR8319195' avgSpotLen=75 biosample='SAMN10595909' />
<@sample id=14 GSM='GSM3515074' condition='PGC1transgenic' individ=2 platform=Illumina_NextSeq_500 SRA='SRX5131614' SRR='SRR8319196;SRR8319197;SRR8319198;SRR8319199' avgSpotLen=75 biosample='SAMN10595908' />
<@sample id=15 GSM='GSM3515075' condition='PGC1transgenic' individ=2 platform=Illumina_NextSeq_500 SRA='SRX5131615' SRR='SRR8319200;SRR8319201;SRR8319202;SRR8319203' avgSpotLen=51 biosample='SAMN10595907' />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control