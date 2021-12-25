library(cyphr)
library(sodium)

# creating a key.
k <- sodium::keygen()
key <- cyphr::key_sodium(k)


# saving key.
# saveRDS(key, "key.rds")
# rm(key)


# reading key for encrypted file.
key <- readRDS("key.rds")


# initial encrypting the csv file.
# temp_data <- read.csv("usergroups/data/rugs_delete.csv")
# saveRDS(temp_data, file = "rugs.rds")
# encrypt_file("rugs.rds", key, "Data/R_comm_data_encrypted.gpg")


# decryption of the gpg file "R_comm_data_encrypted.gpg".
decrypt_file("Data/R_comm_data_encrypted.gpg", key, "temp_rugs.rds")
old_data <- readRDS("temp_rugs.rds")


# getting new data (FOR TESTING PURPOSE ONLY TAKING THE PREVIOUS DATASET ITSELF TO MERGE INTO THE MAIN FILE)
new_data <- readRDS("temp_rugs.rds")


# merging old and new data
updated_data <- rbind(old_data, new_data)
saveRDS(updated_data, file = "updated_rugs_delete.rds")


# updating the stored encrypted file
encrypt_file("updated_rugs_delete.rds", key, "Data/R_comm_data_encrypted.gpg")


# removing temp rds file
unlink("updated_rugs_delete.rds")
unlink("temp_rugs.rds")

