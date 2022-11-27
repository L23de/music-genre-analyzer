# Source of the code : https://github.com/WandeRum/multiROC

# The function
make_roc <- function(class_prob_predictions, test_df, model_name){
  # convert the predictions to a data frame
  predictions_prob <- data.frame(class_prob_predictions)
  
  # Make a data frame out of the genre
  true_label <- data.frame(test_df$genre == 1, test_df$genre == 2, test_df$genre == 3, test_df$genre == 4, test_df$genre == 5, test_df$genre == 6, test_df$genre == 7)
  
  # Hack to transform FALSE to 0 and TRUE to 1
  true_label <- true_label * 1
  
  # Merge the two dataframes
  merged <- cbind(true_label, predictions_prob)
  
  # Give them the correct column names
  colnames(merged) <- c("S1_true", "S2_true", "S3_true", "S4_true", "S5_true", "S6_true", "S7_true", "S1_pred_log", "S2_pred_log", "S3_pred_log", "S4_pred_log", "S5_pred_log", "S6_pred_log", "S7_pred_log")
  
  # Do the multi roc analysis
  roc_res <- multi_roc(merged, force_diag=T)
  plot_roc_df <- plot_roc_data(roc_res)

  # Print AUC values
  print("AUC Values")
  print(unlist(roc_res$AUC))
  print("Average AUC Values")
  print(mean(as.vector(unlist(roc_res$AUC))))

  # Graph everything
  ggplot(plot_roc_df, aes(x = 1-Specificity, y=Sensitivity)) + ggtitle(model_name)  + geom_path(aes(color = Group, linetype=Method)) + geom_segment(aes(x = 0, y = 0, xend = 1, yend = 1), colour='grey', linetype = 'dotdash') + theme_bw() + theme(plot.title = element_text(hjust = 0.5), legend.justification=c(1, 0), legend.position=c(.95, .05), legend.title=element_blank(), legend.background = element_rect(fill=NULL, size=0.5, linetype="solid", colour ="black"))
}
