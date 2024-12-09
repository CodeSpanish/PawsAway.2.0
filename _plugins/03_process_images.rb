require 'open3'
require 'fileutils'

# Hook into the post_write lifecycle
Jekyll::Hooks.register :site, :post_write do |site|
  # Fetch configuration values
  config = site.config['image_processing'] || {}
  image_dir = File.join(site.source, config['source_dir'] ) # Default to 'images'
  output_dir = File.join(site.dest, config['output_dir'] ) # Default to 'images-thumbnails'
  thumbnail_width = config['thumbnail_width'] || 200 # Default size
  thumbnail_height = config['thumbnail_height'] || 200 # Default size

  # Ensure the output directory exists
  FileUtils.mkdir_p(output_dir)

  # Path to the Node.js script
  node_script = File.join(site.source, '_plugins/03_process_images.js')

  # Command to execute the Node.js script
  command = "node #{node_script} #{image_dir} #{output_dir} #{thumbnail_width} #{thumbnail_height}"
  stdout, stderr, status = Open3.capture3(command)

  if status.success?
    Jekyll.logger.info("Image Processing Complete:", stdout.strip)
  else
    Jekyll.logger.error("Image Processing Error:", stderr.strip)
  end
end
