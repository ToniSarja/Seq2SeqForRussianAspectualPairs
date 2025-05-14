library(lattice)
library(lme4)
library(emmeans)
library(sjPlot)
library(optimx)
library(segmented)
library(nlme)
library(ggplot2)
library(jtools)
set_summ_defaults(digits = 4, pvals = TRUE, robust = "HC3")
library(glmmTMB)
install.packages('sjPlot')
library(broom.mixed)
library(officer)
library(flextable)

surprise_data <- read.csv('priming_surprise.csv')
surprise_data
surprise_data$primetype <- factor(surprise_data$primetype, levels = c("a_unrelated", "related"), labels = c("unrelated", "related"))
surprise.lme <- lmer(surprise ~ primetype * relationtype  + (1|target), data = surprise_data,control=lmerControl(check.nobs.vs.nRE="ignore"))
summary(surprise.lme)

neuro_plot = plot_model(surprise.lme, type="int",
                      auto.label = FALSE,
                      axis.title = c("Prime type","Surprisal score"),
                      legend.title = "Relation type",
                      title="Interaction between surprisal score, relation type and prime type in a neural network")

neuro_plot
