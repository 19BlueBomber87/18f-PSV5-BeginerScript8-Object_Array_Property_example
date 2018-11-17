#The purpose of this exercise is learning not efficiency
function Opening {
Write-Verbose -Message "Propose: Learn, Share and Document
Goals:
[1]Display information about how objects work the PowerShell Console
[2]Design and share a script that will aid in learning by illustrating how the commands work Get-Eventlog, Read-Host, Write-Verbose and creating functions are the main focus of the exercise
This whole 'Program' is two functions:
This if for beginners like me so if your advanced don't bother" -Verbose *>&1
}
function Show-Possible_Input_For_Get-eventlog_-Logname
{
write-verbose -Message " The following list displays all the ‘Input’ options you can enter for the -LogName 'Parameter' of the Get-EventLog Command" -Verbose *>&1
$logNamesParameterList = (Get-EventLog -logname *)
($logNamesParameterList).log | Format-list * | Out-File C:\Kruse\18f-BB_EL-Verbose-3.txt
$a = Get-Content -Raw C:\Kruse\18f-BB_EL-Verbose-3.txt
write-verbose -Message ($A) -Verbose *>&1
Remove-Item C:\Kruse\18f-BB_EL-Verbose-3.txt
write-verbose -Message "Wow that is neat How do I do that?" -Verbose *>&1
}
function Show-How_I_used_write-Verbose_to-Display_Iputs_For_The_Event-Log_Parameter_-Logname
{
Write-Verbose -Message "When I enter [Get-EventLog -LogName *] Powershell returns an 'Array of Objects';
The 'Objects' are the 'Row' entries; The ‘Properties’ are the ‘Column’ entries;
In this case Powershell returned 7 objects;
The input for the -LogName 'Parameter' can be any of the 'Log' ‘Column’ ‘Properties’;
In this case the 'Log' ‘Column’ ‘Property’ entries (application, security, ect.) are also 'objects' themselves,  each will have its own 'Property' set;
[Note: each of those 'Property' sets could also be 'Objects': 'A dream within dream with...in..a...dream??J/k';
Now breathe :)
When you enter [Get-EventLog -Logname Application];
This is key--->You are commanding PowerShell to return the 'Array' of 'Objects' that the 'Application Property' represents<---This is key;
In this case each 'Object' has more properties than what PowerShell displays by default;
However powershell was designed to return the most relevant data;
In this case Powershell only displays 5 ‘Property’ types[Max(K) Retain, OverflowAction, Entries and Log]
It reads like this:  The Event-Log 'System', has 2,337 'Entries' and a 'Max(k)' of 20,480 [note: That output is for my machine, you will get something different than on yours]" -Verbose *>&1
Get-EventLog -LogName *
Write-Verbose -Message "Now we are going to return all of the 'Properties' for all 7 'Objects
We are going to reformat this output by 'PIPING' the output of the [Get-EventLog -LogName *] to the command [Format-list *]'
Note: [Select-Object *] can be used in place of [Format-List]" -Verbose *>&1
Read-Host "Ready to get the see all the ‘Properties’ for each Press any key to continue"
cls
Get-EventLog -LogName * | Format-List * | More
Write-Verbose -Message "Looks Kind of Messy :(
If you notice there is a 'Log Property' and a 'LogDisplayName Property'
LogDisplayName       : Hardware Events
Log                  : HardwareEvents
We are after the 'Log' Property.  This gives us the input for the -LogName 'Parameter' of the [Get-EventLog] Command
If you use: 'Hardware Events' in the -LogName 'Parameter' The command will fail because of the space between hardware and events
" -Verbose *>&1
Write-Verbose -Message "Ok Lets Clean up the Data :)" -Verbose 6>&1
Read-Host "Press any key to continue[3]"
Get-EventLog * | Sort-Object log | Select-Object log
Write-Verbose -Message "Wow That's pretty cool!
I don't really like the ‘Log’ on top of each object though
Lets get rid of them" -Verbose 6>&1
Read-Host "Press any key to continue[4]"
cls
(Get-EventLog *).Log
Write-Verbose -Message "DANG that's really neat!
How we achieved this is by wrapping the command [Get-EventLog -LogName *] in () like this;
(Get-EventLog -LogName*).Log
After we wrap the command in parentheses, we type a 'period' outside the rightmost parenthese;
This is key---->At this point you could simply press tab and you will cycle through all properties<---This is key
We will now type '.Log' outside the rightmost parthesee
Now For the tricky part

We are going to take this output, and use [Write-Verbose] to display it
Here is how I did it. 
There is more the one way to skin the cat in PowerShell
The purpose of this exercise is learning not efficiency
NOW LET'S GET THE OUTPUT OF THE VERBOSE COMMAND TO DISPLAY THIS!!!" -Verbose 6>&1
Read-Host "Press any key to continue [5]"
cls
(Get-EventLog -LogName *).log | Out-File C:\Kruse\18f-BB_EL-Verbose-1.txt
$VerboseMessage = Get-Content C:\Kruse\18f-BB_EL-Verbose-1.txt
Write-Verbose -Message "$VerboseMessage" -Verbose 6>&1
Remove-Item -Path C:\Kruse\18f-BB_EL-Verbose-1.txt
Clear-Variable VerboseMessage
Write-Verbose -Message "Wait a minute its sideways!?!?
Get-content has a 'Parameter called -Raw.  When we use it, the message in the verbose command matches .txt file output'" -Verbose 6>&1
Read-Host "Press any key to continues"
cls
(Get-EventLog -LogName *).log | format-list * | Out-File C:\Kruse\18f-BB_EL-Verbose-1.txt
$VerboseMessage = Get-Content -Raw C:\Kruse\18f-BB_EL-Verbose-1.txt
Write-Verbose -Message "$VerboseMessage" -Verbose 6>&1
Clear-Variable VerboseMessage
Write-Verbose -Message "Yhaoo we did it! This is how:" -Verbose *>&1
read-host "Press any key to continue[6]"
Write-Verbose -Message "The following explains how we achieved our goal
(Get-EventLog -LogName *).log | Format-List * | Out-File C:\Kruse\18f-BB_EL-Verbose-1.txt
By Setting the variable VerboseMessage = Get-Content -Path C:\Kruse\18f-BB_EL-Verbose-1.txt" -Verbose 6>&1
Write-Verbose -Message "We used [Out-file] to save the output of the [(Get-EventLog -LogName *).log in a .txt file]
Then we set the variable $VerboseMesage equal to [Get-Content -path 'C:\Kruse\18f-BB_EL-Verbose-1.txt'
Now we will enter $verbose message into the [Write Verbose] command

This way if I want something different, I can use a different property name after the rightmost parthense of the (Get-EventLog -LogName *)
I only have to change a few characters and I get a different 'Property' set
Now we will return the 'Log Property' and the 'LogDisplayName Property'
Note: I remove the .txt file and the directory I created after the Verbose message is Deleted" -Verbose 6>&1
Read-Host "Press any key to continue[7]"
(Get-EventLog -LogName *).log | Out-File C:\Kruse\18f-BB_EL-Verbose-1.txt
(Get-EventLog -LogName *).LogDisplayName | Out-File C:\Kruse\18f-BB_EL-Verbose-2.txt
$VerboseMessage1 = Get-Content -Raw C:\Kruse\18f-BB_EL-Verbose-1.txt
$VerboseMessage2 = Get-Content -Raw C:\Kruse\18f-BB_EL-Verbose-2.txt
Write-Verbose -Message "LogParameter:
$VerboseMessage1
LogDisplayNameParameter:
$VerboseMessage2" -Verbose 6>&1
Remove-Item -Path C:\Kruse\18f-BB_EL-Verbose-1.txt
Remove-Item -Path C:\Kruse\18f-BB_EL-Verbose-2.txt
}
cls
Read-Host "Start This Example By Pressing Any Key[1]"
cls
opening
Read-host "Press any key to continue"
cls
Show-Possible_Input_For_Get-eventlog_-Logname
Read-Host "Here Is how I achieved showing input for Get-EventLog -Logname in a verbose message
Press Any Key To continue [2]"
cls
Show-How_I_used_write-Verbose_to-Display_Iputs_For_The_Event-Log_Parameter_-Logname
Write-Verbose -Message " The script is designed to remove the .txt files and the directorys "
Write-Verbose "Thanks for watching" -Verbose *>&1
Read-Host "End"
cls
$BB="MarkK.";$SD="2018-11-11";$PSV5="PowerShellVersion5";$XamplePurpose="Learn, Share and Document";$DJ="Save The Puppies! <3<3<3";$SP="<@:)";$TY="ThankYou For Your Help :)";$MK="UAA Alum, CMC Alum, CNT Student, PowerShell Enthusiast";$TFTSP_FWH="Founder of: The Foundation to Save The Puppies From Write-Host";$Mission="Spread Joy Through Learning PS5";$TFW="ThanksForWatching"
$MyFirstHashTableIsMyDigitalSignature=[Ordered]@{Name="Name: $BB";MarkK="MarkK.:$MK";Date="StarDate: $SD";PSVersion="PowerShellVersionUsed: $PSV5";
Xample="Prupose: $XamplePurpose";Thanks="$TY";TFTSP_FWH="$TFTSP_FWH";Mission="$mission";DJ="$DJ";TFW="$TFW";SP="$SP"}

Cls
Function Blue-Bomber
{
ForEach ($BlueBombersInfo in $MyFirstHashTableIsMyDigitalSignature) 
{
    Write-Verbose -Message ($BlueBombersInfo).Name      -Verbose 6>&1
    Write-Verbose -Message ($BlueBombersInfo).MarkK     -Verbose 5>&1
    Write-Verbose -Message ($BlueBombersInfo).Date      -Verbose 4>&1
    Write-Verbose -Message ($BlueBombersInfo).PSVersion -Verbose 3>&1
    Write-Verbose -Message ($BlueBombersInfo).Xample    -Verbose 2>&1
    Write-Verbose -Message ($BlueBombersInfo).Thanks    -Verbose *>&1
    Write-Verbose -Message ($BlueBombersInfo).TFTSP_FWH -Verbose 2>&1
    Write-Verbose -Message ($BlueBombersInfo).Mission   -Verbose 3>&1
    Write-Verbose -Message ($BlueBombersInfo).DJ        -Verbose 4>&1
    Write-Verbose -Message ($BlueBombersInfo).TFW       -Verbose 5>&1
    Write-Verbose -Message ($BlueBombersInfo).SP        -Verbose 6>&1
}
}
cls
Blue-Bomber

#Show-Possible_Input_For_Get-eventlog_-Logname
#https://support.microsoft.com/en-us/help/12445/windows-keyboard-shortcuts

