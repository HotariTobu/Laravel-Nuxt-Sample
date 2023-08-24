# Copy .env
cp .env.base .env

# Give scripts execute permission
chmod u+x backend/dev.sh
chmod u+x frontend/dev.sh

# Create containers
docker compose --profile backend --profile frontend create

# Initialize Laravel
# Use `docker cp` because the load of mount in Windows is large
docker create \
    --name tmp \
    composer \
    bash -c "cd /opt && composer install"
docker cp './backend/composer.json' 'tmp:/opt/composer.json'
if [[ -f './backend/composer.lock' ]]; then
    docker cp './backend/composer.lock' 'tmp:/opt/composer.lock'
fi
docker start -a tmp
docker cp 'tmp:/opt/vendor' './backend/vendor'
docker rm tmp

docker compose run --rm \
    api \
    bash -c "php artisan key:generate && php artisan migrate"

# Initialize Nuxt
docker create \
    --name tmp \
    node \
    bash -c "cd /opt && yarn"
docker cp './frontend/package.json' 'tmp:/opt/package.json'
if [[ -f './frontend/yarn.lock' ]]; then
    docker cp './frontend/yarn.lock' 'tmp:/opt/yarn.lock'
fi
docker start -a tmp
docker cp 'tmp:/opt/node_modules' './frontend/node_modules'
docker cp 'tmp:/opt/.nuxt' './frontend/.nuxt'
docker rm tmp

# Stop containers
docker compose --profile backend --profile frontend stop
