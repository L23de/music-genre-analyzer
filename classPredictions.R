# Make function
predictive_values <- function(actual_val, predicted, verbose=FALSE){
  # Get classes from values
  options <- sort(unique(actual_val))
  
  # Get length of those values
  class_len <- length(options)
  
  # Print those numbers out if verbose
  if (verbose){
    print(options)
    print(class_len)
  }
  
  # Totals are 0
  total_recall = 0
  total_precision = 0
  total_acc = 0
  
  # Iterate through the different classes
  for(val in options){
    # Convert vectors into predictions and actual values for just one class
    pred <- predicted == val
    actual <- actual_val == val
    
    # Make and print the confusion matrix, if verbose
    confusion_matrix <- table(actual, pred)
    if (verbose){
      print(confusion_matrix)
    }
  
    # Convert confusion matrix into predictive values
    confusion_vec <- as.vector(confusion_matrix)
    TN <- confusion_vec[1]
    FN <- confusion_vec[2]
    FP <- confusion_vec[3]
    TP <- confusion_vec[4]
    
    # Calculate precision, recall
    precision <- TP / (TP + FP)
    recall <- TP / (TP + FN)
    acc <- (TP + TN) + (TP + TN + FP + FN)

    # Print those values if verbose
    if (verbose){
        print(paste(c("Genre #: ",val, "Precision:", precision, "Recall:", recall)))
    }

    # Add to the total
    total_precision <- total_precision + precision
    total_recall <- total_recall + recall
    total_acc <- total_acc + acc
  }
  
  # Calculate averages
  avg_recall <- total_recall / class_len
  avg_precision <- total_precision / class_len
  avg_acc <- total_acc / class_len
  
  # Print out results
  print(paste(c(cat("Total Over", class_len, "Genres ==>\n"), cat("Accuracy:", avg_acc,"\n"), cat("Avg Precision:", avg_precision, "\n"), cat("Avg Recall:", avg_recall, "\n"))))
}

# predictive_values(c(1,2,3,4), c(1,2,3,4), verbose=FALSE)
