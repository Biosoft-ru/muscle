<#include 'common'/>

delete from series where GSE='GSE58608';

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(4, 'GSE58608', 27657503, ${human}, ${rna_seq},
'The human skeletal muscle transcriptome assessed with RNA sequencing', 

${"The amount of RNA sequencing data on skeletal muscle is very limited. We have analyzed a large set of human muscle biopsy samples and provide extensive information on the baseline skeletal muscle transcriptome, including completely novel protein-coding transcripts."?str},

${"Analyze of transcriptome in 24 skeletal muscle biopsy samples, 12 individuals and one biopsy per leg per individual.

<br/><br/>Symbols in file names: 
<ul>
 none
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (16,17,18,19,20,21,22,23,24,25,26,27);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=15 code=14 sex='female' />
<@individ id=16 code=09 sex='male' />
<@individ id=17 code=10 sex='male' />
<@individ id=18 code=15 sex='female' />
<@individ id=19 code=16 sex='female' />
<@individ id=20 code=17 sex='female' />
<@individ id=21 code=11 sex='male' />
<@individ id=22 code=18 sex='female' />
<@individ id=23 code=12 sex='male' />
<@individ id=24 code=07 sex='male' />
<@individ id=25 code=08 sex='male' />
<@individ id=26 code=13 sex='female' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (21,22);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=21  title='Right leg' status=untrained time=  0 treatment='none' />
<@condition id=22  title='Left leg' status=untrained time=  0 treatment='none' />

-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (19);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 2, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=19 title='Untrained skeletal muscle, right leg vs left leg' condition1=21 condition2=22 comment='NULL' /> 
-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143);

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

<@sample id=120 GSM='GSM1415126' condition='Right leg, untrained' individ=15 platform=Illumina_HiSeq_2000 SRA='SRX610324' SRR='SRR1424731' avgSpotLen=200 biosample='SAMN02866158' />
<@sample id=121 GSM='GSM1415127' condition='Left leg, untrained' individ=15 platform=Illumina_HiSeq_2000 SRA='SRX610325' SRR='SRR1424732' avgSpotLen=200 biosample='SAMN02866151' />
<@sample id=122 GSM='GSM1415128' condition='Left leg, untrained' individ=16 platform=Illumina_HiSeq_2000 SRA='SRX610326' SRR='SRR6366364' avgSpotLen=200 biosample='SAMN02866152' />
<@sample id=123 GSM='GSM1415129' condition='Right leg, untrained' individ=16 platform=Illumina_HiSeq_2000 SRA='SRX610327' SRR='SRR1424734' avgSpotLen=200 biosample='SAMN02866159' />
<@sample id=124 GSM='GSM1415130' condition='Right leg, untrained' individ=17 platform=Illumina_HiSeq_2000 SRA='SRX610328' SRR='SRR1424735' avgSpotLen=200 biosample='SAMN02866150' />
<@sample id=125 GSM='GSM1415131' condition='Left leg, untrained' individ=17 platform=Illumina_HiSeq_2000 SRA='SRX610329' SRR='SRR1424736' avgSpotLen=200 biosample='SAMN02866149' />
<@sample id=126 GSM='GSM1415132' condition='Left leg, untrained' individ=18 platform=Illumina_HiSeq_2000 SRA='SRX610330' SRR='SRR1424737' avgSpotLen=200 biosample='SAMN02866157' />
<@sample id=127 GSM='GSM1415133' condition='Right leg, untrained' individ=18 platform=Illumina_HiSeq_2000 SRA='SRX610331' SRR='SRR1424738' avgSpotLen=200 biosample='SAMN02866148' />
<@sample id=128 GSM='GSM1415134' condition='Right leg, untrained' individ=19 platform=Illumina_HiSeq_2000 SRA='SRX610332' SRR='SRR1424739' avgSpotLen=200 biosample='SAMN02866154' />
<@sample id=129 GSM='GSM1415135' condition='Left leg, untrained' individ=19 platform=Illumina_HiSeq_2000 SRA='SRX610333' SRR='SRR1424740' avgSpotLen=200 biosample='SAMN02866156' />
<@sample id=130 GSM='GSM1415136' condition='Right leg, untrained' individ=20 platform=Illumina_HiSeq_2000 SRA='SRX610334' SRR='SRR1424741' avgSpotLen=200 biosample='SAMN02866153' />
<@sample id=131 GSM='GSM1415137' condition='Left leg, untrained' individ=20 platform=Illumina_HiSeq_2000 SRA='SRX610335' SRR='SRR1424742' avgSpotLen=200 biosample='SAMN02866155' />
<@sample id=132 GSM='GSM1415138' condition='Right leg, untrained' individ=21 platform=Illumina_HiSeq_2000 SRA='SRX610336' SRR='SRR1424743' avgSpotLen=200 biosample='SAMN02866162' />
<@sample id=133 GSM='GSM1415139' condition='Left leg, untrained' individ=21 platform=Illumina_HiSeq_2000 SRA='SRX610337' SRR='SRR1424744' avgSpotLen=200 biosample='SAMN02866160' />
<@sample id=134 GSM='GSM1415140' condition='Right leg, untrained' individ=22 platform=Illumina_HiSeq_2000 SRA='SRX610338' SRR='SRR1424745' avgSpotLen=200 biosample='SAMN02866161' />
<@sample id=135 GSM='GSM1415141' condition='Left leg, untrained' individ=22 platform=Illumina_HiSeq_2000 SRA='SRX610339' SRR='SRR1424746' avgSpotLen=200 biosample='SAMN02866163' />
<@sample id=136 GSM='GSM1415142' condition='Right leg, untrained' individ=23 platform=Illumina_HiSeq_2000 SRA='SRX610340' SRR='SRR1424747' avgSpotLen=200 biosample='SAMN02866166' />
<@sample id=137 GSM='GSM1415143' condition='Left leg, untrained' individ=23 platform=Illumina_HiSeq_2000 SRA='SRX610341' SRR='SRR1424748' avgSpotLen=200 biosample='SAMN02866165' />
<@sample id=138 GSM='GSM1415144' condition='Right leg, untrained' individ=24 platform=Illumina_HiSeq_2000 SRA='SRX610342' SRR='SRR1424749' avgSpotLen=200 biosample='SAMN02866164' />
<@sample id=139 GSM='GSM1415145' condition='Left leg, untrained' individ=24 platform=Illumina_HiSeq_2000 SRA='SRX610343' SRR='SRR1424750' avgSpotLen=200 biosample='SAMN02866168' />
<@sample id=140 GSM='GSM1415146' condition='Right leg, untrained' individ=25 platform=Illumina_HiSeq_2000 SRA='SRX610344' SRR='SRR1424751;SRR1424752' avgSpotLen=200 biosample='SAMN02866170' />
<@sample id=141 GSM='GSM1415147' condition='Left leg, untrained' individ=25 platform=Illumina_HiSeq_2000 SRA='SRX610345' SRR='SRR1424753' avgSpotLen=200 biosample='SAMN02866167' />
<@sample id=142 GSM='GSM1415148' condition='Right leg, untrained' individ=26 platform=Illumina_HiSeq_2000 SRA='SRX610346' SRR='SRR1424754' avgSpotLen=200 biosample='SAMN02866171' />
<@sample id=143 GSM='GSM1415149' condition='Left leg, untrained' individ=26 platform=Illumina_HiSeq_2000 SRA='SRX610347' SRR='SRR1424756;SRR1424755' avgSpotLen=200 biosample='SAMN02866169' />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
