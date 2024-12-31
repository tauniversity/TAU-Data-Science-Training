# Load necessary libraries

install.load::install_load(c("utils", "archive"))

# List all zip and rar files in the working directory
zip_files <- fs::dir_ls(regexp = "*\\.zip")
rar_files <- fs::dir_ls(regexp = "*\\.rar")


# Function to handle extraction and deletion
extract_and_delete <- function(file, type) {
  if (type == "zip") {
    unzip(file, exdir = gsub("\\.zip$", "", file))  # Extract to a folder with the same name
  } else if (type == "rar") {
    archive_extract(file, dir = gsub("\\.rar$", "", file))  # Extract to a folder with the same name
  }
  file.remove(file)  # Delete the file after extraction
}

# Loop through each zip file
for (zip_file in zip_files) {
  extract_and_delete(zip_file, "zip")
}

# Loop through each rar file
for (rar_file in rar_files) {
  extract_and_delete(rar_file, "rar")
}

print("All zip and rar files have been extracted and deleted.")