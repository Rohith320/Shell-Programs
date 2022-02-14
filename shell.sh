# Shell-Programs
Simple programs on shell 

1.Write a script to find the greatest of three numbers (numbers passed as command line parameters)
  #!/bin/bash
  read -p &quot;Enter the number1: &quot; x
  read -p  &quot;Enter the number2: &quot; y
  read -p  &quot;Enter the number3: &quot; z
  if [ $x -gt $y ] &amp;&amp; [ $x -gt $z ]
  then
  echo &quot;$x is greater&quot;
  elif [ $y -gt $x ] &amp;&amp; [ $y -gt $z ]
  then
  echo &quot;$y is greater&quot;
  else
  echo &quot;$z is greater&quot;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2. Write a script to check whether the given no. is even/odd
  #!/bin/bash
  read -p &quot;Enter a number: &quot; i
  if [ `expr $i % 2` == 0 ]
  then
  echo &quot;The number is even&quot;
  else
  echo &quot;The number is odd&quot;
  fi


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. Write a script to calculate the average of n numbers.
  #!/bin/bash
  read -p &quot;Enter how many numbers you want?: &quot; x
  i=1
  sum=0
  echo &quot;Enter the Numbers one by one: &quot;
  while [ $i -le $x ]
  do
    read num           
    sum=$((sum + num)) 
    i=$((i + 1))
  done
  avg=`expr $sum / $i`
  printf &#39;%0.2f&#39; &quot;$avg&quot;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4. Write a script to check whether the given number is prime or not.
  #!/bin/bash
  read -p &quot;Enter a number: &quot; x
  flag=0
  i=2
  while test $i -le `expr $x / 2` 
  do
    if test `expr $x % $i` -eq 0 
    then
       flag=1
  fi
  i=`expr $i + 1`
  done
  if test $flag -eq 1 
  then
     echo &quot;It is not a Prime Number&quot;
  else
  echo &quot;It is a Prime Number&quot;
  fi
  

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
5. Write a script to check whether the given input is a number or a string.
  #!/bin/bash
  read -r -p &quot;Enter a string: &quot; str
     if [[ $str =~ ^[0-9]+$ ]];then
        echo &quot;Input contains number&quot;
     elif [[ $str =~ ^[a-zA-Z]+$ ]];then
        echo &quot;Input contains string&quot;
  fi

  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 6.  Write a script to compute no. of characters and words in each line of given file.
    #!/bin/bash
    wc -m /home/rohith/1.txt #The number of characters in a file
    wc -l /home/rohith/1.txt #The number of lines in a file 
  

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
 7.  Write a script to print the Fibonacci series up to n terms.
    #!/bin/bash
    read -p &quot;Enter the value of n: &quot; n
    x=0
    y=1
    echo &quot;The Fibonacci series is : &quot;   
    for (( i=0; i&lt;n; i++ ))
    do
        echo -n &quot;$x &quot;
        fib=$((x + y))
        x=$y
        y=$fib
    done
  
  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 8. Write a script to calculate the factorial of a given number.

    #!/bin/bash
    read -p &quot;Enter a Number: &quot; x
    fact=1
    for (( i=2; i&lt;=$x; i++))
    {
        fact=$((fact*i))
    }
    echo &quot;The factorial of&quot; $x &quot;is :&quot; $fact
  
 
 9.  Write a script to calculate the sum of digits of the given number
    #!/bin/bash
    read -p &quot;Enter a number: &quot; i
    length=`expr length $i`
    while [ $length -ne 0 ]
    do
     x=`expr substr $i $length 1`
     ans=`expr $ans + $x`
     length=`expr $length - 1`
    done
    echo &quot;Sum of Digits is : $ans&quot; 

  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
9.  Write a script to calculate the sum of digits of the given number
  #!/bin/bash
  read -p &quot;Enter a number: &quot; i
  length=`expr length $i`
  while [ $length -ne 0 ]
  do
   x=`expr substr $i $length 1`
   ans=`expr $ans + $x`
   length=`expr $length - 1`
  done
  echo &quot;Sum of Digits is : $ans&quot;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
10.   Write a script to check whether the given string is a palindrome.

    #!/bin/bash
    read -p &quot;Enter a string: &quot; s
    reverse=&quot;&quot;
    len=${#s}
    for (( i=$len-1; i&gt;=0; i-- ))
    do 
        reverse=&quot;$reverse${s:$i:1}&quot;
    done
    if [ &quot;$s&quot; = &quot;$reverse&quot; ]
    then
    echo &quot;The string is palindrome&quot;
    else
    echo &quot;The string is not palindrome&quot;
    fi
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a script to check whether the given string is a palindrome.

  #!/bin/bash
  read -p "Enter a string: " s
  reverse=""
  len=${#s}
  for (( i=$len-1; i>=0; i-- ))
  do
  reverse="$reverse${s:$i:1}"
  done
  if [ "$s" = "$reverse" ]
  then
  echo "The string is palindrome"
  else
  echo "The string is not palindrome"
  fi
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script that accepts a string from the terminal and echo a suitable message if it doesn’t have at least 5 characters including the other symbols.

  read -p "Enter a string: " str
  len=$(echo ${#str})
  if [ $len -lt 5 ]; then
  echo "$str doesn't have at least 5 characters"
  elif [ $len -eq 5 ]; then
  echo "$str has 5 characters"
  else
  echo "$str more than 5 characters"
  fi
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script to echo the string length of the given string as argument.

  read -p "Enter a string: " str
  len=$(echo ${#str})
  echo "$str has $len characters"
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script that accepts two directories’ names as arguments and deletes those files in the first directory which are similarly named in the second directly. Note:
Contents should also match inside the files.

      source="$1"
      dest="$2"
      if [ $# -ne 2 ]
      then
      echo "$(basename $0) dir1 dir2"
      exit 1
      fi
      if [ ! -d $src ]
      then
      echo "Directory $source does not exists!"
      exit 2
      fi

      if [ ! -d $dest ]
      then
      echo "Directory $dest does not exists!"
      exit 2
      fi
      for f in $dest/*
      do
      #echo Processing $f
      if [ -f $f ]
      then
      tFile="$source/$(basename $f)"
      if [ -f $tFile ]

      then
      echo -n "Deleting $tFile..."
      /bin/rm $tFile

      [ $? -eq 0 ] && echo "done" || echo "failed"

      fi
      fi
      done
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script to display the processes running on the system for every 30
seconds, but only for 3 times.

    echo "Display the process running on the system."
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^^"
    for ((i=0; i<3; i++)); do
    ps
    echo "^^^^^^^^^^^^^^^^^^^^^^^^^"
    sleep 3
    done
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script that displays the last modification time of any file.

  read -p "Enter a File name: " file
  if [ ! -f $file ]
  then
  echo "$file not a file"
  exit 1
  fi
  echo "$file was last modified on $(stat -c %x $file)"
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script to check the spellings of any text document given as an
argument.

    file="$1"
    # Path to ispell / spell command
    SPELL="/kodal/bin/ispell"
    # make sure argument is given to script
    if [ $# -eq 0 ]
    then
    echo "Syntax: $(basename $0) file"
    exit 1
    fi
    if [ ! -f $file ]
    then
    echo "Error - $file not a file!"
    exit 2
    fi
    # make sure ispell is installed
    if [ ! -x $SPELL ]
    then
    echo "Error - $SPELL binary file does NOT exists; cannot check the spellin
    gs of $file."
    exit 3
    fi
    # now check the spellings
    $SPELL $file
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Combine the above commands in a shell script so that you have a small program for
extracting a wordlist.

  read -p "Enter a File name: " file
  echo "The wordlist is: "
  grep -o -E '+\w+' $file | sort -u -f
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script which reads the contents in a text file and removes all the blank spaces in them and redirects the output to a file.

  cat Text.txt | tr -d "[:blank:]" > final.817
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script that changes the name of the files passed as arguments to lowercase.

      file="$1"
      if [ $# -eq 0 ]
      then
      echo "$(basename $0) file"
      exit 1
      fi
      if [ ! $file ]

      then
      echo "$file not a file"
      exit 2
      fi
      lowercase=$(echo $file | tr '[A-Z]' '[a-z]'])
      if [ -f $lowercase ]
      then
      echo "Error - File already exists!"
      exit 3
      fi
      # change file name
      /bin/mv $file $lowercase
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script to translate all the characters to lower case in a given text file.

  read -p "Enter a string: " file
  if [ ! -f $file ]
  then
  echo "$file not a file!"
  exit 1
  fi
  cat $file | tr '[A-Z]' '[a-z]'
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script to combine any three text files into a single file (append them in the order as they appear in the arguments) and display the word count.

  read -p "Enter name of first file: " file_1
  read -p "Enter name of second file: " file_2
  read -p "Enter name of third file: " file_3
  cat $file_1 $file_2 $file_3 >> 3files.txt
  wc -w 3files.txt
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script that, given a file name as the argument will write the even numbered line to a file with name even file and odd numbered lines to a file called odd file.

  awk '(NR%2)' Text.txt > Odd.txt
  awk '! (NR%2)' Text.txt > Even.txt
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script which deletes all the even numbered lines in a text file.

   awk '(NR%2)' Text.txt > Output.txt
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script like a more command. It asks the user’s name, the name of the file on command prompt and displays only the 15 lines of the file at a time on the screen.
Further, next 15 lines will be displayed only when the user presses the enter key / any other key.

    Code:
    lineno=1
    read -p "Enter a file name : " file
    if [ ! -f $file ]
    then
    echo "$file not a file!"
    exit 1
    fi
    exec 1<&0
    while read line
    do
    if [ $lineno -eq 15 ]
    then
    lineno=0
    read -u 1 -p "Press Enter to continue: "
    fi
    echo $line
    (( lineno++ ))
    done < $file
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell script that counts English language articles (a, an, the) in a given text file.
    Code:
    echo -n "Enter a file name : "
    read file
    a=0
    an=0
    the=0
    if [ ! -f $file ]
    then
    echo "$file not a file!"
    exit 1
    fi
    while read line
    do
    for w in $line
    do
    text="$(echo $w | tr '[A-Z]' '[a-z]')"
    [ $text = "a" ] && (( a++ )) || :
    [ $text = "the" ] && (( the++ )) || :
    [ $text = "an" ] && (( an++ )) || :
    done
    done < $file
    echo "a article occured $a times"
    echo "an article occured $an times"
    echo "the article occured $the times"
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write the shell script which will replace each occurrence of character c with the characters char in a string s. It should also display the number of replacements.

  echo "Enter a string(with c in it): "
  read s
  echo "Enter char to replace character c: "
  read chr
  echo "Original String: $s"
  echo "Replacement Char: $chr"
  replace=$(tr -dc '[cC]' <<<"$s" | wc -c )
  echo "No of Replacement : $replace"
  echo "Replaced String:-"
  echo "$s" | tr '[cC]' $chr
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Write a shell program to concatenate to two strings given as input and display the resultant string along with its string length. Write a shell program to simulate a simple calculator.


  #!/bin/bash
  str1="Sri Ramaswamy Memorial University"
  str2=" Amaravati"
  str3="$str1$str2"
  echo $str3
  echo "The length of the string is" ${#str3}
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SIMPLE CALCULATOR IN BASH
      echo "---------Simple Calculator---------"
      ch="y"
      read -p "Enter first number: " n1
      read -p "Enter second number: " n2
      while [ $ch = "y" ]
      do
      echo "please choose an operation"
      echo "1. Addition"
      echo "2. Substraction"
      echo "3. Divison"
      echo "4. Multiplication"
      read opr
      if [ $opr = "1" ]
      then
      echo "Addition of $n1 and $n2 is $((n1+n2))"
      elif [ $opr = "2" ]
      then
      echo "Subtraction of $n1 and $n2 is $((n1-n2))"
      elif [ $opr = "3" ]
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
