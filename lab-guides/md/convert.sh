 for file in *.md; do 
 
 md-to-pdf ${file};
 
 done
 

 mv *.pdf ../
 