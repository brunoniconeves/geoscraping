# geoscraping
A simple PowerShell script to help geologists friends to get books from pubs.geoscienceworld.org

# config the script for your enviromment
Change $destination (line 6) variable with your chosen path to save the books. Your user must have write permissions on that folder!
IMPORTANT: do not forget to put a backslash after the last dir or the files will be saved at the immediate parent directory.

Example: $destination = 'C:\Users\username\books\'

TIP: create a folder with only that purpose, put the script.ps1 inside the folder, so all the job will be done on only one folder.

Change the $books (line 12) list to your desired books list.
Example:

$books = @(
	"https://pubs.geoscienceworld.org/books/book/1385/Geology-and-Genesis-of-Major-Copper-Deposits-and",
	"https://pubs.geoscienceworld.org/books/book/1884/Supergene-Environments-Processes-and-Products"
	)

# steps
Before execute the script, your power shell execution policy must be set to Unrestricted.

1. Execute PowerShell with administrator credentials 
2. Runthe command: Set-ExecutionPolicy Unrestricted
3. Press [S] when asked to do so
4. Navigate to the folder where the script.ps1 was saved: (ex.cd  C:\Users\username\Downloads\Books)
4. Execute the script (you need to be at the directory where script was saved) with the command: script.ps1

The script will run and iterate over each book you listed at $books list. Don't skipt the 30s timout our your IP can be blocked as a robot by geoscienceworld.

If your IP got blocked, don't worry. Acess through the link to any book on your web browser and check the captcha to unblock.

# result
When the script end the  execution, at the destination folder, you will see all the books downloaded, each one in his correspondent directory








