mod1=lm(Final~Midterm,data=MidtermFinal)
MidFin_with_pred <- data.frame(MidtermFinal, predict(mod1, interval = 'prediction'))

gf_point(Final ~ Midterm, data=MidFin_with_pred) %>%
  gf_smooth(method = "lm") %>%
  gf_smooth(method = "lm", fill = ~"Confidence", alpha = 0.5, level = .95, se = TRUE) %>%
  gf_ribbon(lwr + upr ~ Midterm, fill = ~"Prediction",alpha = 0.2) %>%
  gf_refine(scale_fill_manual("Interval",values = c("green", "blue"))) %>%
  gf_theme(legend.position=c(.25, .85))