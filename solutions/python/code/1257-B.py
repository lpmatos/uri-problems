import string

for _ in range(0, int(input())):
  print(sum([sum([sum([elemento, index, position]) for position, elemento in enumerate([string.ascii_lowercase.index(char.lower()) for char in input()])]) for index, _ in enumerate(range(0, int(input())))]))
  
