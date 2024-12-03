require 'fileutils'

Jekyll::Hooks.register :site, :post_write do |site|
  
  # Directory to clean up .md files
  target_dir = File.join(site.source, "_posts")
  FileUtils.rm_rf(target_dir)

  Jekyll.logger.info "Post-Build: Removing .md files from #{target_dir}"

  # Directory to clean up .md files
  target_dir = File.join(site.source, "_includes/snippets")
  FileUtils.rm_rf(target_dir)

  Jekyll.logger.info "Post-Build: Removing .md files from #{target_dir}"

end