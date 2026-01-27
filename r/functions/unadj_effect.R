unadj_effect <- function(dat,
                         outcome,
                         predictors,
                         family = "logistic",
                         level = 0.95,
                         rounding = 2,
                         paste_CI = TRUE) {
  N <- vector("double", length(predictors))
  OR <- vector("double", length(predictors))
  CI_L <- vector("double", length(predictors))
  CI_U <- vector("double", length(predictors))
  predictor <- vector("double", length(predictors))

  for (i in 1:length(predictors)) {
    data <- dat %>% dplyr::select(
      all_of(outcome),
      all_of(unlist(strsplit(predictors[i], "\\*")))
    )
    data <- na.omit(data)

    N[i] <- nrow(data)

    formula <- paste0(outcome, " ~ ", predictors[i])

    if (family == "logistic") {
      suppressMessages(suppressWarnings({
        model <- glm(formula, data = data, family = "binomial"(link = "logit"))
        OR[i] <- exp(coef(model)[length(coef(model))])
        CI_L[i] <- exp(confint(model, level = level)[length(coef(model)), ])[1]
        CI_U[i] <- exp(confint(model, level = level)[length(coef(model)), ])[2]

        predictor[i] <- names(coef(model)[length(coef(model))])
        
        if(paste_CI){
        result <- data.frame(
          predictor,
          OR = paste0(
            round(OR, rounding), " [", round(CI_L, rounding), ", ",
            round(CI_U, rounding), "]"
          ),
          N
        )
        } else {
          result <- data.frame(
            predictor, OR, CI_L, CI_U, N
          )
        }
      }))
    } else if (family == "gaussian") {
      suppressMessages(suppressWarnings({
        model <- lm(formula, data = data)
        OR[i] <- coef(model)[length(coef(model))]
        CI_L[i] <- confint(model, level = level)[length(coef(model)), ][1]
        CI_U[i] <- confint(model, level = level)[length(coef(model)), ][2]

        predictor[i] <- names(coef(model)[length(coef(model))])
        
        if(paste_CI){
        result <- data.frame(
          predictor,
          effect = paste0(
            round(OR, rounding), " [", round(CI_L, rounding), ", ",
            round(CI_U, rounding), "]"
          ),
          N
        )} else {
          result <- data.frame(
            predictor, effect = OR, CI_L, CI_U, N
          )
        }
      }))
    } else {
      stop("incorrect family specification", call. = FALSE)
    }
  }

  return(result)
}