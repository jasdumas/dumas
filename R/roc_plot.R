#' ROC Curve for AUC Metric
#' Produce a ROC curve
#' @param model a object of class model (glm, lm, etc...)
#' @param test_data a object for the test data
#' @param test_label a object for the test label
#' @import ROCR
#' @return a data visualization depicting the AUC and baseline
#' @export
#'
roc_plot <- function(model, test_data, test_label, ...){
  prob <- predict(model, test_data)
  pred <- prediction(prob, test_label)
  perf <- performance(pred, measure = "tpr", x.measure = "fpr")
  auc <- performance(pred ,measure = "auc")
  auc <- auc@y.values[[1]]
  roc.data <- data.frame(fpr=unlist(perf@x.values),
                         tpr=unlist(perf@y.values),
                         model="GLM")
  ggplot(roc.data, aes(x=fpr, ymin=0, ymax=tpr)) +
    geom_ribbon(alpha=0.2) +
    geom_line(aes(y=tpr)) +
    geom_abline(intercept = 0, color = "dodgerblue") +
    ggtitle(paste0("ROC Curve with AUC = ", auc))

}

