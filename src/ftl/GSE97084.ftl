<#include 'common'/>

delete from series where GSE='GSE97084';

<#assign SERIES_ID=14>

INSERT INTO series(ID, GSE, PMID, organism, type, title, description, design, comment)
VALUES(${SERIES_ID}, 'GSE97084', ${human}, ${rna_seq}, 'Enhanced Protein Translation Underlies Improved Metabolic and Physical Adaptations to Different Exercise Training Modes in Young and Old Humans', 

${"The molecular transducers of benefits from different exercise modalities remain incompletely defined. Here we report that 12 weeks of high-intensity aerobic interval (HIIT), resistance (RT), and combined exercise training enhanced insulin sensitivity and lean mass, but only HIIT and combined training improved aerobic capacity and skeletal muscle mitochondrial respiration. HIIT revealed a more robust increase in gene transcripts than other exercise modalities, particularly in older adults, although little overlap with corresponding individual protein abundance was noted. HIIT reversed many age-related differences in the proteome, particularly of mitochondrial proteins in concert with increased mitochondrial protein synthesis. Both RT and HIIT enhanced proteins involved in translational machinery irrespective of age. Only small changes of methylation of DNA promoter regions were observed. We provide evidence for predominant exercise regulation at the translational level, enhancing translational capacity and proteome abundance to explain phenotypic gains in muscle mitochondrial function and hypertrophy in all ages. Males and females were involved in experiments, but there is no clear info neither in GSE, nor in the article. "?str},

${"The prospective exercise training study was approved by the Mayo Clinic Institutional Review Board, registered at https://clinicaltrials.gov (#NCT01477164) and conducted in accordance with the Declaration of Helsinki. All participants provided informed written consent. Participants were recruited into two distinct age groups: young (18–30 years) or older (65–80 years) with a goal of an equal number of men and women. The final groups were approximately balanced for sex, and all women in the older group were post-menopausal. Exclusion criteria were structured regular exercise (>20 min, twice weekly), cardiovascular disease, metabolic diseases (type 2 diabetes mellitus, fasting blood glucose > 110 mg/dL, and untreated hypothyroidism or hyperthyroidism), renal disease, high body mass index (BMI > 32 kg/m2), implanted metal devices, pregnancy, smoking, and history of blood clotting disorders. Exclusionary medication included anticoagulants, insulin, insulin sensitizers, corticosteroids, sulfonylureas, barbiturates, peroxisome proliferator-activated receptor γ agonists, β blockers, opiates, and tricyclic antidepressants. Following baseline measurements, the participants were randomized to three groups (HIIT, RT, or CT) using gRand (v1.1, Peter A. Charpentier) following a permuted block strategy with block length of 15 and 2 factors (age and sex). HIIT was 3 days per week of cycling (4 × 4 min at >90% of peak oxygen consumption [VO2 peak] with 3 min pedaling at no load) and 2 days per week of treadmill walking (45 min at 70% of VO2 peak). RT consisted of lower and upper body exercises (4 sets of 8–12 repetitions) 2 days each per week. CT participants first underwent a 12-week sedentary period (SED) and wore accelerometers to record any structured activity. Following SED, participants underwent metabolic studies and began CT of 5 days per week cycling (30 min at 70% VO2 peak) and 4 days per week weight lifting with fewer repetitions than RT. Both baseline and post-training studies were performed in all participants.

<br/><br/>Symbols in file names: 
<ul>
HIIT - high-intensity aerobic interval
RT - resistance training,
CT - combined exercise training
</ul>
 "?str},
 
 'complete: expression; comparisons; DEGS, enrichment; clusters, enrichment; quality control'
 );
 
-- ---------------------------------------------------------------------------
-- individuals

delete from individuals where ID IN (159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210);

<#macro individ id, code, sex>
INSERT INTO individuals(ID, code, organism,  sex, stage, state) VALUES(${id}, ${code?str}, ${human}, ${sex?str}, ${adult}, ${healthy} );
</#macro>

<@individ id=159	code ='10B Young Combined'		sex='unknown' />
<@individ id=160	code ='11A Young HIIT'			sex='unknown' />
<@individ id=161	code ='13A Young Resistance'	sex='unknown' />
<@individ id=162	code ='14B Young Combined'		sex='unknown' />
<@individ id=163	code ='15A Young Resistance'	sex='unknown' />
<@individ id=164	code ='16A Young Resistance'	sex='unknown' />
<@individ id=165	code ='17A Young HIIT'			sex='unknown' />
<@individ id=166	code ='18A Young HIIT'			sex='unknown' />
<@individ id=167	code ='19A Young Resistance'	sex='unknown' />
<@individ id=168	code ='1B Old Combined'			sex='unknown' />
<@individ id=169	code ='20B Old Combined'		sex='unknown' />
<@individ id=170	code ='21B Young Combined'		sex='unknown' />
<@individ id=171	code ='22A Old HIIT'			sex='unknown' />
<@individ id=172	code ='23A Young HIIT'			sex='unknown' />
<@individ id=173	code ='24A Young HIIT'			sex='unknown' />
<@individ id=174	code ='25A Young Resistance'	sex='unknown' />
<@individ id=175	code ='26A Young HIIT'			sex='unknown' />
<@individ id=176	code ='27B Young Combined'		sex='unknown' />
<@individ id=177	code ='28A Old Resistance'		sex='unknown' />
<@individ id=178	code ='29A Young Resistance'	sex='unknown' />
<@individ id=179	code ='2B Young Combined'		sex='unknown' />
<@individ id=180	code ='30A Young Resistance'	sex='unknown' />
<@individ id=181	code ='31B Young Combined'		sex='unknown' />
<@individ id=182	code ='32A Young HIIT'			sex='unknown' />
<@individ id=183	code ='33A Young Resistance'	sex='unknown' />
<@individ id=184	code ='34A Old Resistance'		sex='unknown' />
<@individ id=185	code ='35A Young HIIT'			sex='unknown' />
<@individ id=186	code ='36B Young Combined'		sex='unknown' />
<@individ id=187	code ='37B Old Combined'		sex='unknown' />
<@individ id=188	code ='38A Young Resistance'	sex='unknown' />
<@individ id=189	code ='39A Young HIIT'			sex='unknown' />
<@individ id=190	code ='3A Young Resistance'		sex='unknown' />
<@individ id=191	code ='40A Young HIIT'			sex='unknown' />
<@individ id=192	code ='41B Young Combined'		sex='unknown' />
<@individ id=193	code ='42A Old HIIT'			sex='unknown' />
<@individ id=194	code ='43A Old Resistance'		sex='unknown' />
<@individ id=195	code ='44A Old Resistance'		sex='unknown' />
<@individ id=196	code ='45A Old HIIT'			sex='unknown' />
<@individ id=197	code ='46B Old Combined'		sex='unknown' />
<@individ id=198	code ='47A Old HIIT'			sex='unknown' />
<@individ id=199	code ='48B Old Combined'		sex='unknown' />
<@individ id=200	code ='49A Old Resistance'		sex='unknown' />
<@individ id=201	code ='4A Old HIIT'				sex='unknown' />
<@individ id=202	code ='50A Old Resistance'		sex='unknown' />
<@individ id=203	code ='51A Old HIIT'			sex='unknown' />
<@individ id=204	code ='52A Old HIIT'			sex='unknown' />
<@individ id=205	code ='53A Old HIIT'			sex='unknown' />
<@individ id=206	code ='5B Old Combined'			sex='unknown' />
<@individ id=207	code ='6A Young HIIT'			sex='unknown' />
<@individ id=208	code ='7B Old Combined'			sex='unknown' />
<@individ id=209	code ='8A Old Resistance'		sex='unknown' />
<@individ id=210	code ='9A Old Resistance'		sex='unknown' />

--- ---------------------------------------------------------------------------
-- conditions

delete from conditions WHERE ID IN (69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80);

<#macro condition id, title, status, time, treatment>
INSERT INTO conditions(id, title, status, timePoint, treatment) VALUES(${id}, ${title?str}, ${status}, ${time}, ${treatment} );
</#macro>

<@condition id=69 title='young, HIIT, pre_exercises'  status=untrained time=0  treatment='NULL' />
<@condition id=70 title='young, HIIT, post_exercises' status=untrained time=0  treatment=15 />
<@condition id=71 title='young, RT, pre_exercises'    status=untrained time=0  treatment='NULL' />
<@condition id=72 title='young, RT, post_exercises'   status=untrained time=0  treatment=16 />
<@condition id=73 title='young, CT, pre_exercises'    status=untrained time=0  treatment='NULL' />
<@condition id=74 title='young, CT, post_exercises'   status=untrained time=0  treatment=17 />
<@condition id=75 title='old, HIIT, pre_exercises'    status=untrained time=0  treatment='NULL' />
<@condition id=76 title='old, HIIT, post_exercises'   status=untrained time=0  treatment=15 />
<@condition id=77 title='old, RT, pre_exercises'      status=untrained time=0  treatment='NULL' />
<@condition id=78 title='old, RT, post_exercises'     status=untrained time=0  treatment=16 />
<@condition id=79 title='old, CT, pre_exercises'      status=untrained time=0  treatment='NULL' />
<@condition id=80 title='old, CT, post_exercises'     status=untrained time=0  treatment=17 />

-- ---------------------------------------------------------------------------
-- comparisons
delete from comparisons WHERE ID IN (79,80,81,82,83,84,85,86,87,88,89,90);
            
<#macro comparison id, title, condition1, condition2 comment>
INSERT INTO comparisons(id, title, series, condition1, condition2, comment) VALUES(${id}, ${title?str}, ${SERIES_ID}, ${condition1}, ${condition2}, ${comment} );
</#macro>

<@comparison id=79 title='young, HIIT, post_exercises vs pre_exercises' condition1=70 condition2=69 comment='NULL' />
<@comparison id=80 title='young, RT, post_exercises vs pre_exercises' 	condition1=72 condition2=71 comment='NULL' />
<@comparison id=81 title='young, CT, post_exercises vs pre_exercises' 	condition1=74 condition2=73 comment='NULL' />
<@comparison id=82 title='old, HIIT, post_exercises vs pre_exercises' 	condition1=76 condition2=75 comment='NULL' />
<@comparison id=83 title='old, RT, post_exercises vs pre_exercises' 	condition1=78 condition2=77 comment='NULL' />
<@comparison id=84 title='old, CT, post_exercises vs pre_exercises' 	condition1=80 condition2=79 comment='NULL' />
<@comparison id=85 title='HIIT, pre_exercises, young vs old' 			condition1=69 condition2=75 comment='NULL' />
<@comparison id=86 title='HIIT, post_exercises, young vs old' 			condition1=70 condition2=76 comment='NULL' />
<@comparison id=87 title='RT, pre_exercises, young vs old' 				condition1=71 condition2=77 comment='NULL' />
<@comparison id=88 title='RT, post_exercises, young vs old' 			condition1=72 condition2=78 comment='NULL' />
<@comparison id=89 title='CT, pre_exercises, young vs old' 				condition1=73 condition2=79 comment='NULL' />
<@comparison id=90 title='CT, post_exercises, young vs old' 			condition1=74 condition2=80 comment='NULL' />


-- ---------------------------------------------------------------------------
-- samples

delete from biosamples where id IN (423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525);
delete from samples where id IN (423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525);

<#macro sample id, GSM, condition, individ, SRA, SRR, avgSpotLen, biosample>
<#local title = condition + '_' + individ>
<#local platform = Illumina_HiSeq_2000 />

INSERT INTO biosamples(ID, title, individual, tissue, biosample, condition)
(
	SELECT ${id}, ${title?str}, ${individ}, ${muscle_VL}, ${biosample?str}, c.id
	FROM conditions c 
	WHERE c.title=${condition?str}
);	

INSERT INTO samples(ID, GSM, title, type, platform, SRA, SRR, avgSpotLen, biosample, series)
VALUES(${id}, ${GSM?str}, ${title?str}, ${rna_seq}, ${platform?str}, ${SRA?str}, ${SRR?str}, ${avgSpotLen}, ${id}, ${SERIES_ID});

</#macro>

<@sample id=423	GSM='GSM2551324'	condition='young, CT, pre_exercises'	individ=159	SRA='SRX2676301'	SRR='SRR5381158'	avgSpotLen=105	biosample='SAMN06645551' />
<@sample id=424	GSM='GSM2551325'	condition='young, CT, post_exercises'	individ=159	SRA='SRX2676302'	SRR='SRR5381159'	avgSpotLen=105	biosample='SAMN06645550' />
<@sample id=425	GSM='GSM2551326'	condition='young, HIIT, pre_exercises'	individ=160	SRA='SRX2676303'	SRR='SRR5381160'	avgSpotLen=105	biosample='SAMN06645549' />
<@sample id=426	GSM='GSM2551327'	condition='young, HIIT, post_exercises'	individ=160	SRA='SRX2676304'	SRR='SRR5381161'	avgSpotLen=105	biosample='SAMN06645548' />
<@sample id=427	GSM='GSM2551328'	condition='young, RT, pre_exercises'	individ=161	SRA='SRX2676305'	SRR='SRR5381162'	avgSpotLen=105	biosample='SAMN06645547' />
<@sample id=428	GSM='GSM2551329'	condition='young, RT, post_exercises'	individ=161	SRA='SRX2676306'	SRR='SRR5381163'	avgSpotLen=105	biosample='SAMN06645546' />
<@sample id=429	GSM='GSM2551330'	condition='young, CT, pre_exercises'	individ=162	SRA='SRX2676307'	SRR='SRR5381164'	avgSpotLen=105	biosample='SAMN06645545' />
<@sample id=430	GSM='GSM2551331'	condition='young, CT, post_exercises'	individ=162	SRA='SRX2676308'	SRR='SRR5381165'	avgSpotLen=105	biosample='SAMN06645544' />
<@sample id=431	GSM='GSM2551332'	condition='young, RT, pre_exercises'	individ=163	SRA='SRX2676309'	SRR='SRR5381166'	avgSpotLen=105	biosample='SAMN06645543' />
<@sample id=432	GSM='GSM2551333'	condition='young, RT, post_exercises'	individ=163	SRA='SRX2676310'	SRR='SRR5381167'	avgSpotLen=105	biosample='SAMN06645542' />
<@sample id=433	GSM='GSM2551334'	condition='young, RT, pre_exercises'	individ=164	SRA='SRX2676311'	SRR='SRR5381168'	avgSpotLen=105	biosample='SAMN06645541' />
<@sample id=434	GSM='GSM2551335'	condition='young, RT, post_exercises'	individ=164	SRA='SRX2676312'	SRR='SRR5381169'	avgSpotLen=105	biosample='SAMN06645540' />
<@sample id=435	GSM='GSM2551336'	condition='young, HIIT, pre_exercises'	individ=165	SRA='SRX2676313'	SRR='SRR5381170'	avgSpotLen=105	biosample='SAMN06645539' />
<@sample id=436	GSM='GSM2551337'	condition='young, HIIT, post_exercises'	individ=165	SRA='SRX2676314'	SRR='SRR5381171'	avgSpotLen=105	biosample='SAMN06645538' />
<@sample id=437	GSM='GSM2551338'	condition='young, HIIT, pre_exercises'	individ=166	SRA='SRX2676315'	SRR='SRR5381172'	avgSpotLen=105	biosample='SAMN06645537' />
<@sample id=438	GSM='GSM2551339'	condition='young, HIIT, post_exercises'	individ=166	SRA='SRX2676316'	SRR='SRR5381173'	avgSpotLen=105	biosample='SAMN06645536' />
<@sample id=439	GSM='GSM2551340'	condition='young, RT, pre_exercises'	individ=167	SRA='SRX2676317'	SRR='SRR5381174'	avgSpotLen=105	biosample='SAMN06645535' />
<@sample id=440	GSM='GSM2551341'	condition='young, RT, post_exercises'	individ=167	SRA='SRX2676318'	SRR='SRR5381175'	avgSpotLen=105	biosample='SAMN06645534' />
<@sample id=441	GSM='GSM2551342'	condition='old, CT, pre_exercises'		individ=168	SRA='SRX2676319'	SRR='SRR5381176'	avgSpotLen=105	biosample='SAMN06645531' />
<@sample id=442	GSM='GSM2551343'	condition='old, CT, post_exercises'		individ=168	SRA='SRX2676320'	SRR='SRR5381177'	avgSpotLen=105	biosample='SAMN06645478' />
<@sample id=443	GSM='GSM2551344'	condition='old, CT, pre_exercises'		individ=169	SRA='SRX2676321'	SRR='SRR5381178'	avgSpotLen=105	biosample='SAMN06645477' />
<@sample id=444	GSM='GSM2551345'	condition='old, CT, post_exercises'		individ=169	SRA='SRX2676322'	SRR='SRR5381179'	avgSpotLen=105	biosample='SAMN06645476' />
<@sample id=445	GSM='GSM2551346'	condition='young, CT, pre_exercises'	individ=170	SRA='SRX2676323'	SRR='SRR5381180'	avgSpotLen=105	biosample='SAMN06645475' />
<@sample id=446	GSM='GSM2551347'	condition='young, CT, post_exercises'	individ=170	SRA='SRX2676324'	SRR='SRR5381181'	avgSpotLen=105	biosample='SAMN06645533' />
<@sample id=447	GSM='GSM2551348'	condition='old, HIIT, pre_exercises'	individ=171	SRA='SRX2676325'	SRR='SRR5381182'	avgSpotLen=105	biosample='SAMN06645532' />
<@sample id=448	GSM='GSM2551349'	condition='old, HIIT, post_exercises'	individ=171	SRA='SRX2676326'	SRR='SRR5381183'	avgSpotLen=105	biosample='SAMN06645467' />
<@sample id=449	GSM='GSM2551350'	condition='young, HIIT, pre_exercises'	individ=172	SRA='SRX2676327'	SRR='SRR5381184'	avgSpotLen=105	biosample='SAMN06645474' />
<@sample id=450	GSM='GSM2551351'	condition='young, HIIT, post_exercises'	individ=172	SRA='SRX2676328'	SRR='SRR5381185'	avgSpotLen=105	biosample='SAMN06645473' />
<@sample id=451	GSM='GSM2551352'	condition='young, HIIT, pre_exercises'	individ=173	SRA='SRX2676329'	SRR='SRR5381186'	avgSpotLen=105	biosample='SAMN06645472' />
<@sample id=452	GSM='GSM2551353'	condition='young, HIIT, post_exercises'	individ=173	SRA='SRX2676330'	SRR='SRR5381187'	avgSpotLen=105	biosample='SAMN06645471' />
<@sample id=453	GSM='GSM2551354'	condition='young, RT, pre_exercises'	individ=174	SRA='SRX2676331'	SRR='SRR5381188'	avgSpotLen=105	biosample='SAMN06645470' />
<@sample id=454	GSM='GSM2551355'	condition='young, RT, post_exercises'	individ=174	SRA='SRX2676332'	SRR='SRR5381189'	avgSpotLen=105	biosample='SAMN06645469' />
<@sample id=455	GSM='GSM2551356'	condition='young, HIIT, pre_exercises'	individ=175	SRA='SRX2676333'	SRR='SRR5381190'	avgSpotLen=105	biosample='SAMN06645468' />
<@sample id=456	GSM='GSM2551357'	condition='young, HIIT, post_exercises'	individ=175	SRA='SRX2676334'	SRR='SRR5381191'	avgSpotLen=105	biosample='SAMN06645466' />
<@sample id=457	GSM='GSM2551358'	condition='young, CT, pre_exercises'	individ=176	SRA='SRX2676335'	SRR='SRR5381192'	avgSpotLen=105	biosample='SAMN06645465' />
<@sample id=458	GSM='GSM2551359'	condition='old, RT, pre_exercises'		individ=177	SRA='SRX2676336'	SRR='SRR5381193'	avgSpotLen=105	biosample='SAMN06645464' />
<@sample id=459	GSM='GSM2551360'	condition='old, RT, post_exercises'		individ=177	SRA='SRX2676337'	SRR='SRR5381194'	avgSpotLen=105	biosample='SAMN06645463' />
<@sample id=460	GSM='GSM2551361'	condition='young, RT, pre_exercises'	individ=178	SRA='SRX2676338'	SRR='SRR5381195'	avgSpotLen=105	biosample='SAMN06645462' />
<@sample id=461	GSM='GSM2551362'	condition='young, RT, post_exercises'	individ=178	SRA='SRX2676339'	SRR='SRR5381196'	avgSpotLen=105	biosample='SAMN06645461' />
<@sample id=462	GSM='GSM2551363'	condition='young, CT, pre_exercises'	individ=179	SRA='SRX2676340'	SRR='SRR5381197'	avgSpotLen=105	biosample='SAMN06645460' />
<@sample id=463	GSM='GSM2551364'	condition='young, CT, post_exercises'	individ=179	SRA='SRX2676341'	SRR='SRR5381198'	avgSpotLen=105	biosample='SAMN06645459' />
<@sample id=464	GSM='GSM2551365'	condition='young, RT, pre_exercises'	individ=180	SRA='SRX2676342'	SRR='SRR5381199'	avgSpotLen=105	biosample='SAMN06645458' />
<@sample id=465	GSM='GSM2551366'	condition='young, RT, post_exercises'	individ=180	SRA='SRX2676343'	SRR='SRR5381200'	avgSpotLen=105	biosample='SAMN06645457' />
<@sample id=466	GSM='GSM2551367'	condition='young, CT, pre_exercises'	individ=181	SRA='SRX2676344'	SRR='SRR5381201'	avgSpotLen=105	biosample='SAMN06645456' />
<@sample id=467	GSM='GSM2551368'	condition='young, CT, post_exercises'	individ=181	SRA='SRX2676345'	SRR='SRR5381202'	avgSpotLen=105	biosample='SAMN06645455' />
<@sample id=468	GSM='GSM2551369'	condition='young, HIIT, pre_exercises'	individ=182	SRA='SRX2676346'	SRR='SRR5381203'	avgSpotLen=105	biosample='SAMN06645454' />
<@sample id=469	GSM='GSM2551370'	condition='young, HIIT, post_exercises'	individ=182	SRA='SRX2676347'	SRR='SRR5381204'	avgSpotLen=105	biosample='SAMN06645453' />
<@sample id=470	GSM='GSM2551371'	condition='young, RT, pre_exercises'	individ=183	SRA='SRX2676348'	SRR='SRR5381205'	avgSpotLen=105	biosample='SAMN06645452' />
<@sample id=471	GSM='GSM2551372'	condition='young, RT, post_exercises'	individ=183	SRA='SRX2676349'	SRR='SRR5381206'	avgSpotLen=105	biosample='SAMN06645451' />
<@sample id=472	GSM='GSM2551373'	condition='old, RT, pre_exercises'		individ=184	SRA='SRX2676350'	SRR='SRR5381207'	avgSpotLen=105	biosample='SAMN06645450' />
<@sample id=473	GSM='GSM2551374'	condition='old, RT, post_exercises'		individ=184	SRA='SRX2676351'	SRR='SRR5381208'	avgSpotLen=105	biosample='SAMN06645449' />
<@sample id=474	GSM='GSM2551375'	condition='young, HIIT, pre_exercises'	individ=185	SRA='SRX2676352'	SRR='SRR5381209'	avgSpotLen=105	biosample='SAMN06645508' />
<@sample id=475	GSM='GSM2551376'	condition='young, HIIT, post_exercises'	individ=185	SRA='SRX2676353'	SRR='SRR5381210'	avgSpotLen=105	biosample='SAMN06645507' />
<@sample id=476	GSM='GSM2551377'	condition='young, CT, pre_exercises'	individ=186	SRA='SRX2676354'	SRR='SRR5381211'	avgSpotLen=105	biosample='SAMN06645506' />
<@sample id=477	GSM='GSM2551378'	condition='young, CT, post_exercises'	individ=186	SRA='SRX2676355'	SRR='SRR5381212'	avgSpotLen=105	biosample='SAMN06645505' />
<@sample id=478	GSM='GSM2551379'	condition='old, CT, pre_exercises'		individ=187	SRA='SRX2676356'	SRR='SRR5381213'	avgSpotLen=105	biosample='SAMN06645504' />
<@sample id=479	GSM='GSM2551380'	condition='old, CT, post_exercises'		individ=187	SRA='SRX2676357'	SRR='SRR5381214'	avgSpotLen=105	biosample='SAMN06645503' />
<@sample id=480	GSM='GSM2551381'	condition='young, RT, pre_exercises'	individ=188	SRA='SRX2676358'	SRR='SRR5381215'	avgSpotLen=105	biosample='SAMN06645502' />
<@sample id=481	GSM='GSM2551382'	condition='young, RT, post_exercises'	individ=188	SRA='SRX2676359'	SRR='SRR5381216'	avgSpotLen=105	biosample='SAMN06645501' />
<@sample id=482	GSM='GSM2551383'	condition='young, HIIT, pre_exercises'	individ=189	SRA='SRX2676360'	SRR='SRR5381217'	avgSpotLen=105	biosample='SAMN06645500' />
<@sample id=483	GSM='GSM2551384'	condition='young, HIIT, post_exercises'	individ=189	SRA='SRX2676361'	SRR='SRR5381218'	avgSpotLen=105	biosample='SAMN06645499' />
<@sample id=484	GSM='GSM2551385'	condition='young, RT, pre_exercises'	individ=190	SRA='SRX2676362'	SRR='SRR5381219'	avgSpotLen=105	biosample='SAMN06645498' />
<@sample id=485	GSM='GSM2551386'	condition='young, RT, post_exercises'	individ=190	SRA='SRX2676363'	SRR='SRR5381220'	avgSpotLen=105	biosample='SAMN06645497' />
<@sample id=486	GSM='GSM2551387'	condition='young, HIIT, pre_exercises'	individ=191	SRA='SRX2676364'	SRR='SRR5381221'	avgSpotLen=105	biosample='SAMN06645496' />
<@sample id=487	GSM='GSM2551388'	condition='young, HIIT, post_exercises'	individ=191	SRA='SRX2676365'	SRR='SRR5381222'	avgSpotLen=105	biosample='SAMN06645495' />
<@sample id=488	GSM='GSM2551389'	condition='young, CT, pre_exercises'	individ=192	SRA='SRX2676366'	SRR='SRR5381223'	avgSpotLen=105	biosample='SAMN06645494' />
<@sample id=489	GSM='GSM2551390'	condition='young, CT, post_exercises'	individ=192	SRA='SRX2676367'	SRR='SRR5381224'	avgSpotLen=105	biosample='SAMN06645493' />
<@sample id=490	GSM='GSM2551391'	condition='old, HIIT, pre_exercises'	individ=193	SRA='SRX2676368'	SRR='SRR5381225'	avgSpotLen=105	biosample='SAMN06645492' />
<@sample id=491	GSM='GSM2551392'	condition='old, HIIT, post_exercises'	individ=193	SRA='SRX2676369'	SRR='SRR5381226'	avgSpotLen=105	biosample='SAMN06645491' />
<@sample id=492	GSM='GSM2551393'	condition='old, RT, pre_exercises'		individ=194	SRA='SRX2676370'	SRR='SRR5381227'	avgSpotLen=105	biosample='SAMN06645490' />
<@sample id=493	GSM='GSM2551394'	condition='old, RT, post_exercises'		individ=194	SRA='SRX2676371'	SRR='SRR5381228'	avgSpotLen=105	biosample='SAMN06645489' />
<@sample id=494	GSM='GSM2551395'	condition='old, RT, pre_exercises'		individ=195	SRA='SRX2676372'	SRR='SRR5381229'	avgSpotLen=105	biosample='SAMN06645488' />
<@sample id=495	GSM='GSM2551396'	condition='old, RT, post_exercises'		individ=195	SRA='SRX2676373'	SRR='SRR5381230'	avgSpotLen=105	biosample='SAMN06645487' />
<@sample id=496	GSM='GSM2551397'	condition='old, HIIT, pre_exercises'	individ=196	SRA='SRX2676374'	SRR='SRR5381231'	avgSpotLen=105	biosample='SAMN06645486' />
<@sample id=497	GSM='GSM2551398'	condition='old, HIIT, post_exercises'	individ=196	SRA='SRX2676375'	SRR='SRR5381232'	avgSpotLen=105	biosample='SAMN06645485' />
<@sample id=498	GSM='GSM2551399'	condition='old, CT, pre_exercises'		individ=197	SRA='SRX2676376'	SRR='SRR5381233'	avgSpotLen=105	biosample='SAMN06645484' />
<@sample id=499	GSM='GSM2551400'	condition='old, CT, post_exercises'		individ=197	SRA='SRX2676377'	SRR='SRR5381234'	avgSpotLen=105	biosample='SAMN06645483' />
<@sample id=500	GSM='GSM2551401'	condition='old, HIIT, pre_exercises'	individ=198	SRA='SRX2676378'	SRR='SRR5381235'	avgSpotLen=105	biosample='SAMN06645482' />
<@sample id=501	GSM='GSM2551402'	condition='old, HIIT, post_exercises'	individ=198	SRA='SRX2676379'	SRR='SRR5381236'	avgSpotLen=105	biosample='SAMN06645481' />
<@sample id=502	GSM='GSM2551403'	condition='old, CT, pre_exercises'		individ=199	SRA='SRX2676380'	SRR='SRR5381237'	avgSpotLen=105	biosample='SAMN06645480' />
<@sample id=503	GSM='GSM2551404'	condition='old, CT, post_exercises'		individ=199	SRA='SRX2676381'	SRR='SRR5381238'	avgSpotLen=105	biosample='SAMN06645529' />
<@sample id=504	GSM='GSM2551405'	condition='old, RT, pre_exercises'		individ=200	SRA='SRX2676382'	SRR='SRR5381239'	avgSpotLen=105	biosample='SAMN06645528' />
<@sample id=505	GSM='GSM2551406'	condition='old, RT, post_exercises'		individ=200	SRA='SRX2676383'	SRR='SRR5381240'	avgSpotLen=105	biosample='SAMN06645527' />
<@sample id=506	GSM='GSM2551407'	condition='old, HIIT, pre_exercises'	individ=201	SRA='SRX2676384'	SRR='SRR5381241'	avgSpotLen=105	biosample='SAMN06645526' />
<@sample id=507	GSM='GSM2551408'	condition='old, HIIT, post_exercises'	individ=201	SRA='SRX2676385'	SRR='SRR5381242'	avgSpotLen=105	biosample='SAMN06645525' />
<@sample id=508	GSM='GSM2551409'	condition='old, RT, pre_exercises'		individ=202	SRA='SRX2676386'	SRR='SRR5381243'	avgSpotLen=105	biosample='SAMN06645524' />
<@sample id=509	GSM='GSM2551410'	condition='old, RT, post_exercises'		individ=202	SRA='SRX2676387'	SRR='SRR5381244'	avgSpotLen=105	biosample='SAMN06645479' />
<@sample id=510	GSM='GSM2551411'	condition='old, HIIT, pre_exercises'	individ=203	SRA='SRX2676388'	SRR='SRR5381245'	avgSpotLen=105	biosample='SAMN06645530' />
<@sample id=511	GSM='GSM2551412'	condition='old, HIIT, post_exercises'	individ=203	SRA='SRX2676389'	SRR='SRR5381246'	avgSpotLen=105	biosample='SAMN06645523' />
<@sample id=512	GSM='GSM2551413'	condition='old, HIIT, pre_exercises'	individ=204	SRA='SRX2676390'	SRR='SRR5381247'	avgSpotLen=105	biosample='SAMN06645522' />
<@sample id=513	GSM='GSM2551414'	condition='old, HIIT, post_exercises'	individ=204	SRA='SRX2676391'	SRR='SRR5381248'	avgSpotLen=105	biosample='SAMN06645521' />
<@sample id=514	GSM='GSM2551415'	condition='old, HIIT, pre_exercises'	individ=205	SRA='SRX2676392'	SRR='SRR5381249'	avgSpotLen=105	biosample='SAMN06645520' />
<@sample id=515	GSM='GSM2551416'	condition='old, HIIT, post_exercises'	individ=205	SRA='SRX2676393'	SRR='SRR5381250'	avgSpotLen=105	biosample='SAMN06645519' />
<@sample id=516	GSM='GSM2551417'	condition='old, CT, pre_exercises'		individ=206	SRA='SRX2676394'	SRR='SRR5381251'	avgSpotLen=105	biosample='SAMN06645518' />
<@sample id=517	GSM='GSM2551418'	condition='old, CT, post_exercises'		individ=206	SRA='SRX2676395'	SRR='SRR5381252'	avgSpotLen=105	biosample='SAMN06645517' />
<@sample id=518	GSM='GSM2551419'	condition='young, HIIT, pre_exercises'	individ=207	SRA='SRX2676396'	SRR='SRR5381253'	avgSpotLen=105	biosample='SAMN06645516' />
<@sample id=519	GSM='GSM2551420'	condition='young, HIIT, post_exercises'	individ=207	SRA='SRX2676397'	SRR='SRR5381254'	avgSpotLen=105	biosample='SAMN06645515' />
<@sample id=520	GSM='GSM2551421'	condition='old, CT, pre_exercises'		individ=208	SRA='SRX2676398'	SRR='SRR5381255'	avgSpotLen=105	biosample='SAMN06645514' />
<@sample id=521	GSM='GSM2551422'	condition='old, CT, post_exercises'		individ=208	SRA='SRX2676399'	SRR='SRR5381256'	avgSpotLen=105	biosample='SAMN06645513' />
<@sample id=522	GSM='GSM2551423'	condition='old, RT, pre_exercises'		individ=209	SRA='SRX2676400'	SRR='SRR5381257'	avgSpotLen=105	biosample='SAMN06645512' />
<@sample id=523	GSM='GSM2551424'	condition='old, RT, post_exercises'		individ=209	SRA='SRX2676401'	SRR='SRR5381258'	avgSpotLen=105	biosample='SAMN06645511' />
<@sample id=524	GSM='GSM2551425'	condition='old, RT, pre_exercises'		individ=210	SRA='SRX2676402'	SRR='SRR5381259'	avgSpotLen=105	biosample='SAMN06645510' />
<@sample id=525	GSM='GSM2551426'	condition='old, RT, post_exercises'		individ=210	SRA='SRX2676403'	SRR='SRR5381260'	avgSpotLen=105	biosample='SAMN06645509' />

-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control

