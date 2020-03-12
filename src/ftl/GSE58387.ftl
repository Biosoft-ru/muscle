<#include 'common'/>

delete from series where GSE='GSE58387';

<#assign SERIES_ID=7>

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(${SERIES_ID}, 'GSE58387', 25016029, ${human}, ${rna_seq},
'The human skeletal muscle transcriptome – sex differences, alternative splicing and tissue homogeneity assessed with RNA sequencing', 

${"The amount of RNA sequencing data on skeletal muscle is very limited. We have analyzed a large set of human muscle biopsy samples and provide extensive information on the baseline skeletal muscle transcriptome, including completely novel protein-coding transcripts."?str},

${"Analyze of transcriptome in 23 skeletal muscle biopsy samples from six individuals. Four biopsies from each subject, two biopsies from each leg (except subject 6 which has only three biopsies in total).

<br/><br/>Symbols in file names: 
<ul>
 none
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (60,61,62,63,64,65);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=60 code=6 sex='male' />
<@individ id=61 code=10 sex='female' />
<@individ id=62 code=17 sex='female' />
<@individ id=63 code=29 sex='male' />
<@individ id=64 code=30 sex='male' />
<@individ id=65 code=31 sex='female' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (21,22,25,26);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=21  title='Male, right leg'   status=untrained time=0 treatment='NULL' />
<@condition id=22  title='Male, left leg'    status=untrained time=0 treatment='NULL' />
<@condition id=25  title='Female, right leg' status=untrained time=0 treatment='NULL' />
<@condition id=26  title='Female, left leg'  status=untrained time=0 treatment='NULL' />
-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (19,22,29,30);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, ${SERIES_ID}, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=19 title='Non-treated male skeletal muscle, right leg vs left leg'   condition1=21 condition2=22 comment='NULL' /> 
<@comparison id=22 title='Non-treated female skeletal muscle, right leg vs left leg' condition1=25 condition2=26 comment='NULL' /> 
<@comparison id=29 title='Non-treated skeletal muscle, right leg, male vs female'    condition1=21 condition2=25 comment='NULL' />
<@comparison id=30 title='Non-treated skeletal muscle, left leg, male vs female'     condition1=22 condition2=26 comment='NULL' />

-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220);
delete from samples where id IN (198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220);

<#macro sample id, GSM, condition, individ, SRA, SRR, avgSpotLen, biosample>

<#local platform = Illumina_HiSeq_2000 />
<#local title = condition + '_' + individ>

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, avgSpotLen, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${avgSpotLen}, ${id}, ${SERIES_ID});

</#macro>

<@sample id=198 GSM='GSM1409687' condition='Male, left leg'     individ=60 SRA='SRX589524' SRR='SRR1377145' avgSpotLen=200 biosample='SAMN02850578' />
<@sample id=199 GSM='GSM1409688' condition='Male, right leg'    individ=60 SRA='SRX589525' SRR='SRR1377149' avgSpotLen=200 biosample='SAMN02850577' />
<@sample id=200 GSM='GSM1409689' condition='Male, right leg' 	individ=60 SRA='SRX589526' SRR='SRR1377153' avgSpotLen=200 biosample='SAMN02850581' />
<@sample id=201 GSM='GSM1409690' condition='Female, left leg' 	individ=61 SRA='SRX589527' SRR='SRR1377157' avgSpotLen=200 biosample='SAMN02850579' />
<@sample id=202 GSM='GSM1409691' condition='Female, left leg' 	individ=61 SRA='SRX589528' SRR='SRR1377161' avgSpotLen=200 biosample='SAMN02850580' />
<@sample id=203 GSM='GSM1409692' condition='Female, right leg'  individ=61 SRA='SRX589529' SRR='SRR1377165' avgSpotLen=200 biosample='SAMN02850584' />
<@sample id=204 GSM='GSM1409693' condition='Female, right leg'  individ=61 SRA='SRX589530' SRR='SRR1377169' avgSpotLen=200 biosample='SAMN02850583' />
<@sample id=205 GSM='GSM1409694' condition='Female, left leg' 	individ=62 SRA='SRX589531' SRR='SRR1377173' avgSpotLen=200 biosample='SAMN02850582' />
<@sample id=206 GSM='GSM1409695' condition='Female, left leg' 	individ=62 SRA='SRX589532' SRR='SRR1377177' avgSpotLen=200 biosample='SAMN02850590' />
<@sample id=207 GSM='GSM1409696' condition='Female, right leg'  individ=62 SRA='SRX589533' SRR='SRR1377181' avgSpotLen=200 biosample='SAMN02850587' />
<@sample id=208 GSM='GSM1409697' condition='Female, right leg'  individ=62 SRA='SRX589534' SRR='SRR1377185' avgSpotLen=200 biosample='SAMN02850585' />
<@sample id=209 GSM='GSM1409698' condition='Male, left leg' 	individ=63 SRA='SRX589535' SRR='SRR1377189' avgSpotLen=200 biosample='SAMN02850588' />
<@sample id=210 GSM='GSM1409699' condition='Male, left leg' 	individ=63 SRA='SRX589536' SRR='SRR1377192' avgSpotLen=200 biosample='SAMN02850586' />
<@sample id=211 GSM='GSM1409700' condition='Male, right leg' 	individ=63 SRA='SRX589537' SRR='SRR1377195' avgSpotLen=200 biosample='SAMN02850599' />
<@sample id=212 GSM='GSM1409701' condition='Male, right leg' 	individ=63 SRA='SRX589538' SRR='SRR1377198' avgSpotLen=200 biosample='SAMN02850591' />
<@sample id=213 GSM='GSM1409702' condition='Male, right leg' 	individ=64 SRA='SRX589539' SRR='SRR1377201' avgSpotLen=200 biosample='SAMN02850589' />
<@sample id=214 GSM='GSM1409703' condition='Male, right leg' 	individ=64 SRA='SRX589540' SRR='SRR1377204' avgSpotLen=200 biosample='SAMN02850595' />
<@sample id=215 GSM='GSM1409704' condition='Male, left leg' 	individ=64 SRA='SRX589541' SRR='SRR1377207' avgSpotLen=200 biosample='SAMN02850598' />
<@sample id=216 GSM='GSM1409705' condition='Male, left leg' 	individ=64 SRA='SRX589542' SRR='SRR1377210' avgSpotLen=200 biosample='SAMN02850593' />
<@sample id=217 GSM='GSM1409706' condition='Female, right leg'  individ=65 SRA='SRX589543' SRR='SRR1377213' avgSpotLen=200 biosample='SAMN02850592' />
<@sample id=218 GSM='GSM1409707' condition='Female, right leg'  individ=65 SRA='SRX589544' SRR='SRR1377216' avgSpotLen=200 biosample='SAMN02850597' />
<@sample id=219 GSM='GSM1409708' condition='Female, left leg' 	individ=65 SRA='SRX589545' SRR='SRR1377219' avgSpotLen=200 biosample='SAMN02850596' />
<@sample id=220 GSM='GSM1409709' condition='Female, left leg' 	individ=65 SRA='SRX589546' SRR='SRR1377222' avgSpotLen=200 biosample='SAMN02850594' />

<#macro srr2 id, SRR>
UPDATE samples SET srr2=${SRR?str} WHERE samples.id=${id};
</#macro>

<@srr2 id=198 SRR='SRR1377146' />
<@srr2 id=199 SRR='SRR1377150' />
<@srr2 id=200 SRR='SRR8319154' />
<@srr2 id=201 SRR='SRR1377158' />
<@srr2 id=202 SRR='SRR1377162' />
<@srr2 id=203 SRR='SRR1377166' />
<@srr2 id=204 SRR='SRR1377170' />
<@srr2 id=205 SRR='SRR1377174' />
<@srr2 id=206 SRR='SRR1377178' />
<@srr2 id=207 SRR='SRR1377182' />
<@srr2 id=208 SRR='SRR1377186' />
<@srr2 id=209 SRR='SRR1377190' />
<@srr2 id=210 SRR='SRR1377193' />
<@srr2 id=211 SRR='SRR1377196' />
<@srr2 id=212 SRR='SRR1377199' />
<@srr2 id=213 SRR='SRR1377202' />
<@srr2 id=214 SRR='SRR1377205' />
<@srr2 id=215 SRR='SRR1377208' />
<@srr2 id=216 SRR='SRR1377211' />
<@srr2 id=217 SRR='SRR1377214' />
<@srr2 id=218 SRR='SRR1377217' />
<@srr2 id=219 SRR='SRR1377220' />
<@srr2 id=220 SRR='SRR1377223' />


<#macro srr3 id, SRR>
UPDATE samples SET srr3=${SRR?str} WHERE samples.id=${id};
</#macro>

<@srr3 id=198 SRR='SRR1377147' />
<@srr3 id=199 SRR='SRR1377151' />
<@srr3 id=200 SRR='SRR8319155' />
<@srr3 id=201 SRR='SRR1377159' />
<@srr3 id=202 SRR='SRR1377163' />
<@srr3 id=203 SRR='SRR1377167' />
<@srr3 id=204 SRR='SRR1377171' />
<@srr3 id=205 SRR='SRR1377175' />
<@srr3 id=206 SRR='SRR1377179' />
<@srr3 id=207 SRR='SRR1377183' />
<@srr3 id=208 SRR='SRR1377187' />
<@srr3 id=209 SRR='SRR1377191' />
<@srr3 id=210 SRR='SRR1377194' />
<@srr3 id=211 SRR='SRR1377197' />
<@srr3 id=212 SRR='SRR1377200' />
<@srr3 id=213 SRR='SRR1377203' />
<@srr3 id=214 SRR='SRR1377206' />
<@srr3 id=215 SRR='SRR1377209' />
<@srr3 id=216 SRR='SRR1377212' />
<@srr3 id=217 SRR='SRR1377215' />
<@srr3 id=218 SRR='SRR1377218' />
<@srr3 id=219 SRR='SRR1377221' />
<@srr3 id=220 SRR='SRR1377224' />


<#macro srr4 id, SRR>
UPDATE samples SET srr4=${SRR?str} WHERE samples.id=${id};
</#macro>

<@srr4 id=198 SRR='SRR1377148' />
<@srr4 id=199 SRR='SRR1377152' />
<@srr4 id=200 SRR='SRR8319156' />
<@srr4 id=201 SRR='SRR1377160' />
<@srr4 id=202 SRR='SRR1377164' />
<@srr4 id=203 SRR='SRR1377168' />
<@srr4 id=204 SRR='SRR1377172' />
<@srr4 id=205 SRR='SRR1377176' />
<@srr4 id=206 SRR='SRR1377180' />
<@srr4 id=207 SRR='SRR1377184' />
<@srr4 id=208 SRR='SRR1377188' />


-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
