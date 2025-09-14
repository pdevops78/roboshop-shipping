source /data/secrets.txt
cat /data/secrets.txt

if [ -z "${CART_ENDPOINT}" ]; then
  echo "Environment variable is missing"
  exit 1;
fi
if [ -z "${DB_HOST}" ]; then
  echo "Environment variable is missing"
  exit 1;
fi

java -jar /app/shipping.jar