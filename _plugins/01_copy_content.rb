require 'fileutils'

# Define a helper function to copy files from source to destination
def copy_files(source_dir, dest_dir)
  # Ensure the destination directory exists and clean it
  FileUtils.rm_rf(dest_dir)
  FileUtils.mkdir_p(dest_dir)

  # Copy all files from the source to the destination
  FileUtils.cp_r(Dir["#{source_dir}/*"], dest_dir)
end

Jekyll::Hooks.register :site, :after_init do |site|
  Jekyll.logger.info "Pre-Build: Starting file copy operations"

  # Define the source and destination pairs
  paths = [
    { source: File.join(site.source, "content/snippets"), dest: File.join(site.source, "_includes/snippets") },
    { source: File.join(site.source, "content/_authors"), dest: File.join(site.source, "_authors") },
    { source: File.join(site.source, "content/posts"), dest: File.join(site.source, "_posts") },
    { source: File.join(site.source, "node_modules/@fortawesome/fontawesome-free/webfonts"), dest: File.join(site.source, "assets/fonts") }
  ]

  # Loop through each pair and perform the copy operation
  paths.each do |path|
    Jekyll.logger.info "Pre-Build: Copying from #{path[:source]} to #{path[:dest]}"
    copy_files(path[:source], path[:dest])
  end

  Jekyll.logger.info "Pre-Build: File copy operations completed"
end
