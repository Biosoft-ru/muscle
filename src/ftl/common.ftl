<#assign human=1>

<#assign rna_seq='rna-seq'?str>

<#assign male='male'?str>
<#assign female='female'?str>

<#assign adult='adult'?str>

<#assign healthy='healthy'?str>

<#assign Illumina_HiSeq_2500  =1>
<#assign Illumina_NextSeq_500 =2>

<#assign muscle_VL=2>

<#assign aerobic_training_4w=1>
<#assign aerobic_exercise_60m=2>
 
<#assign trained='trained'?str>
<#assign untrained='untrained'?str>
 
<#macro condition_ref id, title>
'<a href="!table/conditions/Condition/ID=' || id || '">' || title || '</a>'
</#macro>
 