#include "libft.h"
#include "get_next_line.h"
#include <fcntl.h>
#include <stdio.h>

int	main(void)
{
	int i = 0;
	int lines_per_frame = 41;
	int frames = 162;
	char *str = NULL;
	do
	{
	int frame_line = 0;
	int index = 0;
	int fd = open("akira/akirav1.txt", O_RDWR);
		while (index < frames)
		{
			system("clear");
			frame_line = 0;
			while (frame_line < lines_per_frame)
			{
				if (str)
					free(str);
				str = get_next_line(fd);
				if (str)
				{
					ft_putstr_fd(str, 1);
					fflush(stdout);
				}
				frame_line++;
			}
			usleep(100000);
			index++;
		}
	close(fd);
	} while (1);
	free(str);
}
