# Script to add cron job entry in host crontab. It executes cron.php in
# nextcloud docker image

JOB_INTERVAL=5

crontab -l > ./tmpcron

echo -e "\n#@# Nextcloud cron job \n*/$JOB_INTERVAL * * * * docker exec -u www-data nextcloud php -f cron.php" >> ./tmpcron

crontab ./tmpcron
rm ./tmpcron
crontab -l

