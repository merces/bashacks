bh_matrix()
{
	echo -e "\e[32m";
	while :; do
		printf '%*c' $(($RANDOM % 30)) $(($RANDOM % 2));
	done
}
