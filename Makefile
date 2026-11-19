CC = gcc
CFLAGS = -Wall -Wextra -Werror -Iinclude

SRC_DIR = src
OBJ_DIR = obj

SRCS = $(shell find $(SRC_DIR) -type f -name '*.c')

OBJS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))

NAME = moth

CPPCHECK_FLAGS = --enable=warning,style,performance,portability --inconclusive \
                 --error-exitcode=1 --suppress=missingIncludeSystem -I $(SRC_DIR)
SAN_CC = gcc -g -fsanitize=address,undefined -fno-omit-frame-pointer

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(OBJS) -o $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) obj-san moth-san

re: clean
	rm -rf $(NAME)
	$(MAKE) all

lint:
	cppcheck $(CPPCHECK_FLAGS) $(SRC_DIR)/

sanitize:
	$(MAKE) OBJ_DIR=obj-san NAME=moth-san CC="$(SAN_CC)" all

ci: lint
	@for cc in gcc clang; do \
		if command -v $$cc >/dev/null 2>&1; then \
			echo "==> build with $$cc"; \
			$(MAKE) re CC=$$cc || exit 1; \
		else \
			echo "==> $$cc not found, skipped"; \
		fi; \
	done
	$(MAKE) sanitize
	@echo "==> CI checks passed"

.PHONY: all clean re lint sanitize ci