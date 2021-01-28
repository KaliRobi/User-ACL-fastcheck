
################################################################################ POSERSHELL ASSEMBLE  ######################################################################

Set-ExecutionPolicy bypass
$ErrorActionPreference = "SilentlyContinue"
Add-Type -assembly System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")


##############################################################################MAIN FORM #################################################################################


#creting the from 
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='FastCheck1.0'
$main_form.Width = 700
$main_form.Height = 650
$main_form.AutoSize = $true
#$label1


##############################################################################Firs Block #################################################################################


#LABEL1 FOR THE DISPLAYNAME

$Label1 = New-Object System.Windows.Forms.Label
$Label1.Text = "name"
$Label1.Location  = New-Object System.Drawing.Point(0,10)
$Label1.AutoSize = $true
$main_form.Controls.Add($Label1)



#TEXTBOX1 FOR THE DISPLAYNAME(INSTERT NAME)

$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Width = 300
$textbox1.text = ""
$textBox1.Location  = New-Object System.Drawing.Point(50,10)
$main_form.Controls.Add($textBox1)



#LABEL2 FOR THE FIRST POSSIBLE DOMAIN

$Label2= New-Object System.Windows.Forms.Label
$Label2.Text = "domain1"
$Label2.Location  = New-Object System.Drawing.Point(160,30)
$Label2.AutoSize = $true
$main_form.Controls.Add($Label2)


#TEXTBOX2 FOR THE FIRST POSSIBLE DOMAIN (INSERT DOMAIN)

$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Width = 300
$textbox2.text = ""
$textBox2.Location  = New-Object System.Drawing.Point(210,30)
$main_form.controls.add($textBox2)



#LABEL3 FOR THE SECOND POSSIBLE DOMAIN                       
$Label3 = New-Object System.Windows.Forms.Label
$Label3.Text = "domain2"
$Label3.Location  = New-Object System.Drawing.Point(160,50)
$Label3.AutoSize = $true
$main_form.Controls.Add($Label3)


#TEXTBOX3 FOR THE SECOND POSSIBLE DOMAIN (INSTER DOMAIN)
$textBox3 = New-Object System.Windows.Forms.TextBox
$textBox3.Width = 300
$textbox3.text = "tevacorp"
$textBox3.Location  = New-Object System.Drawing.Point(210,50)
$main_form.Controls.add($textBox3)

##########################################################################################SECOND BLOCK#################################################################

#label8 for the userName
$Label8 = New-Object System.Windows.Forms.Label
$Label8.Text = "userName"
$Label8.Location  = New-Object System.Drawing.Point(350,10)
$Label8.AutoSize = $true
$main_form.Controls.Add($Label8)


#textbox8 for the UserName
$textBox8 = New-Object System.Windows.Forms.TextBox
$textBox8.Width = 200
$textbox8.text = ""
$textBox8.Location  = New-Object System.Drawing.Point(410,10)
$main_form.Controls.Add($textBox8)


##################################################################################THIRD BLOCK#####################################################################


#LABLE 6 
$Label6 = New-Object System.Windows.Forms.Label
$Label6.Text = "fullPath"
$Label6.Location  = New-Object System.Drawing.Point(0,300)
$Label6.AutoSize = $true
$main_form.Controls.Add($Label6)

#TEXTBOX6 returns  THE RESULT OF THE SECGROUP SEARCH
$textBox6 = New-Object System.Windows.Forms.TextBox
$textBox6.Width = 600
$textbox6.text = ""
$textBox6.Location  = New-Object System.Drawing.Point(50,300)
$main_form.Controls.Add($textBox6)


##################################################################################### RESULTS FILED################################################################# 


#LABEL4 returns THE RESULT ID THE USER IS ON THE FIRST DOMAIN
$Label4 = New-Object System.Windows.Forms.label
$Label4.Text = ""
$label4.BackColor = [System.Drawing.Color]::FromName("white")
$Label4.Location  = New-Object System.Drawing.Point(50,100)
$Label4.AutoSize = $false
$label4.width = 280
$label4.height = 180
$main_form.Controls.Add($Label4)



#LABEL7 returns THE RESULT OF THE ACL CHECK 
$Label7 = New-Object System.Windows.Forms.textBox
$Label7.Text = ""
$label7.width = 600
$label7.Height = 250
$label7.Location  = New-Object System.Drawing.Point(50,350)
$label7.AutoSize = $true
$label7.MultiLine = $True 
$label7.ScrollBars = "Vertical" 
$main_form.Controls.Add($Label7)

 ##########################################################################BUTTONS ############################################################################################### 

#BUTTON FOR THE NAMECHECK
$button = new-object system.windows.forms.button
$button.location =  New-Object System.Drawing.Point(70,70)
$button.width = 100
$button.text = "Show Account"
$main_form.controls.add($button) 


#BUTTON4 FOR THE USERNAMECHECK 

$button3 = new-object system.windows.forms.button
$button3.location =  New-Object System.Drawing.Point(425,70)
$button3.width = 110
$button3.text = "userNameAccount"
$main_form.controls.add($button3) 


#BUTTON5 FOR THE USERGROUPCHECK

$button6 = new-object system.windows.forms.button
$button6.location =  New-Object System.Drawing.Point(425,100)
$button6.width = 110
$button6.text = "User's ADgroups"
$main_form.controls.add($button6) 


#BUTTON2 FOR THE GETACL

$button2 = new-object system.windows.forms.button
$button2.location =  New-Object System.Drawing.Point(70,325)
$button2.text = "Get-SecGroups"
$button2.Width = 100
$main_form.controls.add($button2) 


#BUTTON4 FOR THE TESTACL

$button4 = new-object system.windows.forms.button
$button4.location =  New-Object System.Drawing.Point(180,325)
$button4.text = "Test-Path"
$button4.Width = 100
$main_form.controls.add($button4) 







##############################################################################BUTTON ACTIONS########################################################################################

########## name check

 
 $button.Add_Click(

 {$name = $textbox1.text
   $dom1 = $textbox2.text
   $dom2 = $textbox3.text
   $ErrorActionPreference = "SilentlyContinue"
   
 
 $Label4.Text =  if( get-aduser -server $dom1 -f{name -like $name}) {get-aduser -server $dom1 -f{name -like $name} -properties * | select msRTCSIP-PrimaryUserAddress, SamAccountName, mail, lockedout, enabled,  passwordexpired, passwordlastset, lastLogonDate, PrimaryGroup | fl | out-string } 
 else {get-aduser -server $dom2 -f{name -like $name} -properties * | select msRTCSIP-PrimaryUserAddress, SamAccountName, mail, lockedout, enabled,  passwordexpired, passwordlastset, lastLogonDate,    PrimaryGroup | fl | out-string } 
 


});



$button3.Add_Click(

 {$userName = $textbox8.text
  $dom1 = $textbox2.text
  $dom2 = $textbox3.text
  $ErrorActionPreference = "SilentlyContinue"
   
 
$Label4.Text = if( get-aduser -server $dom1 -f{SamAccountName -like $userName}) {get-aduser -server $dom1 -f{SamAccountName -like $userName} -properties * | select msRTCSIP-PrimaryUserAddress, SamAccountName, mail, lockedout, enabled,  passwordexpired, passwordlastset, lastLogonDate, PrimaryGroup | fl | out-string } 
 else {get-aduser -server $dom2 -f{SamAccountName -like $userName} -properties * | select msRTCSIP-PrimaryUserAddress, SamAccountName, mail, lockedout, enabled,  passwordexpired, passwordlastset, lastLogonDate,    PrimaryGroup | fl | out-string } 
 

})


##### THIS WILL LIST ALL THE GROUPS OF THE USER BY USERNAME
$button6.Add_Click(

 {$userName = $textbox8.text   
 $dom1 = $textbox2.text
 $dom2 = $textbox3.text
 $ErrorActionPreference = "SilentlyContinue"
   
 
  
 if(get-aduser -server $dom1 -f{SamAccountName -like $userName}) {get-aduser -server $dom1 -f{SamAccountName -like $userName} -pro * | select MemberOf | % {$_.Psobject.properties.value} |Out-gridview }
 else { get-aduser -server $dom2 -f{SamAccountName -like $userName} -pro *  | select memberOf | % {$_.Psobject.properties.value} |Out-gridview  }
  
  
 })


 



#USERNAME CHECK








$button2.Add_Click(

 {$path = $textbox6.text
   
   
 
 $Label7.Text = get-acl $path | select access  | % {$_.psobject.properties.value} | select IdentityReference, FileSystemRights | out-string     
 


})


$button4.add_click({
$path = $textbox6.text

$Label7.Text = test-path $path




})



$main_form.showdialog() 





