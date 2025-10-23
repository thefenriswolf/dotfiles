for i in $(nix-store --query --requisites /run/current-system | grep "mbedtls-2.28.10")
do
  nix why-depends --all /run/current-system $i
done
