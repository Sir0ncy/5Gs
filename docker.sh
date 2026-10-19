docker ps --format '{{.ID}} {{.Names}} {{.Ports}}' | while read -r id name ports; do
    ip=
    printf %-20s %-15s %-30sn   
done

