<#include 'common'/>

delete from series where GSE='GSE86931';

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(2, 'GSE86931', 30449946, ${human}, ${rna_seq},
'Exercise-induced transcriptome changes in skeletal muscle adapted to aerobic training', 

${"We sequenced mRNA in vastus lateralis muscle samples from two amateur endurance-trained males (V’O2max 57 ml/min/kg) 
before and after acute endurance exercise."?str},

${"Examination of mRNA prior to, 4 h, and 8 h after acute intensive cycling session (70 min, 70% V’O2max ).

<br/><br/>Symbols in file names: 
<ul>
 <li>H0 – prior to exercise;</li> 
 <li>H2 – 4 h after exercise;</li> 
 <li>H3 – 8 h after exercise;</li> 
 <li>rep1 - replicate 1;</li>
 <li>rep2 - replicate 2.</li>
 </ul>
 "?str},
 
'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
  );
 
 

-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (8,9);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=8 code='rep1' sex='male' />
<@individ id=9 code='rep2' sex='male' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (13,14,15);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=13  title='H0' status=trained time=  0 treatment='NULL' />
<@condition id=14  title='H2' status=trained time= 240 treatment=3/> 
<@condition id=15  title='H3' status=trained time= 480 treatment=3/>
 
-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (10, 11, 12);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 2, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=10 title='Trained muscle after exercises, 4h' condition1=14 condition2=13 comment='NULL'?str /> 
<@comparison id=11 title='Trained muscle after exercises, 8h' condition1=15 condition2=13 comment='NULL' /> 
<@comparison id=12 title='Trained muscle after exercises, 4h and 8h' condition1=15 condition2=14 comment='NULL' /> 

-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (85, 86, 87, 88, 89, 90);
delete from samples where id IN (85, 86, 87, 88, 89, 90);

<#macro sample id, GSM, condition, individ, platform, SRA, SRR, avgSpotLen, biosample>

<#local title = condition + '_' + individ>

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, avgSpotLen, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${avgSpotLen}, ${id}, 2);

</#macro>

<@sample id=85 GSM='GSM2310424' condition='H0' individ=8 platform=Illumina_HiSeq_2000 SRA='SRX2163529' SRR='SRR4242588' avgSpotLen=45 biosample='SAMN05771871' />
<@sample id=86 GSM='GSM2310425' condition='H0' individ=9 platform=Illumina_HiSeq_2000 SRA='SRX2163530' SRR='SRR4242589' avgSpotLen=45 biosample='SAMN05771870' />
<@sample id=87 GSM='GSM2310426' condition='H2' individ=8 platform=Illumina_HiSeq_2000 SRA='SRX2163531' SRR='SRR4242590' avgSpotLen=45 biosample='SAMN05771869' />
<@sample id=88 GSM='GSM2310427' condition='H2' individ=9 platform=Illumina_HiSeq_2000 SRA='SRX2163532' SRR='SRR4242591' avgSpotLen=45 biosample='SAMN05771868' />
<@sample id=89 GSM='GSM2310428' condition='H3' individ=8 platform=Illumina_HiSeq_2000 SRA='SRX2163533' SRR='SRR4242592' avgSpotLen=45 biosample='SAMN05771867' />
<@sample id=90 GSM='GSM2310429' condition='H3' individ=9 platform=Illumina_HiSeq_2000 SRA='SRX2163534' SRR='SRR4242593' avgSpotLen=46 biosample='SAMN05771866' />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
