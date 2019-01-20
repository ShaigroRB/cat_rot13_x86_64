CC=gcc
CFLAGS=-Wall -Werror -Wextra -pedantic -g
SRC=cat_rot13.S
OBJ=$(SRC:.S=.o)
BIN=cat

all: create_obj create_bin

create_obj:
	$(CC) $(CFLAGS) -c $(SRC) -o $(OBJ)

create_bin:
	$(CC) -o $(BIN) $(OBJ)

clean cl:
	$(RM) $(OBJ) $(BIN)
