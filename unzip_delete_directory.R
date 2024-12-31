# Load necessary library
if (!requireNamespace("utils", quietly = TRUE)) {
  install.packages("utils")
}


# List all zip files in the working directory
zip_files <- list.files(pattern = "*.zip")

# Loop through each zip file
for (zip_file in zip_files) {
  # Unzip the file
  unzip(zip_file, exdir = gsub("\\.zip$", "", zip_file))  # Extract to a folder with the same name
  
  # Delete the zip file after unzipping
  file.remove(zip_file)
}

print("All zip files have been extracted and deleted.")