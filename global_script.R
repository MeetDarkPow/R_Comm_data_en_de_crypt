library(cyphr)
library(sodium)

k <- sodium::keygen()

key <- cyphr::key_sodium(k)

encrypt_file("rugs.rds", key, "temp_encrypted.gpg")

decrypt_file("temp_encrypted.gpg", key, "temp_rugs.rds")

data <- readRDS("temp_rugs.rds")