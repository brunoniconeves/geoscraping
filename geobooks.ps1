<#
Script to downloads books from pubs.geoscienceworld.org
#>

#set destination directory where the books will be saved
$destination = 'C:\Users\username\books\'

#set the base url of geoscienceworld
$baseurl = 'https://pubs.geoscienceworld.org'

#set the list of books to download, put the fullpath on each line, between double quotes followed by coma.
$books = @(
	"https://pubs.geoscienceworld.org/books/book/1385/Geology-and-Genesis-of-Major-Copper-Deposits-and",
	"https://pubs.geoscienceworld.org/books/book/1884/Supergene-Environments-Processes-and-Products"
	)

 foreach ($u in $books) {
   
	$geturl = Invoke-WebRequest –Uri $u
	
	$title = $geturl.parsedhtml.body.GetElementsByClassName("book-info__title")[0].outerText
	$dirname = $title.substring(0,20)
	$dirpath = ($destination, $dirname) -join ""
	$dirpath = $dirpath.trim().replace(' ','_')
	
	mkdir $dirpath
	
	$l = $geturl.Links | ? href -like *pdf* 

	$l | select -Unique href | % { 
		#get file name
		$name = $l | ? href -eq $_.href  | select -First 1 -Expand href 
		
        "going to DL $name"
        
        #get actual DL link
		$pdfurl = ($baseurl, $name) -join ""
		
		$outputFileName = Split-Path $pdfurl -leaf
		
		$outputPath = ($dirpath, "\", $outputFileName) -join ""
		
        Invoke-WebRequest -Uri $pdfurl  -OutFile $outputPath  -Verbose 
        
        timeout 30
        
     }

 }
