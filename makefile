CC = gcc
FLAGS = -Wall -g 


all: loops loopd recursives recursived mains maindrec maindloop

loops: libclassloops.a advancedClassificationLoop.o basicsClassification.o
	 ar -rcs libclassloops.a advancedClassificationLoop.o basicsClassification.o

recursives: advancedClassificationRecursion.o basicsClassification.o
	 ar -rcs libclassrec.a advancedClassificationRecursion.o basicsClassification.o

recursived: advancedClassificationRecursion.o basicsClassification.o
	 $(CC) -shared -o  libclassrec.so advancedClassificationRecursion.o basicsClassification.o

loopd: advancedClassificationLoop.o basicsClassification.o
	 $(CC) -shared -o libclassloops.so advancedClassificationLoop.o basicsClassification.o

mains: main.o recursives 
	 $(CC) $(FLAGS) -o mains main.o libclassrec.a -lm

maindloop: main.o 
	 $(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so -lm
	 
maindrec: main.o
	 $(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so -lm
	
basicsClassification.o: basicsClassification.c NumClass.h
	 $(CC) $(FLAGS) -c basicsClassification.c -lm
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	 $(CC) $(FLAGS) -c advancedClassificationLoop.c -lm 
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	 $(CC) $(FLAGS) -c advancedClassificationRecursion.c -lm	 	
main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c 	
	
.PHONY: all clean	
	
clean:	
	 rm -f *.o *.a *.so maindloop maindrec mains

