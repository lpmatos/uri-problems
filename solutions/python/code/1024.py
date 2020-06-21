for _ in range(0, int(input())):
  string = [char for char in input()]
  for index, char in enumerate(string):
    if char.isalpha():
      string[index] = chr(ord(char) + 3)
  string = list(reversed(string))
  half = len(string)//2
  slicing_one = string[half:len(string)]
  slicing_two = string[0:half]
  for index, char in enumerate(slicing_one):
    slicing_one[index] = chr(ord(char) - 1)
  string = "".join(slicing_two) + "".join(slicing_one)
  print(string)
