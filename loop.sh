v_config_file=$1
echo "config file : " $v_config_file

while IFS= read -r cmd
do
	echo "Executing : " $cmd
	`./youtubeDowload.sh -e $cmd` 
done < "$v_config_file"


