/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   so_long.h                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jrinna <jrinna@student.42lyon.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/12/28 19:27:03 by jrinna            #+#    #+#             */
/*   Updated: 2022/02/02 15:19:41 by jrinna           ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#ifndef SO_LONG_H
# define SO_LONG_H

# include "../libft/libft.h"
# include "../mlx/mlx.h"
# include <fcntl.h>

# define K_A 0
# define K_D 2
# define K_S 1
# define K_W 13
# define K_ESC 53
# define SS_X 64
# define SS_Y 64

typedef struct s_vec
{
	int	x;
	int	y;
}	t_vec;

typedef struct s_win {
	void	*ptr;
	t_vec	size;
}	t_win;

typedef struct s_image
{
	void	*player;
	void	*wall;
	void	*collectible;
	void	*exit;
	void	*ground;
	t_vec	size;
	t_vec	playerpos;
}	t_img;

typedef struct s_count
{
	int	e_counter;
	int	p_counter;
	int	c_counter;
}	t_count;

typedef struct s_map
{
	char	**tab;
	t_count	counter;
	t_vec	size;
}	t_map;

typedef struct s_vars {
	void	*mlx;
	int		player_move_count;
	t_map	map;
	t_win	win;
	t_img	img;
	t_vec	img_pos;
}				t_vars;

char	*ft_get_file(int fd);
int		ft_map_parsing(t_vars *ref, int i, int j);
char	*ft_strjoin_f(char *s1, char *s2);
long	ft_strlen_s(char *str);
void	ft_end(t_vars *ref);
int		ft_input(int key, void *para);
void	ft_image_init(t_vars *ref);
int		please_stop(void *ref);
void	ft_error(int n);
void	ft_check_name(char *path, t_vars *ref);

#endif