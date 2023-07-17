# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jrinna <jrinna@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/14 12:04:25 by jrinna            #+#    #+#              #
#    Updated: 2022/02/02 15:33:50 by jrinna           ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

-include Source.mk LSource.mk

CC = gcc

CFLAGS = -Wall -Wextra -Werror

NAME = so_long

INC = ./include/so_long.h

INCM = ./mlx

OBJ = $(SRC:.c=.o)

LIBH = ./libft/libft.h

LIBP = ./libft/libft.a

MLXP = ./mlx/libmlx.a

FRAM = -framework OpenGL -framework AppKit

${NAME}: $(LIBP) ${OBJ} Makefile | mlx
	$(CC) $(CFLAGS) $(OBJ) -I$(INC) $(FRAM) $(MLXP) $(LIBP) -o $(NAME)

$(LIBP): $(LIBH) $(LSRC)
	$(MAKE) -C ./libft

%.o : %.c $(INC)
	$(CC) $(CFLAG) -c $< -o $@

mlx :
	@$(MAKE) -C ./mlx

all : ${NAME}

clean :
	${MAKE} clean -C ./libft
	$(MAKE) clean -C ./mlx
	$(RM) ${OBJ}

fclean : clean
	$(RM) $(LIBP)
	$(RM) $(NAME)

re :
	$(MAKE) fclean
	$(MAKE) all

gmk:
	echo "SRC += " > Source.mk
	echo "LSRC += " > LSource.mk
	find source -name "*.c" | sed 's/^/SRC += /' >> Source.mk
	find libft -name "*.c" | sed 's/^/LSRC += /' >> LSource.mk

nono:
	norminette -R CheckForbiddenSourceHeader
	norminette -R CheckDefined

.PHONY : nono gmk re fclean clean all mlx