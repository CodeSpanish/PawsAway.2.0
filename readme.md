## Steps used to set up this project

The steps below describe the high-level steps used to modify the project from a standard Jekyll installation

1. Installed PicoCss using npm

2. Installed FontAwesome using npm

3. Removed the /node_modules folder from source control using .gitignore

4. Reorganised content folders for storing all markdown files under the /content folder. The folder includes a subfolder /content/posts for blog posts and /content/snippets for small pieces of text that are repeatable. The intention is to provide a content editor with markdown knowledge access only to this folder in GitHub or other systems and keep any other type of files out of sight.

5. Created a Jekyll plugin to move posts from the /content/posts folder to the default \_post folder and /content/snippets to the \_include folder before building to take advantage of native Jellyl behaviour.

6. Created a plugin to remove the content copied to \_posts and \_includes/snippets after build to avoid this content being checked-in and having issues like the content stored in two different areas.

7. Created a secret key in GitHub to be used to build a custom docker and to be used at build time.

8. Created a customer Docker image to be executed by Github actions. The default Github Jekyll image to build pages does not support the latest Jekyll version and also doesn't run SaaS Dart, which is required to compile the latest SaSS version of PicoCSS.

9. Created a custom GitHub action to build and publish the site to GitHub pages when the master branch is checked in.

### How to generate a prod website

bundle exec jekyll serve --config \_config.yml

### How to generate a local website for testing

bundle exec jekyll serve --config \_config.dev.yml
