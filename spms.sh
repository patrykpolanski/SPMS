#!/bin/bash
while [ "$action" != "8" ] ; do
echo  "------------SIMPLE PROCESESS MANAGEMENT SCRIPT------------"
echo "What would you like to do?
1. All users processes
2. All users processes (sort by RAM usage)
3. All users processes (sort by CPU usage)
4. Top RAM usage process
5. Top CPU usage process
6. Search for process"
echo -e "7. \033[1;31mKill process\033[0m
8. Exit
-----------------------------------------------------"
read action
   case $action in
	1)
	  ps -A
	  ;;
	2)
	  ps -A -o pid,user,%mem,command | sort -b -k 3 -r
	  ;;
	3)
	  ps -A -r -o pid,user,%cpu,command 
	  ;;
	4)
	  ps -A -o pid,user,%mem,command | sort -b -k 3 -r | head -n 1
	  ;;
	5)
	  ps -A -r -o pid,user,%cpu,command | head -n 2
	  ;;
	6)
	  echo "Search for process name"
	  read name
          ps -A -o pid,user,command | grep -i $name
	  ;;
	7)
	  echo "PID of the process you would like to kill (signal 9)"
	  read id
	  kill -s 9 $id
	  ;;
	8)
	  exit
          ;;
	*) ;;
   esac
done
