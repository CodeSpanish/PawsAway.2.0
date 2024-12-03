require 'fileutils'
require 'fileutils'

Jekyll::Hooks.register :site, :after_init do |site|

  # Copy snippets to _include
  Jekyll.logger.info "Pre-Build: Copying snippets to _includes"

  source_dir = File.join(site.source, "content/snippets")
  dest_dir = File.join(site.source, "_includes/snippets")

  # Ensure the destination directory exists and clean it
  FileUtils.rm_rf(dest_dir)
  FileUtils.mkdir_p(dest_dir)

  # Copy all files from the source to the destination
  FileUtils.cp_r(Dir["#{source_dir}/*"], dest_dir)

  # Copy content/posts to _posts
  Jekyll.logger.info "Pre-Build: Copying content/posts to _posts"

  source_dir = File.join(site.source, "content/posts")
  dest_dir = File.join(site.source, "_posts")

  # Ensure the destination directory exists and clean it
  FileUtils.rm_rf(dest_dir)
  FileUtils.mkdir_p(dest_dir)

  # Copy all files from the source to the destination
  FileUtils.cp_r(Dir["#{source_dir}/*"], dest_dir)

  Jekyll.logger.info "Pre-Build: posts and snippets copied"
end