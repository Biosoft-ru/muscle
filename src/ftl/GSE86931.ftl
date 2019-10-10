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
 <li>H1 – 4 h after exercise;</li> 
 <li>H2 – 8 h after exercise;</li> 
 <li>rep1 - ...</li>
 <li>rep2 - ...</li>
 </ul>
 "?str},
 
 'to do'
 );
 
-- ---------------------------------------------------------------------------
-- individuals


--- ---------------------------------------------------------------------------
-- conditions


-- ---------------------------------------------------------------------------
-- comparisons


-- ---------------------------------------------------------------------------
-- samples


-- ---------------------------------------------------------------------------
-- expression


-- ---------------------------------------------------------------------------
-- DEGS, enrichment


-- ---------------------------------------------------------------------------
-- clusters, enrichment


-- ---------------------------------------------------------------------------
-- quality control
