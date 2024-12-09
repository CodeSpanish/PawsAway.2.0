require 'fileutils'

Jekyll::Hooks.register :site, :post_write do |site|
  if site.config['serving']
    Jekyll.logger.info "Post-Build: Skipping file removal for 'jekyll serve'"
  else
    Jekyll.logger.info "Post-Build: Performing cleanup"

    # Cleanup directories
    cleanup_directory(site, "_posts")
    cleanup_directory(site, "_includes/snippets")
  end
end

def cleanup_directory(site, relative_path)
  target_dir = File.join(site.source, relative_path)

  if Dir.exist?(target_dir)
    FileUtils.rm_rf(target_dir)
    Jekyll.logger.info "Post-Build: Removed files from #{target_dir}"
  else
    Jekyll.logger.warn "Post-Build: Directory #{target_dir} does not exist. Skipping."
  end
end