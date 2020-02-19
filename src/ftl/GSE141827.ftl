<#include 'common'/>

delete from series where GSE='GSE141827';

<#assign SERIES_ID=9>

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(${SERIES_ID}, 'GSE141827', NULL, ${rat}, ${rna_seq},
'Rat hindlimb unloading leads to different expression changes in fast and slow muscles', 

${"Here we report genome wide estimation of expression profiles at promoter level in Soleus and EDL muscles in rat hindlimbs under unloading conditions."?str},

${"Samples were collected from rat hindlimbs at normal state, after unloading for 24 hours, 3 days, 7 days; recovery after 7 days unloading for 24 hours, 3 days, 7 days. Extracted total RNA were proceeded into cDNA and submitted to nAnTi-CAGE libraries preparation with subsequent sequencing on Illumina HiSeq2500 (SE, 50bp).

<br/><br/>Symbols in file names: 
<ul>
 Sol - soleus muscle,
 EDL - extensor digitorum longus muscle. 
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=76 code=U1_EDL  sex='NULL' />
<@individ id=76 code=U1_Sol  sex='NULL' />
<@individ id=77 code=U2_EDL  sex='NULL' />
<@individ id=77 code=U2_Sol  sex='NULL' />
<@individ id=78 code=U3_EDL  sex='NULL' />
<@individ id=78 code=U3_Sol  sex='NULL' />
<@individ id=79 code=U4_EDL  sex='NULL' />
<@individ id=79 code=U4_Sol  sex='NULL' />
<@individ id=80 code=U5_EDL  sex='NULL' />
<@individ id=80 code=U5_Sol  sex='NULL' />
<@individ id=81 code=U6_EDL  sex='NULL' />
<@individ id=81 code=U6_Sol  sex='NULL' />
<@individ id=82 code=U7_EDL  sex='NULL' />
<@individ id=82 code=U7_Sol  sex='NULL' />
<@individ id=83 code=U8_EDL  sex='NULL' />
<@individ id=83 code=U8_Sol  sex='NULL' />
<@individ id=84 code=U9_EDL  sex='NULL' />
<@individ id=84 code=U9_Sol  sex='NULL' />
<@individ id=85 code=U10_EDL sex='NULL' />
<@individ id=85 code=U10_Sol sex='NULL' />
<@individ id=86 code=U11_EDL sex='NULL' />
<@individ id=86 code=U11_Sol sex='NULL' />
<@individ id=87 code=U12_EDL sex='NULL' />
<@individ id=87 code=U12_Sol sex='NULL' />
<@individ id=88 code=U13_EDL sex='NULL' />
<@individ id=88 code=U13_Sol sex='NULL' />
<@individ id=89 code=U16_EDL sex='NULL' />
<@individ id=89 code=U16_Sol sex='NULL' />
<@individ id=90 code=U18_EDL sex='NULL' />
<@individ id=90 code=U18_Sol sex='NULL' />
<@individ id=91 code=U19_EDL sex='NULL' />
<@individ id=91 code=U19_Sol sex='NULL' />
<@individ id=92 code=U20_EDL sex='NULL' />
<@individ id=92 code=U20_Sol sex='NULL' />
<@individ id=93 code=U21_EDL sex='NULL' />
<@individ id=93 code=U21_Sol sex='NULL' />
<@individ id=94 code=U24_EDL sex='NULL' />
<@individ id=94 code=U24_Sol sex='NULL' />
<@individ id=95 code=U25_EDL sex='NULL' />
<@individ id=95 code=U25_Sol sex='NULL' />
<@individ id=96 code=U26_EDL sex='NULL' />
<@individ id=96 code=U26_Sol sex='NULL' />



--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (34,35);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=36 title=‘EDL, control'                       status=untrained time=0     treatment='NULL' />
<@condition id=37 title=‘EDL, unloading 24h'                 status=untrained time=0     treatment=unloading_24h />
<@condition id=38 title=‘EDL, unloading 3d'                  status=untrained time=0     treatment=unloading_3days />
<@condition id=39 title=‘EDL, unloading 7d, recovery 24h'    status=untrained time=1440  treatment=unloading_7days_recovery_24h />
<@condition id=40 title=‘EDL, unloading 7d, recovery 3d'     status=untrained time=4320  treatment=unloading_7days_recovery_3days />
<@condition id=41 title=‘EDL, unloading 7d, recovery 7d'     status=untrained time=10080 treatment=unloading_7days_recovery_7days />
<@condition id=42 title=‘Soleus, control'                    status=untrained time=0     treatment='NULL' />
<@condition id=43 title=‘Soleus, unloading 24h'              status=untrained time=0     treatment=unloading_24h />
<@condition id=44 title=‘Soleus, unloading 3d'               status=untrained time=0     treatment=unloading_3days />
<@condition id=45 title=‘Soleus, unloading 7d, recovery 24h' status=untrained time=1440  treatment=unloading_7days_recovery_24h />
<@condition id=46 title=‘Soleus, unloading 7d, recovery 3d'  status=untrained time=4320  treatment=unloading_7days_recovery_3days />
<@condition id=47 title=‘Soleus, unloading 7d, recovery 7d'  status=untrained time=10080 treatment=unloading_7days_recovery_7days />

-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (29);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, 2, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=30 title='EDL, unloading 24h vs non-treated'                 condition1=37 condition2=36 comment='NULL' /> 
<@comparison id=31 title='EDL, unloading 3d vs non-treated'                  condition1=38 condition2=36 comment='NULL' /> 
<@comparison id=32 title='EDL, unloading 7d, recovery 24h vs non-treated'    condition1=39 condition2=36 comment='NULL' /> 
<@comparison id=33 title='EDL, unloading 7d, recovery 3d vs non-treated'     condition1=40 condition2=36 comment='NULL' />
<@comparison id=34 title='EDL, unloading 7d, recovery 7d vs non-treated'     condition1=41 condition2=36 comment='NULL' />
<@comparison id=35 title='Soleus, unloading 24h vs non-treated'              condition1=43 condition2=42 comment='NULL' /> 
<@comparison id=36 title='Soleus, unloading 3d vs non-treated'               condition1=44 condition2=42 comment='NULL' /> 
<@comparison id=37 title='Soleus, unloading 7d, recovery 24h vs non-treated' condition1=45 condition2=42 comment='NULL' /> 
<@comparison id=38 title='Soleus, unloading 7d, recovery 3d vs non-treated'  condition1=46 condition2=42 comment='NULL' />
<@comparison id=39 title='Soleus, unloading 7d, recovery 7d vs non-treated'  condition1=47 condition2=42 comment='NULL' />
<@comparison id=40 title='Non-treated, Soleus vs EDL'                        condition1=42 condition2=36 comment='NULL' /> 
<@comparison id=41 title='Unloading 24h, Soleus vs EDL'                      condition1=43 condition2=37 comment='NULL' /> 
<@comparison id=42 title='Unloading 3d, Soleus vs EDL'                       condition1=44 condition2=38 comment='NULL' /> 
<@comparison id=43 title='Unloading 7d, recovery 24h, Soleus vs EDL'         condition1=45 condition2=39 comment='NULL' />
<@comparison id=44 title='Unloading 7d, recovery 3d, Soleus vs EDL'          condition1=46 condition2=40 comment='NULL' />
<@comparison id=44 title='Unloading 7d, recovery 7d, Soleus vs EDL'          condition1=47 condition2=41 comment='NULL' />

-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282);
delete from samples where id IN (241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282);

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

<@sample id=241 GSM=‘GSM4213782' condition=‘Soleus, unloading 24h'              individ=94 SRA='SRX7347481' SRR=' ' avgSpotLen= biosample='SAMN13540806' />
<@sample id=242 GSM=‘GSM4213783' condition=‘EDL, control'                       individ=81 SRA='SRX7347482' SRR=' ' avgSpotLen= biosample='SAMN13540805' />
<@sample id=243 GSM=‘GSM4213784' condition=‘Soleus, control'                    individ=81 SRA='SRX7347483' SRR=' ' avgSpotLen= biosample='SAMN13540804' />
<@sample id=244 GSM=‘GSM4213785' condition=‘EDL, control'                       individ=82 SRA='SRX7347484' SRR=' ' avgSpotLen= biosample='SAMN13540803' />
<@sample id=245 GSM=‘GSM4213786' condition=‘Soleus, control'                    individ=82 SRA='SRX7347485' SRR=' ' avgSpotLen= biosample='SAMN13540802' />
<@sample id=246 GSM=‘GSM4213787' condition=‘EDL, control'                       individ=83 SRA='SRX7347486' SRR=' ' avgSpotLen= biosample='SAMN13540801' />
<@sample id=247 GSM=‘GSM4213788' condition=‘Soleus, control'                    individ=83 SRA='SRX7347487' SRR=' ' avgSpotLen= biosample='SAMN13540800' />
<@sample id=248 GSM=‘GSM4213789' condition=‘Soleus, unloading 3d'               individ=85 SRA='SRX7347488' SRR=' ' avgSpotLen= biosample='SAMN13540799' />
<@sample id=249 GSM=‘GSM4213790' condition=‘EDL, unloading 24h'                 individ=95 SRA='SRX7347489' SRR=' ' avgSpotLen= biosample='SAMN13540828' />
<@sample id=250 GSM=‘GSM4213791' condition=‘Soleus, unloading 24h'              individ=95 SRA='SRX7347490' SRR=' ' avgSpotLen= biosample='SAMN13540827' />
<@sample id=251 GSM=‘GSM4213792' condition=‘EDL, unloading 24h'                 individ=96 SRA='SRX7347491' SRR=' ' avgSpotLen= biosample='SAMN13540826' />
<@sample id=252 GSM=‘GSM4213793' condition=‘Soleus, unloading 24h'              individ=96 SRA='SRX7347492' SRR=' ' avgSpotLen= biosample='SAMN13540825' />
<@sample id=253 GSM=‘GSM4213794' condition=‘EDL, unloading 3d'                  individ=84 SRA='SRX7347493' SRR=' ' avgSpotLen= biosample='SAMN13540824' />
<@sample id=254 GSM=‘GSM4213795' condition=‘Soleus, unloading 3d'               individ=84 SRA='SRX7347494' SRR=' ' avgSpotLen= biosample='SAMN13540823' />
<@sample id=255 GSM=‘GSM4213796' condition=‘EDL, unloading 3d'                  individ=86 SRA='SRX7347495' SRR=' ' avgSpotLen= biosample='SAMN13540822' />
<@sample id=256 GSM=‘GSM4213797' condition=‘Soleus, unloading 3d'               individ=86 SRA='SRX7347496' SRR=' ' avgSpotLen= biosample='SAMN13540821' />
<@sample id=257 GSM=‘GSM4213798' condition=‘EDL, unloading 3d'                  individ=76 SRA='SRX7347497' SRR=' ' avgSpotLen= biosample='SAMN13540820' />
<@sample id=258 GSM=‘GSM4213799' condition=‘Soleus, unloading 3d'               individ=76 SRA='SRX7347498' SRR=' ' avgSpotLen= biosample='SAMN13540819' />
<@sample id=259 GSM=‘GSM4213800' condition=‘EDL, unloading 3d'                  individ=77 SRA='SRX7347499' SRR=' ' avgSpotLen= biosample='SAMN13540818' />
<@sample id=260 GSM=‘GSM4213801' condition=‘Soleus, unloading 3d'               individ=77 SRA='SRX7347500' SRR=' ' avgSpotLen= biosample='SAMN13540817' />
<@sample id=261 GSM=‘GSM4213802' condition=‘Soleus, unloading 3d'               individ=78 SRA='SRX7347501' SRR=' ' avgSpotLen= biosample='SAMN13540816' />
<@sample id=262 GSM=‘GSM4213803' condition=‘EDL, unloading 7d, recovery 24h'    individ=90 SRA='SRX7347502' SRR=' ' avgSpotLen= biosample='SAMN13540815' />
<@sample id=263 GSM=‘GSM4213804' condition=‘Soleus, unloading 7d, recovery 24h' individ=90 SRA='SRX7347503' SRR=' ' avgSpotLen= biosample='SAMN13540814' />
<@sample id=264 GSM=‘GSM4213805' condition=‘EDL, unloading 7d, recovery 24h'    individ=92 SRA='SRX7347504' SRR=' ' avgSpotLen= biosample='SAMN13540809' />
<@sample id=265 GSM=‘GSM4213806' condition=‘Soleus, unloading 7d, recovery 24h' individ=92 SRA='SRX7347505' SRR=' ' avgSpotLen= biosample='SAMN13540808' />
<@sample id=266 GSM=‘GSM4213807' condition=‘EDL, unloading 7d, recovery 24h'    individ=93 SRA='SRX7347506' SRR=' ' avgSpotLen= biosample='SAMN13540807' />
<@sample id=267 GSM=‘GSM4213808' condition=‘Soleus, unloading 7d, recovery 24h' individ=93 SRA='SRX7347507' SRR=' ' avgSpotLen= biosample='SAMN13540798' />
<@sample id=268 GSM=‘GSM4213809' condition=‘Soleus, unloading 7d, recovery 3d'  individ=79 SRA='SRX7347508' SRR=' ' avgSpotLen= biosample='SAMN13540797' />
<@sample id=269 GSM=‘GSM4213810' condition=‘EDL, unloading 7d, recovery 7d'     individ=87 SRA='SRX7347509' SRR=' ' avgSpotLen= biosample='SAMN13540796' />
<@sample id=270 GSM=‘GSM4213811' condition=‘Soleus, unloading 7d, recovery 7d'  individ=87 SRA='SRX7347510' SRR=' ' avgSpotLen= biosample='SAMN13540795' />
<@sample id=271 GSM=‘GSM4213812' condition=‘Soleus, unloading 7d, recovery 7d'  individ=88 SRA='SRX7347511' SRR=' ' avgSpotLen= biosample='SAMN13540794' />
<@sample id=272 GSM=‘GSM4213813' condition=‘EDL, unloading 7d, recovery 3d'     individ=89 SRA='SRX7347512' SRR=' ' avgSpotLen= biosample='SAMN13540793' />
<@sample id=273 GSM=‘GSM4213814' condition=‘Soleus, unloading 7d, recovery 3d'  individ=89 SRA='SRX7347513' SRR=' ' avgSpotLen= biosample='SAMN13540792' />
<@sample id=274 GSM=‘GSM4213815' condition=‘EDL, unloading 7d, recovery 3d'     individ=80 SRA='SRX7347514' SRR=' ' avgSpotLen= biosample='SAMN13540791' />
<@sample id=275 GSM=‘GSM4213816' condition=‘Soleus, unloading 7d, recovery 3d'  individ=80 SRA='SRX7347515' SRR=' ' avgSpotLen= biosample='SAMN13540790' />
<@sample id=276 GSM=‘GSM4213817' condition=‘EDL, unloading 3d'                  individ=85 SRA='SRX7347516' SRR=' ' avgSpotLen= biosample='SAMN13540789' />
<@sample id=277 GSM=‘GSM4213818' condition=‘EDL, unloading 7d, recovery 7d'     individ=88 SRA='SRX7347517' SRR=' ' avgSpotLen= biosample='SAMN13540788' />
<@sample id=278 GSM=‘GSM4213819' condition=‘EDL, unloading 7d, recovery 7d'     individ=91 SRA='SRX7347518' SRR=' ' avgSpotLen= biosample='SAMN13540787' />
<@sample id=279 GSM=‘GSM4213820' condition=‘Soleus, unloading 7d, recovery 7d'  individ=91 SRA='SRX7347519' SRR=' ' avgSpotLen= biosample='SAMN13540813' />
<@sample id=280 GSM=‘GSM4213821' condition=‘EDL, unloading 24h'                 individ=94 SRA='SRX7347520' SRR=' ' avgSpotLen= biosample='SAMN13540812' />
<@sample id=281 GSM=‘GSM4213822' condition=‘EDL, unloading 3d'                  individ=78 SRA='SRX7347521' SRR=' ' avgSpotLen= biosample='SAMN13540811' />
<@sample id=282 GSM=‘GSM4213823' condition=‘EDL, unloading 7d, recovery 3d'     individ=79 SRA='SRX7347522' SRR=' ' avgSpotLen= biosample='SAMN13540810' />



-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
