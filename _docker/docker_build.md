# Login to docker

docker login --username {{your_user_name}} --password {{your_personal_access_token}} ghcr.io

# Build the Docker image

docker build -t ghcr.io/your-github-username/custom-jekyll-image:latest .

# Log in to GitHub Container Registry (GHCR)

echo ${{ secrets.GITHUB_TOKEN }} | docker login ghcr.io -u ${{ github.actor }} --password-stdin

# Push the image to GHCR

docker push ghcr.io/your-github-username/custom-jekyll-image:latest

# Test the docker with

docker run \
 -v ${{ github.workspace }}:/srv/jekyll -v ${{ github.workspace }}/_site:/srv/jekyll/_site \
  your-docker-image:latest /bin/bash -c "\
    chmod -R 777 /srv/jekyll && \
    bundle config set path 'vendor/bundle' && \
    bundle install && \
    PATH=$PATH:/usr/local/bin && \
 bundle exec jekyll build --future --baseurl \"${{ steps.pages.outputs.base_path }}\""

# In the GitHub Action Yaml refer to the docker as below

-v ${{ github.workspace }}:/srv/jekyll -v ${{ github.workspace }}/\_site:/srv/jekyll/\_site \
ghcr.io/your-github-username/custom-jekyll-image:latest /bin/bash -c "\
