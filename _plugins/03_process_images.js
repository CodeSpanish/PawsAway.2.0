const fs = require("fs");
const path = require("path");
const sharp = require("sharp");

// Get source, output directories, and thumbnail size from arguments
const [sourceDir, outputDir, thumbnail_width, thumbnail_height] =
  process.argv.slice(2);

if (!sourceDir || !outputDir || !thumbnail_width || !thumbnail_height) {
  console.error(
    "Usage: node process_images.js <sourceDir> <outputDir> <thumbnail_width> <thumbnail_height>"
  );
  process.exit(1);
}

const width = parseInt(thumbnail_width, 10);
const height = parseInt(thumbnail_height, 10);

if (isNaN(height) || isNaN(width)) {
  console.error("Thumbnail size must be a valid number.");
  process.exit(1);
}

// Ensure the output directory exists
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir, { recursive: true });
}

// Process images
fs.readdir(sourceDir, (err, files) => {
  if (err) {
    console.error("Error reading source directory:", err);
    process.exit(1);
  }

  console.log(`Processing width:${width} height:${height}`);

  files.forEach((file) => {
    const inputPath = path.join(sourceDir, file);
    const outputPath = path.join(outputDir, file);

    // Check file extension to process only images
    if (/\.(jpe?g|png|webp|tiff|gif)$/i.test(file)) {
      sharp(inputPath)
        .resize(width, height) // Use dynamic size
        .toFile(outputPath)
        .then(() => console.log(`Processed: ${file}`))
        .catch((err) => console.error(`Error processing ${file}:`, err));
    }
  });
});
