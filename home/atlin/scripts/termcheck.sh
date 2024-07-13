echo "Powerline Bubbles:"
echo -e "\033[38;5;231;48;5;245m          \033[0m"
echo -e "\033[38;5;231;48;5;245m \033[38;5;245;48;5;231m TEXT \033[38;5;231;48;5;245m \033[0m"
echo -e "\033[38;5;231;48;5;245m          \033[0m"
echo "Powerline Slant:"
echo -e "\033[38;5;231;48;5;245m          \033[0m"
echo -e "\033[38;5;231;48;5;245m \033[38;5;245;48;5;231m TEXT \033[38;5;231;48;5;245m \033[0m"
echo -e "\033[38;5;231;48;5;245m          \033[0m"

echo ""

echo "Attrs:"
echo -e "\e[1mbold\e[0m"
echo -e "\e[3mitalic\e[0m"
echo -e "\e[3m\e[1mbold italic\e[0m"
echo -e "\e[4munderline\e[0m"
echo -e "\e[9mstrikethrough\e[0m"
echo -e "\e[31mHello World\e[0m"

echo ""

echo "Colors:"

# The test text
T="gYw"
echo -e "                40m   41m   42m   43m   44m   45m   46m   47m";

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG $T \033[0m";
  done
  echo;
done
echo
