require 'fileutils'

Jekyll::Hooks.register :site, :pre_render do |site|
  source_dir = File.join(site.source, "content/snippets")
  dest_dir = File.join(site.source, "_includes/snippets")

  # Ensure the destination directory exists
  FileUtils.mkdir_p(dest_dir)

  # Copy all files from the source to the destination
  FileUtils.cp_r(Dir["#{source_dir}/*"], dest_dir)

  Jekyll.logger.info "Pre-Build: Snippets copied from #{source_dir} to #{dest_dir}"
end
