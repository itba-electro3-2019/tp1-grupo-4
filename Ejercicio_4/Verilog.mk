##################################
#Objective:Compile a Verilog file#
##################################
#Generate the executable of the project with this name
#Proj will be the default name but it´s expected to recive the name
#By using ?= we can set a default name if it hadn´t been given
TARGET	?=	Proj
#By having $Num we get the commands pass into it(Instresting Data)
#As the name literaly said, it´s the name of the compiler
COMPILER	=	iverilog
#Name of the files that should have
#The variable adobe is for the files.v
SRDIR	=	source
#Is the directory where the compile version will be send
BINDIR	=	execute
#Next we find all the file with the termination .v in SRDIR
#And the wildcard function is the one that do the job but
#firts we check if the file source exist
ifneq ("$(wildcard $(SRDIR))","")
	SOURCES :=	$(wildcard	$(SRDIR)/*.v)
else
	#We confirm the non-existans of source so we search in current directory
	SOURCES :=	$(wildcard	*.v)
endif
#Command to erase things
RM	=	rm -f
#We need the "Name": to execute the echo
#Here we are saying that we want it in the file BINDIR, because
# we put the $(BINDIR) now this is the default direction
#with the name TARGET also, it will tell if it´s update or not
#base on if TARGET exist and if SOURCES is more recent than
#TARGET
$(BINDIR)/$(TARGET): $(SOURCES)
#Make the directory where the object will be store if it dosen´t exist
	@mkdir -p execute
ifneq ($(value SOURCES), )
#Compiles the file in the directory just made and 
#with the $@ is the name of the rule
	@$(COMPILER) $(SOURCES) -o $@
	@echo "Compilation complete!"
else
	@echo "Compilation failed!"
endif
#We avoid not running it, in case a file name clean actually exist
.PHONY: clean
clean:
	@$(RM) $(BINDIR)/$(TARGET)
	@echo "Executable removed!"
#We eliminate the file 
	@$(RM) -rf $(BINDIR)
	@echo "Purge complete!"
#Lastly to ejecute clean you must write make -f  Verilog.mk clean if not, remove the clean at the end
#also to put a name you must write it as make TARGET="TP1_EJ4" -f Verilog.mk