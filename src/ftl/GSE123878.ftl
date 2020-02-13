<#include 'common'/>

delete from series where GSE='GSE123878';

<#assign SERIES_ID=6>

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(${SERIES_ID}, 'GSE123878', 31589602, ${mouse}, ${rna_seq},
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

<@condition id=31  title='Control, quadriceps'          status=untrained time=0 treatment='NULL' />
<@condition id=32  title='Exercise, quadriceps'         status=untrained time=0 treatment='NULL' /> 
<@condition id=33  title='PGC1a-transgenic, quadriceps' status=untrained time=0 treatment='NULL' />

-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (26, 27, 28);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 1, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=26 title='Untrained quadriceps after exercises'         condition1=32 condition2=31 comment='NULL' /> 
<@comparison id=27 title='Untrained quadriceps, exercises vs transgene' condition1=32 condition2=33 comment='NULL' /> 
<@comparison id=28 title='Untrained quadriceps, transgene effect'       condition1=33 condition2=31 comment='NULL' /> 
-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197);
delete from samples where id IN (183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197);

<#macro sample id, GSM, condition, individ, SRA, SRR, avgSpotLen, biosample>
<#local title = condition + '_' + individ>
<#local platform = Illumina_NextSeq_500 />

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, avgSpotLen, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${avgSpotLen}, ${id}, ${SERIES_ID});

</#macro>

<@sample id=183 GSM='GSM3515061' condition='Control, quadriceps'  		  individ=45 SRA='SRX5131601' SRR='SRR8319144' avgSpotLen=75 biosample='SAMN10596284' />
<@sample id=184 GSM='GSM3515062' condition='Control, quadriceps'  		  individ=46 SRA='SRX5131602' SRR='SRR8319148' avgSpotLen=75 biosample='SAMN10596283' />
<@sample id=185 GSM='GSM3515063' condition='Control, quadriceps'  		  individ=47 SRA='SRX5131603' SRR='SRR8319152' avgSpotLen=75 biosample='SAMN10596282' />
<@sample id=186 GSM='GSM3515064' condition='Control, quadriceps'  		  individ=48 SRA='SRX5131604' SRR='SRR8319156' avgSpotLen=75 biosample='SAMN10596281' />
<@sample id=187 GSM='GSM3515065' condition='Control, quadriceps'  		  individ=49 SRA='SRX5131605' SRR='SRR8319160' avgSpotLen=75 biosample='SAMN10596280' />
<@sample id=188 GSM='GSM3515066' condition='Exercise, quadriceps' 	 	  individ=50 SRA='SRX5131606' SRR='SRR8319164' avgSpotLen=75 biosample='SAMN10596279' />
<@sample id=189 GSM='GSM3515067' condition='Exercise, quadriceps' 		  individ=51 SRA='SRX5131607' SRR='SRR8319168' avgSpotLen=75 biosample='SAMN10596278' />
<@sample id=190 GSM='GSM3515068' condition='Exercise, quadriceps' 		  individ=52 SRA='SRX5131608' SRR='SRR8319172' avgSpotLen=75 biosample='SAMN10596277' />
<@sample id=191 GSM='GSM3515069' condition='Exercise, quadriceps' 		  individ=53 SRA='SRX5131609' SRR='SRR8319176' avgSpotLen=75 biosample='SAMN10595913' />
<@sample id=192 GSM='GSM3515070' condition='Exercise, quadriceps' 		  individ=54 SRA='SRX5131610' SRR='SRR8319180' avgSpotLen=75 biosample='SAMN10595912' />
<@sample id=193 GSM='GSM3515071' condition='PGC1a-transgenic, quadriceps' individ=55 SRA='SRX5131611' SRR='SRR8319184' avgSpotLen=75 biosample='SAMN10595911' />
<@sample id=194 GSM='GSM3515072' condition='PGC1a-transgenic, quadriceps' individ=56 SRA='SRX5131612' SRR='SRR8319188' avgSpotLen=75 biosample='SAMN10595910' />
<@sample id=195 GSM='GSM3515073' condition='PGC1a-transgenic, quadriceps' individ=57 SRA='SRX5131613' SRR='SRR8319192' avgSpotLen=75 biosample='SAMN10595909' />
<@sample id=196 GSM='GSM3515074' condition='PGC1a-transgenic, quadriceps' individ=58 SRA='SRX5131614' SRR='SRR8319196' avgSpotLen=75 biosample='SAMN10595908' />
<@sample id=197 GSM='GSM3515075' condition='PGC1a-transgenic, quadriceps' individ=59 SRA='SRX5131615' SRR='SRR8319200' avgSpotLen=51 biosample='SAMN10595907' />

<#macro srr2 id, SRR>
UPDATE samples SET srr2=${SRR?str} WHERE samples.id=${id};
</#macro>

<@srr2 id=183 SRR='SRR8319145' />
<@srr2 id=184 SRR='SRR8319149' />
<@srr2 id=185 SRR='SRR8319153' />
<@srr2 id=186 SRR='SRR8319157' />
<@srr2 id=187 SRR='SRR8319161' />
<@srr2 id=188 SRR='SRR8319165' />
<@srr2 id=189 SRR='SRR8319169' />
<@srr2 id=190 SRR='SRR8319173' />
<@srr2 id=191 SRR='SRR8319177' />
<@srr2 id=192 SRR='SRR8319181' />
<@srr2 id=193 SRR='SRR8319185' />
<@srr2 id=194 SRR='SRR8319189' />
<@srr2 id=195 SRR='SRR8319193' />
<@srr2 id=196 SRR='SRR8319197' />
<@srr2 id=197 SRR='SRR8319201' />

<#macro srr3 id, SRR>
UPDATE samples SET srr3=${SRR?str} WHERE samples.id=${id};
</#macro>

<@srr3 id=183 SRR='SRR8319146' />
<@srr3 id=184 SRR='SRR8319150' />
<@srr3 id=185 SRR='SRR8319154' />
<@srr3 id=186 SRR='SRR8319158' />
<@srr3 id=187 SRR='SRR8319162' />
<@srr3 id=188 SRR='SRR8319166' />
<@srr3 id=189 SRR='SRR8319170' />
<@srr3 id=190 SRR='SRR8319174' />
<@srr3 id=191 SRR='SRR8319178' />
<@srr3 id=192 SRR='SRR8319182' />
<@srr3 id=193 SRR='SRR8319186' />
<@srr3 id=194 SRR='SRR8319190' />
<@srr3 id=195 SRR='SRR8319194' />
<@srr3 id=196 SRR='SRR8319198' />
<@srr3 id=197 SRR='SRR8319202' />


<#macro srr4 id, SRR>
UPDATE samples SET srr4=${SRR?str} WHERE samples.id=${id};
</#macro>

<@srr4 id=183 SRR='SRR8319147' />
<@srr4 id=184 SRR='SRR8319151' />
<@srr4 id=185 SRR='SRR8319155' />
<@srr4 id=186 SRR='SRR8319159' />
<@srr4 id=187 SRR='SRR8319163' />
<@srr4 id=188 SRR='SRR8319167' />
<@srr4 id=189 SRR='SRR8319171' />
<@srr4 id=190 SRR='SRR8319175' />
<@srr4 id=191 SRR='SRR8319179' />
<@srr4 id=192 SRR='SRR8319183' />
<@srr4 id=193 SRR='SRR8319187' />
<@srr4 id=194 SRR='SRR8319191' />
<@srr4 id=195 SRR='SRR8319195' />
<@srr4 id=196 SRR='SRR8319199' />
<@srr4 id=197 SRR='SRR8319203' />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
