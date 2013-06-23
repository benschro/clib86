void *memcpy(void *destination, const void *source, unsigned int num);
int puts (const char *str);

int WinMain (void) {
	char name1[] = "Pierre de Fermat";
	char name2[20];
	
	memcpy(name2, name1, 17);	
	puts(name2);

	return 0;
}

