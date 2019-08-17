#' This function adds a template Makefile to your prject's root directory
#'
#' This function adds a template Makefile to your prject's root directory
#' @keywords makefile make
#' @export
#' @examples
#' add_makefile()

add_makefile <- function(){
makefile_text <- "##############################################################################-
## Project:
## Date:
## Author:
##############################################################################-

# This Makefile is a template. The target and prerequisite names are made up,
# and should be replaced by you with real targets and prerequisites in order to
# work. There is a more detailed overview of how Makefiles work at the end of
# this template, which you can feel free to delete.

##############################################################################
############################## DEFINE VARIABLES ##############################
##############################################################################

# define project subdirectories
DAT = ./data
RAW = $(DAT)/raw
MUN = ./munge
ANL = ./analysis

# Search path
VPATH = $(RAW) $(DAT) $(MUN) $(ANL)

## generate report from Rmd
REND = Rscript -e \"rmarkdown::render('$<')\"
## run Rmd without generating report
KNIT = Rscript -e \"knitr::knit('$<')\"

##############################################################################
############################## LIST ALL TARGETS ##############################
##############################################################################

# List targets that are not files as .Phony
.Phony: all clean clobber

# Processed data files
data = target1.rds target2.rds

# Reports
reports = my_report.html

# All targets
all: $(data) $(reports)

clean:
	rm -f $(ANL)/*.html

clobber:
	rm -f $(DATA)/*.rds

##############################################################################
############################### MUNGE DATA ###################################
##############################################################################

target1.rds: prerequisite_script.R prerequisite1.csv prerequisite2.csv \
prerequisite3.csv
	Rscript $<

target2.rds: prerequisite_script.Rmd prerequisite4.csv prerequisite5.csv \
prerequisite6.csv
	$(KNIT)

##############################################################################
################################# REPORTS ####################################
##############################################################################

my_report.html: learner_skill_coverage.Rmd target1.rds target2.rds
	$(REND)

##############################################################################
########################## AN OVERVIEW OF MAKEFILES ##########################
##############################################################################

# Essential jargon:
# $() calls a variable
# $< calls the 1st prerequisite in a rule
# $^ calls all the prerequisites in a rule
# $@ calls the target of a rule

# Makefiles are a record of how your data project can be recreated. In a typical
# data project you will read in raw data from databases, xlsx and csv files,
# then munge that data into shape for your analysis, then generate reports of
# your findings. When you're new to working with data you might have performed
# all of these steps in one enormous Rscript of 1000+ lines. You probably
# even had several of these enormous files and found it difficult to keep track
# of when data was changed and in what order your scripts needed to
# run. Makefiles and the subdirectories they often employ are a way to avoid
# that confusion. Makefiles encourage you to write shorter scripts with targeted
# outputs, and they encourage you to save your data, scripts, and outputs in a
# routine format.

# In the midst of a data project I constantly remunge my data after I've
# performed analysis or as new data arrive.
# The beauty of a makefile is that it keeps all of the dependencies clear.
# For instance, my makefile will say what data files and analysis scripts were
# used to generate a report. If any of those data files or analysis scripts
# change, make will rebuild only the reports that depend on the files that
# changed. That is worth repeating. Make only rebuilds outputs whose prerequites
# have changed. That's the efficiency of make.

# Makefiles are compused of rules in the following format:

# target1: prerequisite_1 prerequisite_2 ... prerequisite_n
#	  command_1
#	  command_2
#	  ... # NOTE that all commands are tab-indented, not space indented.
#	  command_n

# Because all commands are tab-indented, not space indented be sure that your
# text editor is set to use tabs and NOT spaces. This can be confirmed in
# RStudio by going to \"Project Options / Code Editing\" and making sure that
# the box next to \"Insert Spaces for Tabs\" is unchecked.

# When used in R,
#  'target' will be an report output like html or pdf, or data output like
# .Rdata, .csv, or .rds files
#  'prerequisites' are typically the .R, .Rmd, and data files that create a
# given target output.
#  'commands' are shell commands that execute files e.g. Rscript(), render(), & knit()
#  NOTE that the target of one rule (such as a target that is a datafile) will
#  often be a prerequisite for a later rule that builds something from it.

# A makefile can name the locations of its target and prerequisite files explicitly ...
# reports/myreport.html: analysis/myreport.Rmd data/mydata.rds
# 	Rscript $<
# 	mv analysis/500_corr_table.html reports
#
#... or you can set all file paths in the VPATH variable and then make will
# search all of these paths for the files you have named in your recipe.
# Using VPATH can save a lot of typing.

# Other variables like $(REP) can be used in place of explicit subdirectory
# names like './reports'. Using variables in makefiles will reduce the need for
# retyping subdirectory names and decrease the chance for typos.

# OVERVIEW OF HOW MAKEFILES MAKE:
# Your makefile should be named 'Makefile' and saved in the project root directory.
# To build your project navigate to your project directory form the terminal,
# and then type 'make'.
# If any prerequisite has become newer than its target (e.g., because you changed
# a script or dataset that the target is built from), make will rerun the rule(s)
# that contain that prerequisite. This may trigger other rules to run if their
# prerequites are updated by the rerun.
#
# Typing 'make clean' in the terminal will wipe out any files matching the patterns
# you've indicated in the rule for 'clean'
# # Typing 'make clobber' in the terminal will wipe out any files matching the patterns
# you've indicated in the rule for 'clobber'
# I set 'clean' to wipe out my reports, and 'clobber' to wipe out all data but
# by raw data.
"

writeLines(makefile_text, here::here("Makefile"))
}
