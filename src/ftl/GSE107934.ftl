<#include 'common'/>

delete from series where GSE='GSE107934';

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(3, 'GSE107934', 29543133, ${human}, ${rna_seq},
'Transcriptome response of human skeletal muscle to divergent exercise stimuli', 

${"While acute aerobic and resistance exercise stimulate a number of shared genes, each exercsie mode stimlutes a number of uniquely responsive genes, thus highlighting that different forms of exercise facilitate distinct molecular responses in skeletal muscle (vastus lateralis)."?str},

${"Randomized, counter-balanced, cross-over design (n=6) in which subjects performed an acute bout aerobic and resistance exercise separated by ~1 week..

<br/><br/>Symbols in file names: 
<ul>
 <li>AE – acute aerobic exercise;</li> 
 <li>RE – acute resistance exercise;</li> 
 <li>1h – 1 hour post exercise;</li> 
 <li>4h – 4 hours post exercise;</li> 
 <li>Baseline – prior to acute exercise;</li> 
 <li>_01, ..., _07 - person_01, ..., person_07;</li>
  </ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (10,11,12,13,14,15);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=10 code=01 sex='male' />
<@individ id=11 code=02 sex='male' />
<@individ id=12 code=03 sex='male' />
<@individ id=13 code=04 sex='male' />
<@individ id=14 code=05 sex='male' />
<@individ id=15 code=07 sex='male' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (16,17,18,19,20);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=16  title='Baseline' status=untrained time=  0 treatment='NULL' />
<@condition id=17  title='AE_1h' status=untrained time= 60 treatment=4/> 
<@condition id=18  title='AE_4h' status=untrained time= 240 treatment=4/>
<@condition id=19  title='RE_1h' status=untrained time= 60 treatment=5/>
<@condition id=20  title='RE_4h' status=untrained time= 240 treatment=5/>


-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (13, 14, 15, 16, 17, 18);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 2, ${condition1}, ${condition2}, ${comment?str} );
</#macro>

<@comparison id=13 title='Untrained muscle after acute aerobic exercises, 1h' condition1=17 condition2=16 comment='NULL'?str /> 
<@comparison id=14 title='Untrained muscle after acute aerobic exercises, 4h' condition1=18 condition2=16 comment='NULL' /> 
<@comparison id=15 title='Untrained muscle after acute resistance exercises, 1h' condition1=19 condition2=16 comment='NULL' /> 
<@comparison id=16 title='Untrained muscle after acute resistance exercises, 4h' condition1=20 condition2=16 comment='NULL' /> 
<@comparison id=17 title='Untrained muscle, acute resistance vs acute aerobic exercises, 1h' condition1=19 condition2=17 comment='NULL' /> 
<@comparison id=18 title='Untrained muscle, acute resistance vs acute aerobic exercises, 4h' condition1=20 condition2=18 comment='For person 04 AE_4h is absent' /> 
-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119);
delete from samples where id IN (91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119);

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

<@sample id=91 GSM='GSM2883519' condition='Baseline' individ=10 platform=Illumina_HiSeq_2500 SRA='SRX3461869' SRR='SRR6366362' avgSpotLen=150 biosample='SAMN08160736' />
<@sample id=92 GSM='GSM2883520' condition='AE_1h' individ=10 platform=Illumina_HiSeq_2500 SRA='SRX3461870' SRR='SRR6366363' avgSpotLen=150 biosample='SAMN08160735' />
<@sample id=93 GSM='GSM2883521' condition='AE_4h' individ=10 platform=Illumina_HiSeq_2500 SRA='SRX3461871' SRR='SRR6366364' avgSpotLen=150 biosample='SAMN08160734' />
<@sample id=94 GSM='GSM2883522' condition='RE_1h' individ=10 platform=Illumina_HiSeq_2500 SRA='SRX3461872' SRR='SRR6366365' avgSpotLen=150 biosample='SAMN08160733' />
<@sample id=95 GSM='GSM2883523' condition='RE_4h' individ=10 platform=Illumina_HiSeq_2500 SRA='SRX3461873' SRR='SRR6366366' avgSpotLen=150 biosample='SAMN08160732' />
<@sample id=96 GSM='GSM2883524' condition='Baseline' individ=11 platform=Illumina_HiSeq_2500 SRA='SRX3461874' SRR='SRR6366367' avgSpotLen=150 biosample='SAMN08160731' />
<@sample id=97 GSM='GSM2883525' condition='AE_1h' individ=11 platform=Illumina_HiSeq_2500 SRA='SRX3461875' SRR='SRR6366368' avgSpotLen=150 biosample='SAMN08160730' />
<@sample id=98 GSM='GSM2883526' condition='AE_4h' individ=11 platform=Illumina_HiSeq_2500 SRA='SRX3461876' SRR='SRR6366369' avgSpotLen=150 biosample='SAMN08160729' />
<@sample id=99 GSM='GSM2883527' condition='RE_1h' individ=11 platform=Illumina_HiSeq_2500 SRA='SRX3461877' SRR='SRR6366370' avgSpotLen=150 biosample='SAMN08160737' />
<@sample id=100 GSM='GSM2883528' condition='RE_4h' individ=11 platform=Illumina_HiSeq_2500 SRA='SRX3461878' SRR='SRR6366371' avgSpotLen=150 biosample='SAMN08160740' />
<@sample id=101 GSM='GSM2883529' condition='Baseline' individ=12 platform=Illumina_HiSeq_2500 SRA='SRX3461879' SRR='SRR6366372' avgSpotLen=150 biosample='SAMN08160739' />
<@sample id=102 GSM='GSM2883530' condition='AE_1h' individ=12 platform=Illumina_HiSeq_2500 SRA='SRX3461880' SRR='SRR6366373' avgSpotLen=150 biosample='SAMN08160738' />
<@sample id=103 GSM='GSM2883531' condition='AE_4h' individ=12 platform=Illumina_HiSeq_2500 SRA='SRX3461881' SRR='SRR6366374' avgSpotLen=150 biosample='SAMN08160741' />
<@sample id=104 GSM='GSM2883532' condition='RE_1h' individ=12 platform=Illumina_HiSeq_2500 SRA='SRX3461882' SRR='SRR6366375' avgSpotLen=150 biosample='SAMN08160742' />
<@sample id=105 GSM='GSM2883533' condition='RE_4h' individ=12 platform=Illumina_HiSeq_2500 SRA='SRX3461883' SRR='SRR6366376' avgSpotLen=150 biosample='SAMN08160728' />
<@sample id=106 GSM='GSM2883534' condition='Baseline' individ=13 platform=Illumina_HiSeq_2500 SRA='SRX3461884' SRR='SRR6366377' avgSpotLen=150 biosample='SAMN08160751' />
<@sample id=107 GSM='GSM2883535' condition='AE_1h' individ=13 platform=Illumina_HiSeq_2500 SRA='SRX3461885' SRR='SRR6366378' avgSpotLen=150 biosample='SAMN08160750' />
<@sample id=108 GSM='GSM2883536' condition='RE_1h' individ=13 platform=Illumina_HiSeq_2500 SRA='SRX3461886' SRR='SRR6366379' avgSpotLen=150 biosample='SAMN08160749' />
<@sample id=109 GSM='GSM2883537' condition='RE_4h' individ=13 platform=Illumina_HiSeq_2500 SRA='SRX3461887' SRR='SRR6366380' avgSpotLen=150 biosample='SAMN08160752' />
<@sample id=110 GSM='GSM2883538' condition='Baseline' individ=14 platform=Illumina_HiSeq_2500 SRA='SRX3461888' SRR='SRR6366381' avgSpotLen=150 biosample='SAMN08160726' />
<@sample id=111 GSM='GSM2883539' condition='AE_1h' individ=14 platform=Illumina_HiSeq_2500 SRA='SRX3461889' SRR='SRR6366382' avgSpotLen=150 biosample='SAMN08160754' />
<@sample id=112 GSM='GSM2883540' condition='AE_4h' individ=14 platform=Illumina_HiSeq_2500 SRA='SRX3461890' SRR='SRR6366383' avgSpotLen=150 biosample='SAMN08160753' />
<@sample id=113 GSM='GSM2883541' condition='RE_1h' individ=14 platform=Illumina_HiSeq_2500 SRA='SRX3461891' SRR='SRR6366384' avgSpotLen=150 biosample='SAMN08160727' />
<@sample id=114 GSM='GSM2883542' condition='RE_4h' individ=14 platform=Illumina_HiSeq_2500 SRA='SRX3461892' SRR='SRR6366385' avgSpotLen=150 biosample='SAMN08160743' />
<@sample id=115 GSM='GSM2883543' condition='Baseline' individ=15 platform=Illumina_HiSeq_2500 SRA='SRX3461893' SRR='SRR6366386' avgSpotLen=150 biosample='SAMN08160746' />
<@sample id=116 GSM='GSM2883544' condition='AE_1h' individ=15 platform=Illumina_HiSeq_2500 SRA='SRX3461894' SRR='SRR6366387' avgSpotLen=150 biosample='SAMN08160745' />
<@sample id=117 GSM='GSM2883545' condition='AE_4h' individ=15 platform=Illumina_HiSeq_2500 SRA='SRX3461895' SRR='SRR6366388' avgSpotLen=150 biosample='SAMN08160744' />
<@sample id=118 GSM='GSM2883546' condition='RE_1h' individ=15 platform=Illumina_HiSeq_2500 SRA='SRX3461896' SRR='SRR6366389' avgSpotLen=150 biosample='SAMN08160748' />
<@sample id=119 GSM='GSM2883547' condition='RE_4h' individ=15 platform=Illumina_HiSeq_2500 SRA='SRX3461897' SRR='SRR6366390' avgSpotLen=150 biosample='SAMN08160747' />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
