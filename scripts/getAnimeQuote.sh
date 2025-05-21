# Cron script to periodically fetch new anime quotes from API and set as the MOTD

DATA=$(curl -s https://api.animechan.io/v1/quotes/random)

QUOTE=$(echo $DATA | jq -r .data.content)
ANIME=$(echo $DATA | jq -r .data.anime.altName)
CHAR=$(echo $DATA | jq -r .data.character.name)

echo "> ${QUOTE}\\n \t - \t ${CHAR}, ${ANIME}" | glow > /etc/motd
