<#include 'common'/>

delete from series where GSE='GSE60591';

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(4, 'GSE60591', 27657503, ${human}, ${rna_seq},
'Dynamics of the human skeletal muscle transcriptome in response to exercise training', 

${"A total of 23 participants (data available in GSE60590 and in GSE58608) completed three months of supervised aerobic exercise training of one leg. Skeletal muscle biopsies have been collected before and after the training period. We have investigated differences between trained and untrained leg and before and after training by studying the gene and isoform expression."?str},

${"Analysis of transcriptome in skeletal muscle biopsy samples in response to exercise training in 22 participants (of the total 23 participants). One biopsy is collected from each leg before and after training period. Analyze of transcriptome in 24 skeletal muscle biopsy samples, 12 individuals and one biopsy per leg per individual.

<br/><br/>Symbols in file names: 
<ul>
 none
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=16 code=1 sex='male' />
<@individ id=17 code=2 sex='male' />
<@individ id=18 code=3 sex='male' />
<@individ id=19 code=4 sex='male' />
<@individ id=20 code=5 sex='male' />
<@individ id=21 code=7 sex='male' />
<@individ id=22 code=9 sex='female' />
<@individ id=23 code=11 sex='female' />
<@individ id=24 code=12 sex='male' />
<@individ id=25 code=13 sex='male' />
<@individ id=26 code=14 sex='male' />
<@individ id=27 code=15 sex='female' />
<@individ id=28 code=16 sex='female' />
<@individ id=29 code=18 sex='female' />
<@individ id=30 code=19 sex='male' />
<@individ id=31 code=20 sex='female' />
<@individ id=32 code=21 sex='male' />
<@individ id=33 code=22 sex='female' />
<@individ id=34 code=23 sex='female' />
<@individ id=35 code=24 sex='female' />
<@individ id=36 code=26 sex='male' />
<@individ id=37 code=27 sex='female' />
<@individ id=38 code=28 sex='female' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (21,22,23,24,25,26,27,28);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=21  title='Male, right leg' status=untrained time=  0 treatment='none' />
<@condition id=22  title='Male, left leg' status=untrained time=  0 treatment='none' />
<@condition id=23  title='Male, right leg' status=untrained time=  0 treatment=6 />
<@condition id=24  title='Male, left leg' status=untrained time=  0 treatment=6 />
<@condition id=25  title='Female, right leg' status=untrained time=  0 treatment='none' />
<@condition id=26  title='Female, left leg' status=untrained time=  0 treatment='none' />
<@condition id=27  title='Female, right leg' status=untrained time=  0 treatment=6 />
<@condition id=28  title='Female, left leg' status=untrained time=  0 treatment=6 />


-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (19,20,21);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 4, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=19 title='Non-treated male skeletal muscle, right leg vs left leg' condition1=21 condition2=22 comment='NULL' /> 
<@comparison id=20 title='Male skeletal muscle, right leg, treated vs non-treated' condition1=23 condition2=21 comment='NULL' /> 
<@comparison id=21 title='Male skeletal muscle, left leg, treated vs non-treated' condition1=24 condition2=22 comment='NULL' /> 
<@comparison id=22 title='Non-treated female skeletal muscle, right leg vs left leg' condition1=25 condition2=26 comment='NULL' /> 
<@comparison id=23 title='Female skeletal muscle, right leg, treated vs non-treated' condition1=27 condition2=25 comment='NULL' /> 
<@comparison id=24 title='Female skeletal muscle, left leg, treated vs non-treated' condition1=28 condition2=26 comment='NULL' /> 

-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176);
delete from samples where id IN (120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176);

<#macro sample id, GSM, condition, individ, platform, SRA, SRR, avgSpotLen, biosample>

<#local title = condition + '_' + individ>

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, avgSpotLen, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${avgSpotLen}, ${id}, 4);

</#macro>

<@sample id=120 GSM='GSM1482940' condition='Male, right leg, non-treated' individ=16 platform=Illumina_HiSeq_2000 SRA='SRX684338' SRR='SRR1555190' avgSpotLen=200 biosample='SAMN03000666' />
<@sample id=121 GSM='GSM1482941' condition='Male, right leg, treated' individ=16 platform=Illumina_HiSeq_2000 SRA='SRX684339' SRR='SRR1555191' avgSpotLen=200 biosample='SAMN03000667' />
<@sample id=122 GSM='GSM1482956' condition='Male, left leg, non-treated' individ=17 platform=Illumina_HiSeq_2000 SRA='SRX684354' SRR='SRR1555208 ' avgSpotLen=200 biosample='SAMN03000683' />
<@sample id=123 GSM='GSM1482957' condition='Male, left leg, treated' individ=17 platform=Illumina_HiSeq_2000 SRA='SRX684355' SRR='SRR1555209;SRR1555210' avgSpotLen=200 biosample='SAMN03000684' />
<@sample id=124 GSM='GSM1482958' condition='Male, right leg, non-treated' individ=18 platform=Illumina_HiSeq_2000 SRA='SRX684356' SRR='SRR1555211' avgSpotLen=200 biosample='SAMN03000685' />
<@sample id=125 GSM='GSM1482959' condition='Male, right leg, treated' individ=18 platform=Illumina_HiSeq_2000 SRA='SRX684357' SRR='SRR1555212' avgSpotLen=200 biosample='SAMN03000686' />
<@sample id=126 GSM='GSM1415144' condition='Male, right leg, non-treated' individ=19 platform=Illumina_HiSeq_2000 SRA='SRX610342' SRR='SRR1424749' avgSpotLen=200 biosample='SAMN02866164' />
<@sample id=127 GSM='GSM1482960' condition='Male, right leg, treated' individ=19 platform=Illumina_HiSeq_2000 SRA='SRX684358' SRR='SRR1555213' avgSpotLen=200 biosample='SAMN03000687' />
<@sample id=128 GSM='GSM1415145' condition='Male, left leg, non-treated' individ=19 platform=Illumina_HiSeq_2000 SRA='SRX610343' SRR='SRR1424750' avgSpotLen=200 biosample='SAMN02866168' />
<@sample id=129 GSM='GSM1482961' condition='Male, right leg, non-treated' individ=20 platform=Illumina_HiSeq_2000 SRA='SRX684359' SRR='SRR1555214;SRR1555215' avgSpotLen=200 biosample='SAMN03000655' />
<@sample id=130 GSM='GSM1482962' condition='Male, right leg, treated' individ=20 platform=Illumina_HiSeq_2000 SRA='SRX684360' SRR='SRR1555216' avgSpotLen=200 biosample='SAMN03000682' />
<@sample id=131 GSM='GSM1415146' condition='Male, right leg, non-treated' individ=21 platform=Illumina_HiSeq_2000 SRA='SRX610344' SRR='SRR1424751;SRR1424752' avgSpotLen=200 biosample='SAMN02866170' />
<@sample id=132 GSM='GSM1482963' condition='Male, left leg, treated' individ=21 platform=Illumina_HiSeq_2000 SRA='SRX684361' SRR='SRR1555217' avgSpotLen=200 biosample='SAMN03000656' />
<@sample id=133 GSM='GSM1415147' condition='Male, left leg, non-treated' individ=21 platform=Illumina_HiSeq_2000 SRA='SRX610345' SRR='SRR1424753' avgSpotLen=200 biosample='SAMN02866167' />
<@sample id=134 GSM='GSM1415148' condition='Female, right leg, non-treated' individ=22 platform=Illumina_HiSeq_2000 SRA='SRX610346' SRR='SRR1424754' avgSpotLen=200 biosample='SAMN02866171' />
<@sample id=135 GSM='GSM1482964' condition='Female, right leg, treated' individ=22 platform=Illumina_HiSeq_2000 SRA='SRX684362' SRR='SRR1555218' avgSpotLen=200 biosample='SAMN03000657' />
<@sample id=136 GSM='GSM1415149' condition='Female, left leg, non-treated' individ=22 platform=Illumina_HiSeq_2000 SRA='SRX610347' SRR='SRR1424756;SRR1424755' avgSpotLen=200 biosample='SAMN02866169' />
<@sample id=137 GSM='GSM1415126' condition='Female, right leg, non-treated' individ=23 platform=Illumina_HiSeq_2000 SRA='SRX610324' SRR='SRR1424731' avgSpotLen=200 biosample='SAMN02866158' />
<@sample id=138 GSM='GSM1482932' condition='Female, left leg, treated' individ=23 platform=Illumina_HiSeq_2000 SRA='SRX684330' SRR='SRR1555179;SRR1555180' avgSpotLen=200 biosample='SAMN03000658' />
<@sample id=139 GSM='GSM1415127' condition='Female, left leg, non-treated' individ=23 platform=Illumina_HiSeq_2000 SRA='SRX610325' SRR='SRR1424732' avgSpotLen=200 biosample='SAMN02866151' />
<@sample id=140 GSM='GSM1415128' condition='Male, left leg, non-treated' individ=24 platform=Illumina_HiSeq_2000 SRA='SRX610326' SRR='SRR6366364' avgSpotLen=200 biosample='SAMN02866152' />
<@sample id=141 GSM='GSM1482933' condition='Male, left leg, treated' individ=24 platform=Illumina_HiSeq_2000 SRA='SRX684331' SRR='SRR1555181' avgSpotLen=200 biosample='SAMN03000659' />
<@sample id=142 GSM='GSM1415129' condition='Male, right leg, non-treated' individ=24 platform=Illumina_HiSeq_2000 SRA='SRX610327' SRR='SRR1424734' avgSpotLen=200 biosample='SAMN02866159' />
<@sample id=143 GSM='GSM1415130' condition='Male, right leg, non-treated' individ=25 platform=Illumina_HiSeq_2000 SRA='SRX610328' SRR='SRR1424735' avgSpotLen=200 biosample='SAMN02866150' />
<@sample id=144 GSM='GSM1415131' condition='Male, left leg, non-treated' individ=25 platform=Illumina_HiSeq_2000 SRA='SRX610329' SRR='SRR1424736' avgSpotLen=200 biosample='SAMN02866149' />
<@sample id=145 GSM='GSM1482934' condition='Male, left leg, non-treated' individ=26 platform=Illumina_HiSeq_2000 SRA='SRX684332' SRR='SRR1555182' avgSpotLen=200 biosample='SAMN03000660' />
<@sample id=146 GSM='GSM1482935' condition='Male, left leg, treated' individ=26 platform=Illumina_HiSeq_2000 SRA='SRX684333' SRR='SRR1555183' avgSpotLen=200 biosample='SAMN03000661' />
<@sample id=147 GSM='GSM1415132' condition='Female, left leg, non-treated' individ=27 platform=Illumina_HiSeq_2000 SRA='SRX610330' SRR='SRR1424737' avgSpotLen=200 biosample='SAMN02866157' />
<@sample id=148 GSM='GSM1482936' condition='Female, left leg, treated' individ=27 platform=Illumina_HiSeq_2000 SRA='SRX684334' SRR='SRR1555184' avgSpotLen=200 biosample='SAMN03000662' />
<@sample id=149 GSM='GSM1415133' condition='Female, right leg, non-treated' individ=27 platform=Illumina_HiSeq_2000 SRA='SRX610331' SRR='SRR1424738' avgSpotLen=200 biosample='SAMN02866148' />
<@sample id=150 GSM='GSM1415134' condition='Female, right leg, non-treated' individ=28 platform=Illumina_HiSeq_2000 SRA='SRX610332' SRR='SRR1424739' avgSpotLen=200 biosample='SAMN02866154' />
<@sample id=151 GSM='GSM1482937' condition='Female, right leg, treated' individ=28 platform=Illumina_HiSeq_2000 SRA='SRX684335' SRR='SRR1555185;SRR1555186' avgSpotLen=200 biosample='SAMN03000663' />
<@sample id=152 GSM='GSM1415135' condition='Female, left leg, non-treated' individ=28 platform=Illumina_HiSeq_2000 SRA='SRX610333' SRR='SRR1424740' avgSpotLen=200 biosample='SAMN02866156' />
<@sample id=153 GSM='GSM1415136' condition='Female, right leg, non-treated' individ=29 platform=Illumina_HiSeq_2000 SRA='SRX610334' SRR='SRR1424741' avgSpotLen=200 biosample='SAMN02866153' />
<@sample id=154 GSM='GSM1482938' condition='Female, right leg, treated' individ=29 platform=Illumina_HiSeq_2000 SRA='SRX684336' SRR='SRR1555187' avgSpotLen=200 biosample='SAMN03000664' />
<@sample id=155 GSM='GSM1415137' condition='Female, left leg, non-treated' individ=29 platform=Illumina_HiSeq_2000 SRA='SRX610335' SRR='SRR1424742' avgSpotLen=200 biosample='SAMN02866155' />
<@sample id=156 GSM='GSM1415138' condition='Male, right leg, non-treated' individ=30 platform=Illumina_HiSeq_2000 SRA='SRX610336' SRR='SRR1424743' avgSpotLen=200 biosample='SAMN02866162' />
<@sample id=157 GSM='GSM1482939' condition='Male, right leg, treated' individ=30 platform=Illumina_HiSeq_2000 SRA='SRX684337' SRR='SRR1555188;SRR1555189' avgSpotLen=200 biosample='SAMN03000665' />
<@sample id=158 GSM='GSM1415139' condition='Male, left leg, non-treated' individ=30 platform=Illumina_HiSeq_2000 SRA='SRX610337' SRR='SRR1424744' avgSpotLen=200 biosample='SAMN02866160' />
<@sample id=159 GSM='GSM1415140' condition='Female, right leg, non-treated' individ=31 platform=Illumina_HiSeq_2000 SRA='SRX610338' SRR='SRR1424745' avgSpotLen=200 biosample='SAMN02866161' />
<@sample id=160 GSM='GSM1482942' condition='Female, right leg, treated' individ=31 platform=Illumina_HiSeq_2000 SRA='SRX684340' SRR='SRR1555192' avgSpotLen=200 biosample='SAMN03000668' />
<@sample id=161 GSM='GSM1415141' condition='Female, left leg, non-treated' individ=31 platform=Illumina_HiSeq_2000 SRA='SRX610339' SRR='SRR1424746' avgSpotLen=200 biosample='SAMN02866163' />
<@sample id=162 GSM='GSM1415142' condition='Male, right leg, non-treated' individ=32 platform=Illumina_HiSeq_2000 SRA='SRX610340' SRR='SRR1424747' avgSpotLen=200 biosample='SAMN02866166' />
<@sample id=163 GSM='GSM1482943' condition='Male, right leg, treated' individ=32 platform=Illumina_HiSeq_2000 SRA='SRX684341' SRR='SRR1555193' avgSpotLen=200 biosample='SAMN03000669' />
<@sample id=164 GSM='GSM1415143' condition='Male, left leg, non-treated' individ=32 platform=Illumina_HiSeq_2000 SRA='SRX610341' SRR='SRR1424748' avgSpotLen=200 biosample='SAMN02866165' />
<@sample id=165 GSM='GSM1482944' condition='Female, right leg, non-treated' individ=33 platform=Illumina_HiSeq_2000 SRA='SRX684342' SRR='SRR1555194;SRR1555195' avgSpotLen=200 biosample='SAMN03000670' />
<@sample id=166 GSM='GSM1482945' condition='Female, right leg, treated' individ=33 platform=Illumina_HiSeq_2000 SRA='SRX684343' SRR='SRR1555196' avgSpotLen=200 biosample='SAMN03000671' />
<@sample id=167 GSM='GSM1482946' condition='Female, left leg, non-treated' individ=34 platform=Illumina_HiSeq_2000 SRA='SRX684344' SRR='SRR1555197' avgSpotLen=200 biosample='SAMN03000672' />
<@sample id=168 GSM='GSM1482947' condition='Female, left leg, treated' individ=34 platform=Illumina_HiSeq_2000 SRA='SRX684345' SRR='SRR1555198' avgSpotLen=200 biosample='SAMN03000673' />
<@sample id=169 GSM='GSM1482948' condition='Female, left leg, non-treated' individ=35 platform=Illumina_HiSeq_2000 SRA='SRX684346' SRR='SRR1555199' avgSpotLen=200 biosample='SAMN03000674' />
<@sample id=170 GSM='GSM1482949' condition='Female, right leg, treated' individ=35 platform=Illumina_HiSeq_2000 SRA='SRX684347' SRR='SRR1555200' avgSpotLen=200 biosample='SAMN03000675' />
<@sample id=171 GSM='GSM1482950' condition='Male, right leg, non-treated' individ=36 platform=Illumina_HiSeq_2000 SRA='SRX684348' SRR='SRR1555201;SRR1555202' avgSpotLen=200 biosample='SAMN03000676' />
<@sample id=172 GSM='GSM1482951' condition='Male, right leg, treated' individ=36 platform=Illumina_HiSeq_2000 SRA='SRX684349' SRR='SRR1555203' avgSpotLen=200 biosample='SAMN03000677' />
<@sample id=173 GSM='GSM1482952' condition='Female, left leg, non-treated' individ=37 platform=Illumina_HiSeq_2000 SRA='SRX684350' SRR='SRR1555204' avgSpotLen=200 biosample='SAMN03000678' />
<@sample id=174 GSM='GSM1482953' condition='Female, left leg, treated' individ=37 platform=Illumina_HiSeq_2000 SRA='SRX684351' SRR='SRR1555205' avgSpotLen=200 biosample='SAMN03000679' />
<@sample id=175 GSM='GSM1482954' condition='Female, right leg, non-treated' individ=38 platform=Illumina_HiSeq_2000 SRA='SRX684352' SRR='SRR1555206' avgSpotLen=200 biosample='SAMN03000680' />
<@sample id=176 GSM='GSM1482955' condition='Female, right leg, treated' individ=38 platform=Illumina_HiSeq_2000 SRA='SRX684353' SRR='SRR1555207' avgSpotLen=200 biosample='SAMN03000681' />


-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
