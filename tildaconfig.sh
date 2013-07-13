# Creates 11 copies of the file config_0 that tilda uses.

for i in {1..11}; do
    rm ~/.tilda/config_$i
    cp ~/.tilda/config_0 ~/.tilda/config_$i
done
