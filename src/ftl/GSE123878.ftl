<#include 'common'/>

delete from series where GSE='GSE123878';

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(6, 'GSE123878', 31589602, ${mouse}, ${rna_seq},
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

delete from individuals where ID IN (45,46,47,48,49,50,51,52,53,54,55,56,57,58,59);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${mouse}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=45 code=1 sex='male' />
<@individ id=46 code=2 sex='male' />
<@individ id=47 code=3 sex='male' />
<@individ id=48 code=4 sex='male' />
<@individ id=49 code=5 sex='male' />
<@individ id=50 code=6 sex='male' />
<@individ id=51 code=7 sex='male' />
<@individ id=52 code=8 sex='male' />
<@individ id=53 code=9 sex='male' />
<@individ id=54 code=10 sex='male' />
<@individ id=55 code=11 sex='male' />
<@individ id=56 code=12 sex='male' />
<@individ id=57 code=13 sex='male' />
<@individ id=58 code=14 sex='male' />
<@individ id=59 code=15 sex='male' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (31,32,33);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=31  title='Control_quadriceps' status=untrained time=  0 treatment='none'?str />
<@condition id=32  title='Exercise_quadriceps' status=untrained time= 0 treatment='none'?str/> 
<@condition id=33  title='PGC1a-transgenic' status=untrained time= 0 treatment='none'?str/>

-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (26, 27, 28);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 1, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=26 title='Untrained quadriceps after exercises' condition1=2 condition2=1 comment='NULL' /> 
<@comparison id=27 title='Untrained quadriceps, exercises vs transgene' condition1=2 condition2=3 comment='NULL' /> 
<@comparison id=28 title='Untrained quadriceps, transgene effect' condition1=3 condition2=1 comment='NULL' /> 
-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197);
delete from samples where id IN (183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197);

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

<@sample id=183 GSM='GSM3515061' condition='control_quadriceps' individ=45 platform=Illumina_NextSeq_500 SRA='SRX5131601' SRR='SRR8319144;SRR8319145;SRR8319146;SRR8319147' avgSpotLen=75 biosample='SAMN10596284' />
<@sample id=184 GSM='GSM3515062' condition='control_quadriceps' individ=46 platform=Illumina_NextSeq_500 SRA='SRX5131602' SRR='SRR8319148;SRR8319149;SRR8319150;SRR8319151' avgSpotLen=75 biosample='SAMN10596283' />
<@sample id=185 GSM='GSM3515063' condition='control_quadriceps' individ=47 platform=Illumina_NextSeq_500 SRA='SRX5131603' SRR='SRR8319152;SRR8319153;SRR8319154;SRR8319155' avgSpotLen=75 biosample='SAMN10596282' />
<@sample id=186 GSM='GSM3515064' condition='control_quadriceps' individ=48 platform=Illumina_NextSeq_500 SRA='SRX5131604' SRR='SRR8319156;SRR8319157;SRR8319158;SRR8319159' avgSpotLen=75 biosample='SAMN10596281' />
<@sample id=187 GSM='GSM3515065' condition='control_quadriceps' individ=49 platform=Illumina_NextSeq_500 SRA='	SRX5131605' SRR='SRR8319160;SRR8319161;SRR8319162;SRR8319163' avgSpotLen=75 biosample='SAMN10596280' />
<@sample id=188 GSM='GSM3515066' condition='exercise_quadriceps' individ=50 platform=Illumina_NextSeq_500 SRA='SRX5131606' SRR='SRR8319164;SRR8319165;SRR8319166;SRR8319167' avgSpotLen=75 biosample='SAMN10596279' />
<@sample id=189 GSM='GSM3515067' condition='exercise_quadriceps' individ=51 platform=Illumina_NextSeq_500 SRA='SRX5131607' SRR='SRR8319168;SRR8319169;SRR8319170;SRR8319171' avgSpotLen=75 biosample='SAMN10596278' />
<@sample id=190 GSM='GSM3515068' condition='exercise_quadriceps' individ=52 platform=Illumina_NextSeq_500 SRA='SRX5131608' SRR='SRR8319172;SRR8319173;SRR8319174;SRR8319175' avgSpotLen=75 biosample='SAMN10596277' />
<@sample id=191 GSM='GSM3515069' condition='exercise_quadriceps' individ=53 platform=Illumina_NextSeq_500 SRA='SRX5131609' SRR='SRR8319176;SRR8319177;SRR8319178;SRR8319179' avgSpotLen=75 biosample='SAMN10595913' />
<@sample id=192 GSM='GSM3515070' condition='exercise_quadriceps' individ=54 platform=Illumina_NextSeq_500 SRA='SRX5131610' SRR='SRR8319180;SRR8319181;SRR8319182;SRR8319183' avgSpotLen=75 biosample='SAMN10595912' />
<@sample id=193 GSM='GSM3515071' condition='PGC1transgenic' individ=55 platform=Illumina_NextSeq_500 SRA='SRX5131611' SRR='SRR8319184;SRR8319185;SRR8319186;SRR8319187' avgSpotLen=75 biosample='SAMN10595911' />
<@sample id=194 GSM='GSM3515072' condition='PGC1transgenic' individ=56 platform=Illumina_NextSeq_500 SRA='SRX5131612' SRR='SRR8319188;SRR8319189;SRR83191890;SRR8319191' avgSpotLen=75 biosample='SAMN10595910' />
<@sample id=195 GSM='GSM3515073' condition='PGC1transgenic' individ=57 platform=Illumina_NextSeq_500 SRA='SRX5131613' SRR='SRR8319192;SRR8319193;SRR8319194;SRR8319195' avgSpotLen=75 biosample='SAMN10595909' />
<@sample id=196 GSM='GSM3515074' condition='PGC1transgenic' individ=58 platform=Illumina_NextSeq_500 SRA='SRX5131614' SRR='SRR8319196;SRR8319197;SRR8319198;SRR8319199' avgSpotLen=75 biosample='SAMN10595908' />
<@sample id=197 GSM='GSM3515075' condition='PGC1transgenic' individ=59 platform=Illumina_NextSeq_500 SRA='SRX5131615' SRR='SRR8319200;SRR8319201;SRR8319202;SRR8319203' avgSpotLen=51 biosample='SAMN10595907' />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
