library(sodium)

# creating a key.
# key_file <- "key.rds"
# key <- keygen()


# saving key.
# saveRDS(key, key_file)


# reading key for encrypted file.
key <- readRDS("key.rds")


# initial encrypting the csv file.
# temp_data <- read.csv("usergroups/data/rugs_delete.csv")
# saveRDS(temp_data, file = "rugs.rds")
# old_data <- readRDS("rugs.rds")
# serialized_msg <- serialize(old_data, NULL)
# encr <- data_encrypt(serialized_msg, key)
# saveRDS(encr, "Data/encryption.rds")


# decryption of the file "encryption.rds".
old_encrypted_data <- readRDS("Data/encryption.rds")
old_data <- unserialize(data_decrypt(old_encrypted_data, key))


# getting new data ///*** (FOR TESTING PURPOSE ONLY TAKING THE PREVIOUS DATASET ITSELF TO MERGE INTO THE MAIN FILE) ***\\\
new_data <- old_data


# merging old and new data
updated_data <- rbind(old_data, new_data)


# updating the stored encrypted file
updated_serialized_msg <- serialize(updated_data, NULL)
updated_encr <- data_encrypt(updated_serialized_msg, key)
saveRDS(updated_encr, "Data/encryption.rds")

