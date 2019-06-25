
adjacency_list = {}
scene_name_list = []

def get_scene_name_list(scene):
    scene_name_list.append(scene)


while True:
    edges_set = set()
    cmd1 = input("--> Input vertex ID: ")
    if cmd1 == "e" or cmd1 == "q":
        break
    while cmd1.isdigit() == False:
        cmd1 = input("--> Input vertex ID (only integers are allowed):")
    adjacency_list[int(cmd1)] = set()

    while True:
        cmd2 = input("--> Create edge betwen current vertex and other vertex: ")
        if cmd2 == "d":
            break
        while cmd2.isdigit() == False:
            cmd2 = input("--> Create edge betwen current vertex and other vertex (only integers are allowed): ")
        adjacency_list[int(cmd1)].add(int(cmd2))

    while True:
        cmd3 = input("--> Input vertex scene name: ")
        if cmd3 == "d":
            break
        elif len(scene_name_list) >= int(cmd1):
            cmd3 = input(f"--> If you would like to overwrite vertex {cmd1}'s current txt file, please confirm the new file name. If not, please type 'd'.   ")
            if cmd3 == "d":
                break
            else:
                del scene_name_list[-1]
                scene_name_list.append(cmd3)
        get_scene_name_list(cmd3)



print(adjacency_list)
print(scene_name_list)

