while True:
  one, two = [x for x in input().split()]
  if int(one) == 0 and int(two) == 0:
    break
  remove = two.replace(one, "")
  if len(remove) == 0: remove = 0
  print(int(remove))
  
